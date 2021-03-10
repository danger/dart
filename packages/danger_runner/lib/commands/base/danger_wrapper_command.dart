import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:fimber/fimber.dart';
import 'package:path/path.dart' show current, join;
import 'package:process_run/shell.dart';
import 'package:danger_runner/danger_util.dart';

abstract class DangerWrapperCommand extends Command {
  DangerWrapperCommand() {
    argParser.addOption('dangerfile',
        defaultsTo: 'dangerfile.dart', help: 'Location of dangerfile');

    argParser.addOption('danger-js-path', help: 'Path to dangerJS');
    argParser.addFlag('verbose', defaultsTo: false, negatable: false);
  }

  final _logger = FimberLog('DangerWrapperCommand');

  @override
  Future<void> run() async {
    final args = argResults!;
    var url = '';

    if (name == 'ci' || name == 'pr') {
      if (args.rest.isEmpty) {
        throw 'Please provide pull request url';
      } else {
        url = args.rest[0];
      }
    }

    final isVerbose = args.wasParsed('verbose');
    if (isVerbose) {
      Fimber.plantTree(DebugTree(useColors: true));
    } else {
      Fimber.plantTree(DebugTree(useColors: true, logLevels: ['I', 'W', 'E']));
    }

    late String dangerFilePath;
    if (File(args['dangerfile']).existsSync()) {
      dangerFilePath = args['dangerfile'];
    } else if (File(join(current, args['dangerfile'])).existsSync()) {
      dangerFilePath = join(current, args['dangerfile']);
    } else {
      throw 'dangerfile not found';
    }

    final metaData = await DangerUtil.getDangerJSMetaData(args);
    final dangerProcess =
        'dart ${Platform.script.toFilePath()} process --dangerfile "$dangerFilePath"';

    final dangerJSCommand = <String>[
      metaData.executable,
      name,
      url,
      '--dangerfile',
      args['dangerfile'],
      '--process',
      "'$dangerProcess'"
    ];

    final shell = Shell(
        verbose: true,
        environment: {'DEBUG': isVerbose ? '*' : ''},
        runInShell: true,
        includeParentEnvironment: true);
    _logger.d('Prepare shell');
    try {
      _logger.d('Arguments [${dangerJSCommand.join(" ")}]');
      _logger.d('Run shell');

      final result = await shell.run(dangerJSCommand.join(' '));

      _logger.d('Run Completed');
      exitCode = result.last.exitCode;
    } catch (e) {
      _logger.e(e.toString(), ex: e);
      exitCode = 1;
    }
  }
}
