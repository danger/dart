import 'dart:io';

import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_dart_test/src/models/dart_test_result.dart';

import 'package:path/path.dart' show join, current;

class DangerPluginDartTest {
  static Future<void> readFile(File file, {String workingDirectoryPath}) async {
    final workingPath = workingDirectoryPath ?? current;

    final line = file.readAsLinesSync();
    final results = line.map((e) => DartTestResultClass.fromRawJson(e));

    var fileName = '';
    var lineNo = 0;
    var testCaseName = '';

    results.forEach((result) {
      if (result.test?.url != null) {
        fileName = result.test.url;
        fileName = fileName.replaceFirst('file:\/\/', '');

        if (fileName.startsWith(workingPath)) {
          fileName = fileName.substring(workingPath.length + 1);
        }

        lineNo = result.test.line;
        testCaseName = result.test.name;
      }

      if (result.isFailure == true) {
        fail('''TestCase [$testCaseName] on [$fileName] was failed
```
${result.error}
${result.stackTrace}
```
''', file: fileName, line: lineNo);
      }
    });
  }
}
