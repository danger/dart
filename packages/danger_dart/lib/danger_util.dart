import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:meta/meta.dart';
import 'package:args/args.dart';
import 'package:fimber/fimber.dart';
import 'package:process_run/shell.dart';
import 'package:process_run/which.dart';
import 'package:path/path.dart' show current, join;

final logger = FimberLog('DangerUtil');

class DangerJSMetadata {
  final String executable;

  DangerJSMetadata({@required this.executable});
}

class DangerUtil {
  const DangerUtil();

  String getScriptFilePath() {
    return Platform.script.toFilePath();
  }

  String getDangerFile(ArgResults args) {
    if (File(args['dangerfile']).existsSync()) {
      return args['dangerfile'];
    } else if (File(join(current, args['dangerfile'])).existsSync()) {
      return join(current, args['dangerfile']);
    }
    throw 'dangerfile not found';
  }

  Future<List<ProcessResult>> execShellCommand(String command,
      {Shell shell, @required bool isVerbose}) async {
    final _shell = shell ??
        Shell(
            verbose: true,
            environment: {'DEBUG': isVerbose ? '*' : ''},
            runInShell: true,
            includeParentEnvironment: true);
    return await _shell.run(command);
  }

  Future<DangerJSMetadata> getDangerJSMetaData(ArgResults args,
      {Shell shell}) async {
    var dangerJSExecutable = '';

    if (args['danger-js-path'] != null) {
      logger.i('Finind out danger from --danger-js-path');
      final path = args['danger-js-path'];
      final file = File(path);
      if (file.existsSync()) {
        dangerJSExecutable = path;
      } else {
        throw 'please provide the corrent path for --danger-js-path';
      }
    } else {
      logger.i('Finding out where the danger executable is');

      final dangerJS = whichSync('danger');
      if (dangerJS != null) {
        dangerJSExecutable = dangerJS;
      } else {
        throw 'danger-js not found, please install danger-js, or run with --danger-js-path';
      }
    }

    final _shell = shell ?? Shell(verbose: false);
    final dangerJSHelpResult =
        await _shell.runExecutableArguments(dangerJSExecutable, ['--help']);

    final helpResult = dangerJSHelpResult.stdout.toString().trim();
    if (!helpResult.contains(r'danger.systems/js')) {
      throw 'Your danger is not JS version, You need to uninstall danger ruby, or using --danger-js-path instead';
    }

    return DangerJSMetadata(executable: dangerJSExecutable);
  }

  Future<void> spawnUri(Uri uri, dynamic message) async {
    final exitPort = ReceivePort();
    final errorPort = ReceivePort();

    final isolateExitCompleter = Completer();
    final isolateErrorCompleter = Completer();

    exitPort.listen((message) {
      isolateExitCompleter.complete();
    });

    errorPort.listen((message) {
      isolateErrorCompleter.completeError(message);
    });

    final currentIsolate = await Isolate.spawnUri(uri, [], message,
        automaticPackageResolution: true,
        paused: true,
        onExit: exitPort.sendPort);
    currentIsolate.resume(currentIsolate.pauseCapability);
    return Future.any(
        [isolateExitCompleter.future, isolateErrorCompleter.future]).then((value) {
          exitPort.close();
          errorPort.close();
          currentIsolate.kill(priority: Isolate.immediate);
        });
  }
}
