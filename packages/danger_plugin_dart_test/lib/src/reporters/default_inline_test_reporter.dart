import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_dart_test/src/danger_dart_test_reporter.dart';
import 'package:danger_plugin_dart_test/src/models/danger_dart_error_case.dart';

class DefaultInlineTestReporter extends DangerDartTestReporter {
  @override
  void reportToDanger(List<DangerDartErrorCase> errorCases) {
    fail('Found ${errorCases.length} failure cases.');
    for (var element in errorCases) {
      fail('''${element.fileName}#L${element.lineNo}
Name: ${element.testName}
```
${element.message}
```
''', file: element.fileName, line: element.lineNo);
    }
  }
}
