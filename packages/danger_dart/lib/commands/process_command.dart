import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:args/command_runner.dart';
import 'package:fimber/fimber.dart';

import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/models/danger_dsl.dart';
import 'package:danger_core/src/utils/danger_isolate_receiver.dart';
import 'package:path/path.dart' show current, join;

class ProcessCommand extends Command {
  ProcessCommand() {
    argParser.addOption(
      'dangerfile',
      help: 'Location of dangerfile',
    );
    argParser.addFlag('verbose', defaultsTo: false, negatable: false);
  }

  @override
  String get description => 'Process Dangerfile';

  @override
  String get name => 'process';

  @override
  bool get hidden => true;

  final _logger = FimberLog('ProcessCommand');

  @override
  Future<void> run() async {
    final args = argResults;
    final str = (await stdin.transform(utf8.decoder).toList()).join('');

    final isVerbose = args.wasParsed('verbose');
    final useColors = (Platform.environment['TERM'] ?? '').contains('xterm');
    if (isVerbose) {
      Fimber.plantTree(DebugTree(useColors: useColors));
    } else {
      Fimber.plantTree(
          DebugTree(useColors: useColors, logLevels: ['I', 'W', 'E']));
    }

    if (str.isEmpty) {
      throw 'Data not found';
    }

    final dangerFile = args['dangerfile'] as String;
    if (dangerFile == null) {
      throw 'Dangerfile not found';
    }

    try {
      final json = jsonDecode(str);
      //try parsing json
      final _ = DangerJSON.fromJson(json);

      final filePath = Uri.parse(join(current, 'dangerfile.dart'));
      final isolateReceiver = DangerIsolateReceiver(json);

      await spawnUri(filePath, isolateReceiver.toMessage());

      stdout.write(jsonEncode(isolateReceiver.dangerResults));

      exit(0);
    } catch (e) {
      if (e is Error) {
        _logger.e(e.toString(), ex: e, stacktrace: e.stackTrace);
      } else {
        _logger.e(e.toString(), ex: e);
      }
      exit(1);
    }
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
        [isolateExitCompleter.future, isolateErrorCompleter.future]);
  }
}
