import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';

import 'package:args/command_runner.dart';
import 'package:fimber/fimber.dart';

import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/models/danger_dsl.dart';
import 'package:path/path.dart' show current, join;

class ProcessCommand extends Command {
  ProcessCommand() {
    argParser.addOption(
      'dangerfile',
      help: 'Location of dangerfile',
    );
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
    final args = argResults!;
    final str = (await stdin.transform(utf8.decoder).toList()).join('');

    if (str.isEmpty) {
      throw 'Data not found';
    }

    final dangerFile = args['dangerfile'] as String?;
    if (dangerFile == null) {
      throw 'Dangerfile not found';
    }

    try {
      final tempFile = File('/tmp/last-dsl.json');
      if (tempFile.existsSync()) {
        tempFile.deleteSync();
      }
      tempFile.createSync();
      tempFile.writeAsStringSync(str);

      final json = jsonDecode(str);
      final danger = DangerJSON.fromJson(json);

      final executor = DangerExecutor.setupDangerStatic(danger.danger);

      final isolate = currentMirrorSystem().isolate;

      final instance =
          await isolate.loadUri(Uri.parse(join(current, 'dangerfile.dart')));

      final mainSymbol = const Symbol('main');

      final argsTemp = <String>[];

      instance.invoke(mainSymbol, argsTemp);

      stdout.write(jsonEncode(executor.toResult()));

      exitCode = 0;
    } catch (e) {
      _logger.e(e.toString(), ex: e);
      exitCode = 1;
    }
  }
}
