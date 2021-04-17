import 'dart:io';

import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_dart_test/src/models/dart_test_result.dart';

import 'package:path/path.dart' show join, current;

class DangerPluginDartTest {
  static Future<void> processFile(File file,
      {String workingDirectoryPath, bool inline = true}) async {
    final workingPath = workingDirectoryPath ?? current;

    final line = file.readAsLinesSync();
    final results = line.map((e) => DartTestResultClass.fromRawJson(e));

    final testMetaDataByID = <int, DartTestResultClass>{};
    final printMessageByID = <int, List<String>>{};

    void addMessageToPrintMessage(String message, int testId) {
      if (message == null || message.isEmpty) {
        return;
      }
      final msg = message.length > 1000 ? message.substring(0, 1000) + '...' : message;
      if (printMessageByID[testId] == null) {
        printMessageByID[testId] = [msg];
      } else {
        printMessageByID[testId].add(msg);
      }
    }

    results.forEach((result) {
      if (result.test?.id != null) {
        testMetaDataByID[result.test.id] = result;
      }

      final thisTestID = result.testId;
      if (thisTestID != null) {
        if (result.messageType == MessageType.PRINT) {
          addMessageToPrintMessage(result.message, thisTestID);
        }

        if (result.error != null) {
          addMessageToPrintMessage(result.error, thisTestID);
          addMessageToPrintMessage(result.stackTrace, thisTestID);
        }
      }
    });

    results.forEach((result) {
      if (result.testId != null && result.result != null && result.result != Result.SUCCESS) {
        final testMetaData = testMetaDataByID[result.testId];
        final printMessage = printMessageByID[result.testId] ?? [];

        if (testMetaData != null) {
          String fileName;
          int lineNo;

          if (testMetaData.test?.url != null) {
            if (!testMetaData.test.url.startsWith('package\:')) {
              fileName = testMetaData.test.url;
              lineNo = testMetaData.test.line;
            } else if (testMetaData.test.rootUrl != null) {
              fileName = testMetaData.test.rootUrl;
              lineNo = testMetaData.test.rootLine;
            }
            if (fileName != null) {
              fileName = fileName.replaceFirst('file:\/\/', '');

              if (fileName.startsWith(workingPath)) {
                fileName = fileName.substring(workingPath.length + 1);
              }
            }
          }

          if (inline && fileName != null && fileName.startsWith('package\:') == false) {
            fail('''$fileName#L$lineNo
```
${printMessage.join('\n\n')}
```
''', file: fileName, line: lineNo);
          } else {
            fail('''$fileName#L$lineNo
```
${printMessage.join('\n\n')}
```
''');
          }
        }
      }
    });
  }
}
