import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' show join;

final JSON_ANNOTATION_REGEX = RegExp(r'json_annotation\.dart');
final JSON_VALUE_ANNOTATION_REGEX = RegExp(r'\@JsonValue');
final JSON_SERIALIZABLE_ANNOTATION_REGEX = RegExp(r'\@JsonSerializable');
final JSON_KEY_ANNOTATION_REGEX = RegExp(r'\@JsonKey');

bool notJsonAnnotationLine(String line) {
  return !JSON_ANNOTATION_REGEX.hasMatch(line) &&
      !JSON_VALUE_ANNOTATION_REGEX.hasMatch(line) &&
      !JSON_SERIALIZABLE_ANNOTATION_REGEX.hasMatch(line) &&
      !JSON_KEY_ANNOTATION_REGEX.hasMatch(line);
}

void removeJSONAnnotaionFromFile(File file) async {
  final content = await file
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .where(notJsonAnnotationLine)
      .toList();

  final sink = file.openWrite(mode: FileMode.write);

  sink.writeAll(content, '\n');
  await sink.close();
}

void main() {
  final modelDirPath = join(Directory.current.path, 'packages', 'danger_core',
      'lib', 'src', 'models');
  final modelDir = Directory(modelDirPath);
  if (!modelDir.existsSync()) {
    throw 'Couldn\'t find path $modelDirPath';
  }
  final modelList = modelDir.listSync();
  modelList
      .where((element) => !element.path.endsWith('.g.dart'))
      .map((e) => File.fromUri(e.uri))
      .forEach(removeJSONAnnotaionFromFile);
}
