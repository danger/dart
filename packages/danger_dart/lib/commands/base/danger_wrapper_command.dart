import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:fimber/fimber.dart';
import 'package:path/path.dart' show current, join;
import 'package:danger_dart/danger_util.dart';

abstract class DangerWrapperCommand extends Command {
  final DangerUtil dangerUtil;

  DangerWrapperCommand(this.dangerUtil) {
    argParser.addOption('dangerfile',
        defaultsTo: 'dangerfile.dart', help: 'Location of dangerfile');

    argParser.addOption('danger-js-path', help: 'Path to dangerJS');
    argParser.addFlag('debug', defaultsTo: false, negatable: false);
    argParser.addFlag('verbose', defaultsTo: false, negatable: false);
  }

  final _logger = FimberLog('DangerWrapperCommand');

  @override
  Future<void> run() async {
    final args = argResults;
    var url = '';

    if (name == 'pr') {
      if (args.rest.isEmpty) {
        throw 'Please provide pull request url';
      } else {
        url = args.rest[0];
      }
    }

    final isDebug = args.wasParsed('debug');
    final isVerbose = args.wasParsed('verbose');
    final useColors = (Platform.environment['TERM'] ?? '').contains('xterm');
    if (isVerbose) {
      Fimber.plantTree(DebugTree(useColors: useColors));
    } else {
      Fimber.plantTree(
          DebugTree(useColors: useColors, logLevels: ['I', 'W', 'E']));
    }

    final dangerFilePath = dangerUtil.getDangerFile(args);
    final metaData = await dangerUtil.getDangerJSMetaData(args);
    final dangerProcessCommand = <String>[
      'dart',
      'run',
      ...isDebug
          ? [
              '--observe=8181',
              '--pause-isolates-on-start',
              '--no-pause-isolates-on-exit'
            ]
          : [],
      '${dangerUtil.getScriptFilePath()}',
      'process',
      '--dangerfile',
      dangerFilePath,
    ].join(' ');

    final dangerJSCommand = <String>[
      metaData.executable,
      name,
      ...(url.isNotEmpty ? [url] : []),
      '--dangerfile',
      args['dangerfile'],
      '--process',
      "'$dangerProcessCommand'"
    ].join(' ');

    try {
      _logger.d('Arguments [$dangerJSCommand]');
      _logger.d('Run shell');

      final result = await dangerUtil.execShellCommand(dangerJSCommand,
          isVerbose: isVerbose);

      _logger.d('Run Completed');
      exitCode = result.last.exitCode;
    } catch (e) {
      if (e is Error) {
        _logger.e(e.toString(), ex: e, stacktrace: e.stackTrace);
      } else {
        _logger.e(e.toString(), ex: e);
      }
      exitCode = 1;
    }
  }
}
