import 'dart:io';

import 'package:args/args.dart';
import 'package:fimber/fimber.dart';
import 'package:process_run/shell_run.dart';
import 'package:process_run/which.dart';

final logger = FimberLog('DangerUtil');

class DangerJSMetadata {
  final String executable;

  final int majorVersion;
  final int minorVersion;
  final int patchVersion;

  DangerJSMetadata(
      {required this.executable,
      required this.majorVersion,
      required this.minorVersion,
      required this.patchVersion});
}

class DangerUtil {
  static Future<DangerJSMetadata> getDangerJSMetaData(ArgResults args) async {
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

    logger.d('Found danger-js at $dangerJSExecutable, checking version.');

    final shell = Shell(verbose: false);
    final dangerJSResult =
        await shell.runExecutableArguments(dangerJSExecutable, ['--version']);

    final dangerJSVersionStdout = dangerJSResult.stdout.toString().trim();
    logger.i('Got version $dangerJSVersionStdout');

    final versionNoRegex = RegExp(r'^([0-9]+\.[0-9]+\.[0-9]+)$');
    if (!versionNoRegex.hasMatch(dangerJSVersionStdout)) {
      throw 'danger-js not found';
    }
    final versionSplit = dangerJSVersionStdout.split('.');
    final majorVersion = int.parse(versionSplit[0]);

    if (majorVersion != 10) {
      throw 'Your danger\'s version is not 10, You need to uninstall danger ruby, or using --danger-js-path instead';
    }

    return DangerJSMetadata(
        executable: dangerJSExecutable,
        majorVersion: majorVersion,
        minorVersion: int.parse(versionSplit[1]),
        patchVersion: int.parse(versionSplit[2]));
  }
}
