import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';
import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/danger_incoming_message.dart';
import 'package:path/path.dart';

void main(List<String> arguments) async {
  final file = File(join(current, 'danger-3.dsl.json'));
  final str = file.readAsStringSync();
  final json = jsonDecode(str);


  final rootSchema = DangerRootSchema.fromJson(json);
  final schema = rootSchema.danger;

  final executor = DangerExecutor(schema);
  final isolate = currentMirrorSystem().isolate;

  final instance =
      await isolate.loadUri(Uri.parse(join(current, 'dangerfile.dart')));

  final mainSymbol = const Symbol('main');

  instance.invoke(mainSymbol, [executor]);

  print(executor.getResult());
}
