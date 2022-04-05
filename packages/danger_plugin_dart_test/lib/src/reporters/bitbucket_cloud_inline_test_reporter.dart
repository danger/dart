// ignore_for_file: unnecessary_string_escapes

import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_dart_test/src/danger_dart_test_reporter.dart';
import 'package:danger_plugin_dart_test/src/models/danger_dart_error_case.dart';

class BitbucketCloudInlineTestReporter extends DangerDartTestReporter {
  @override
  void reportToDanger(List<DangerDartErrorCase> errorCases) {
    fail(
        '${errorCases.length} Tests have failed, see below for more information.');

    final modifiedFiles =
        (danger.git.modifiedFiles + danger.git.createdFiles).toSet();

    final normalCases = errorCases
        .where((element) => (!modifiedFiles.contains(element.fileName)));
    final inlineCases =
        errorCases.where((element) => modifiedFiles.contains(element.fileName));

    if (normalCases.isNotEmpty) {
      var testResultsTable =
          '\n→  \n\n   \n\n\n   \n\n\n#### ❗️\[danger_plugin_dart_test\] Error Messages ️❗️\n\n---\n\n';

      for (var element in normalCases) {
        testResultsTable +=
            '\n\n❌ Fail in \`${element.fileName}:${element.lineNo}\`';

        testResultsTable += '\n\nName \`${element.testName}\`\n';

        testResultsTable +=
            '\n\n#### Message\n\n\`\`\`\n${element.message}\n\`\`\`\n\n';

        testResultsTable += '\n\n---\n\n';
      }

      markdown(testResultsTable);
    }

    for (var element in inlineCases) {
      fail('''Test Failed 
> Name: `${element.testName}`
#### Message
```
${element.message}
```
''', file: element.fileName, line: element.lineNo);
    }
  }
}
