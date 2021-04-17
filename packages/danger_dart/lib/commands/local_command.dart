import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:danger_dart/danger_util.dart';
import 'package:fimber/fimber.dart';
import 'package:path/path.dart' show current, join;

class LocalCommand extends Command {
  final DangerUtil dangerUtil;
  final _logger = FimberLog('LocalCommand');

  LocalCommand(this.dangerUtil) {
    argParser.addOption('dangerfile',
        defaultsTo: 'dangerfile.dart', help: 'Location of dangerfile');

    argParser.addOption('danger-js-path', help: 'Path to dangerJS');
    argParser.addOption('base',
        help: 'Use a different base branch', valueHelp: 'branch_name');

    argParser.addFlag('staging',
        defaultsTo: false, negatable: false, help: 'Just use staged changes.');
    argParser.addFlag('debug', defaultsTo: false, negatable: false);
    argParser.addFlag('verbose', defaultsTo: false, negatable: false);
  }

  @override
  String get description =>
      'Runs danger standalone on a repo, useful for git hooks';

  @override
  String get name => 'local';

  @override
  Future<void> run() async {
    final args = argResults;
    final isDebug = args.wasParsed('debug');
    final isVerbose = args.wasParsed('verbose');
    final useColors = (Platform.environment['TERM'] ?? '').contains('xterm');
    if (isVerbose) {
      Fimber.plantTree(DebugTree(useColors: useColors));
    } else {
      Fimber.plantTree(
          DebugTree(useColors: useColors, logLevels: ['I', 'W', 'E']));
    }

    String dangerFilePath;
    if (File(args['dangerfile']).existsSync()) {
      dangerFilePath = args['dangerfile'];
    } else if (File(join(current, args['dangerfile'])).existsSync()) {
      dangerFilePath = join(current, args['dangerfile']);
    } else {
      throw 'dangerfile not found';
    }

    final metaData = await dangerUtil.getDangerJSMetaData(args);
    final dangerProcessCommand = <String>[
      'dart',
      'run',
      ...isDebug
          ? [
              '--observe',
              '--pause-isolates-on-start',
              '--no-pause-isolates-on-exit'
            ]
          : [],
      '${Platform.script.toFilePath()}',
      'process',
      '--dangerfile',
      dangerFilePath,
    ].join(' ');

    final dangerJSCommand = <String>[
      metaData.executable,
      name,
      '--dangerfile',
      args['dangerfile'],
      '--process',
      '"$dangerProcessCommand"',
      ...(argResults['base'] != null ? ['--base', argResults['base']] : []),
      ...(argResults['staging'] ? ['--staging'] : []),
    ].join(' ');

    try {
      _logger.d('Arguments [$dangerJSCommand]');
      _logger.d('Run shell');

      final result = await dangerUtil.execShellCommand(dangerJSCommand,
          isVerbose: isVerbose);

      _logger.d('Run Completed');
      exitCode = result.last.exitCode;
    } catch (e) {
      _logger.e(e.toString());
      exitCode = 1;
    }
  }
}
