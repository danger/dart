import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:danger_dart/danger_util.dart';
import 'package:fimber/fimber.dart';

import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/models/danger_dsl.dart';
import 'package:danger_core/src/utils/danger_isolate_receiver.dart';
import 'package:path/path.dart' show current, join;

class ProcessCommand extends Command {
  final DangerUtil _dangerUtil;
  final Stdin _stdin;
  final Stdout _stdout;

  ProcessCommand(this._dangerUtil, this._stdin, this._stdout) {
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
    final str = (await _stdin.transform(utf8.decoder).toList()).join('');

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

    DangerIsolateReceiver isolateReceiver;

    try {
      final json = jsonDecode(str);
      //try parsing json
      final _ = DangerJSON.fromJson(json);

      final filePath = Uri.parse(join(current, dangerFile));
      isolateReceiver = DangerIsolateReceiver(json);

      await _dangerUtil.spawnUri(filePath, isolateReceiver.toMessage());

      final resultStr = jsonEncode(isolateReceiver.dangerResults);
      _stdout.write(resultStr);
      await _stdout.flush();
    } catch (e) {
      if (e is Error) {
        _logger.e(e.toString(), ex: e, stacktrace: e.stackTrace);
      } else {
        _logger.e(e.toString(), ex: e);
      }
    } finally {
      isolateReceiver?.receivePort?.close();
    }
  }
}
