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
    argParser.addFlag('debug', defaultsTo: false, negatable: false);
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

    var inputStr = (await _stdin.transform(utf8.decoder).toList()).join('');

    final isDebug = args.wasParsed('debug');
    final isVerbose = args.wasParsed('verbose');
    final useColors = (Platform.environment['TERM'] ?? '').contains('xterm');
    if (isVerbose) {
      Fimber.plantTree(DebugTree(useColors: useColors));
    } else {
      Fimber.plantTree(
          DebugTree(useColors: useColors, logLevels: ['I', 'W', 'E']));
    }

    if (inputStr.isEmpty) {
      _stdout.write('danger://send-dsl');
      inputStr = (await _stdin.transform(utf8.decoder).toList()).join('');
    }

    if (inputStr.isEmpty) {
      throw 'STDIN Error get empty input';
    }

    if (!inputStr.startsWith(r'danger://dsl/')) {
      throw 'STDIN Error expect input [danger://dsl/] but got [$inputStr]';
    }

    final inputFilePath = inputStr.substring('danger://dsl/'.length);
    final inputFile = File(inputFilePath);

    if (!inputFile.existsSync()) {
      throw 'File not found [$inputFilePath]';
    }

    final str = inputFile.readAsStringSync();

    final dangerFileName = args['dangerfile'] as String;
    if (dangerFileName == null) {
      throw 'Dangerfile not found';
    }

    final dangerFile = File(join(current, dangerFileName));
    if (dangerFile.existsSync() == false) {
      throw 'Dangerfile at [${dangerFile.uri}] not found';
    }

    DangerIsolateReceiver isolateReceiver;

    try {
      final json = jsonDecode(str);
      final _ = DangerJSON.fromJson(json);

      isolateReceiver = DangerIsolateReceiver(json);

      await _dangerUtil.spawnFile(
          dangerFile, isolateReceiver.toMessage(), isDebug);

      _dangerUtil.sortDangerResult(isolateReceiver.dangerResults);

      final resultStr = jsonEncode(isolateReceiver.dangerResults);
      final tempDir = Directory.systemTemp;
      final tempFile = File(join(tempDir.path, 'danger-results.json'));
      if (tempFile.existsSync()) {
        tempFile.deleteSync();
      }
      tempFile.createSync();
      tempFile.writeAsStringSync(resultStr);

      _stdout.write('danger-results:/${tempFile.path}');
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
