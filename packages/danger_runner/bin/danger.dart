import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';
import 'package:args/args.dart';
import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/models/danger_dsl.dart';
import 'package:fimber/fimber.dart';
import 'package:path/path.dart';
import 'package:fimber_io/fimber_io.dart';

final logger = FimberLog('Danger.Dart');

void main(List<String> arguments) async {
  var parser = ArgParser(
    allowTrailingOptions: false,
  );
  parser.addFlag('verbose', defaultsTo: false);

  final args = parser.parse(arguments);

  if (args['verbose']) {
    Fimber.plantTree(FimberFileTree.elapsed('/tmp/danger.dart.log'));
  }

  logger.i('Start Process');

  final str = (await stdin.transform(utf8.decoder).toList()).join('');

  logger.i(str);
  if (str.isEmpty) {
    throw 'Data not found';
  }

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

  exit(0);
  // print(executor.getResult());
}
