import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:args/args.dart';
import 'package:fimber/fimber.dart';
import 'package:process_run/shell.dart';
import 'package:path/path.dart' show current, join;
// ignore: implementation_imports
import 'package:danger_core/src/models/danger_results.dart' show DangerResults;
// ignore: implementation_imports
import 'package:danger_core/src/models/violation.dart' show Violation;

final logger = FimberLog('DangerUtil');

class DangerJSMetadata {
  final String executable;

  DangerJSMetadata({required this.executable});
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
      {Shell? shell, required bool isVerbose}) async {
    final _shell = shell ??
        Shell(
            verbose: true,
            environment: {'DEBUG': isVerbose ? '*' : ''},
            runInShell: true,
            includeParentEnvironment: true);
    return await _shell.run(command);
  }

  Future<DangerJSMetadata> getDangerJSMetaData(ArgResults args,
      {Shell? shell}) async {
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

  Future<void> spawnFile(File dangerFile, dynamic message, bool isDebug) async {
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

    final tempDangerFile = _createTempDangerFile(dangerFile, isDebug);

    final currentIsolate = await Isolate.spawnUri(
        tempDangerFile.uri, [], message,
        automaticPackageResolution: true,
        paused: true,
        onExit: exitPort.sendPort);
    if (currentIsolate.pauseCapability != null) {
      currentIsolate.resume(currentIsolate.pauseCapability!);
    }
    return Future.any(
            [isolateExitCompleter.future, isolateErrorCompleter.future])
        .whenComplete(() {
      exitPort.close();
      errorPort.close();
      currentIsolate.kill(priority: Isolate.immediate);
      if (tempDangerFile.existsSync()) {
        tempDangerFile.deleteSync();
      }
    });
  }

  File _createTempDangerFile(File dangerFile, bool isDebug) {
    final tempFilePath = '${dangerFile.path}.g.dart';
    final tempFile = File(tempFilePath);
    if (tempFile.existsSync()) {
      tempFile.deleteSync();
    }
    tempFile.createSync();
    tempFile.writeAsStringSync('''
// @dart=2.7
import 'dart:developer';

import 'package:danger_core/danger_core.dart';
import './${dangerFile.path}' as danger_file;

void main(List<String> args, dynamic data) {
  Danger.setup(data);
${isDebug ? '  debugger();' : ''}

  danger_file.main();
}
''');
    return tempFile;
  }

  void sortDangerResult(DangerResults results) {
    results.fails.sort(_sortViolation);
    results.warnings.sort(_sortViolation);
    results.messages.sort(_sortViolation);
    results.markdowns.sort(_sortViolation);
  }

  int _sortViolation(Violation left, Violation right) {
    if (left.file == null && right.file == null) {
      // Both null
      return 0;
    } else if (left.file == null) {
      // Left null
      return -1;
    } else if (right.file == null) {
      // Right null
      return 1;
    }

    // Not null
    if (left.file == right.file) {
      // Same file compare with line instead
      return left.line!.compareTo(right.line!);
    } else {
      // Not same file compare with filename
      return left.file!.compareTo(right.file!);
    }
  }
}
