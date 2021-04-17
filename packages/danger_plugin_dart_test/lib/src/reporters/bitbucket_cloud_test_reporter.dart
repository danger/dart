import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_dart_test/src/danger_dart_test_reporter.dart';
import 'package:danger_plugin_dart_test/src/models/danger_dart_error_case.dart';

class BitbucketCloudTestReporter extends DangerDartTestReporter {
  @override
  void reportToDanger(List<DangerDartErrorCase> errorCases) {
    fail(
        '${errorCases.length} Tests have failed, see below for more information.');

    var testResultsTable =
        '\n→  \n\n   \n\n\n   \n\n\n#### ❗️\[danger_plugin_dart_test\] Error Messages ️❗️\n\n---\n\n';

    errorCases.forEach((element) {
      testResultsTable +=
          '\n\n❌ Fail in \`${element.fileName}:${element.lineNo}\`';

      testResultsTable += '\n\nName \`${element.testName}\`\n';

      testResultsTable +=
          '`\n\n#### Message\n\n\`\`\`\n${element.message}\n\`\`\`\n\n`';

      testResultsTable += '\n\n---\n\n';
    });

    markdown(testResultsTable);
  }
}
