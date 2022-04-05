import 'dart:io';

import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_dart_test/src/danger_dart_test_reporter.dart';
import 'package:danger_plugin_dart_test/src/models/danger_dart_error_case.dart';
import 'package:danger_plugin_dart_test/src/models/dart_test_result.dart';
import 'package:danger_plugin_dart_test/src/reporters/default_test_reporter.dart';

import 'package:path/path.dart' show current;

class DangerPluginDartTest {
  /// Reporter could be `DefaultTestReporter`, `DefaultInlineTestReporter`, `BitbucketCloudTestReporter`, or any class extends `DangerDartTestReporter`
  static Future<void> processFile(File file,
      {String? workingDirectoryPath,
      int? limitMessageCharsPerLine,
      DangerDartTestReporter? reporter}) async {
    if (!file.existsSync()) {
      fail('Test report not found, path [${file.path}]');
      return;
    }

    final workingPath = workingDirectoryPath ?? current;

    final line = file.readAsLinesSync();
    final results = line
        .map((e) => DartTestEvent.fromJsonString(e))
        .whereType<DartTestEvent>();

    final testSuiteMetaDataByID = <int, DartTestEntitySuite>{};
    final testMetaDataByID = <int, DartTestEntityTest>{};
    final printMessageByID = <int, List<String>>{};

    void addMessageToPrintMessage(String message, int testId) {
      if (message.isEmpty) {
        return;
      }

      String msg;
      if (limitMessageCharsPerLine == null) {
        msg = message;
      } else if (message.length > limitMessageCharsPerLine) {
        msg = message.substring(0, limitMessageCharsPerLine) + '...';
      } else {
        msg = message;
      }

      if (printMessageByID[testId] == null) {
        printMessageByID[testId] = [msg];
      } else {
        printMessageByID[testId]!.add(msg);
      }
    }

    for (var result in results) {
      if (result is DartTestTestStartEvent) {
        testMetaDataByID[result.test.id] = result.test;
      } else if (result is DartTestSuiteEvent) {
        testSuiteMetaDataByID[result.suite.id] = result.suite;
      } else if (result is DartTestMessageEvent) {
        if (result.messageType == 'print') {
          addMessageToPrintMessage(result.message, result.testID);
        }
      } else if (result is DartTestErrorEvent) {
        addMessageToPrintMessage(result.error, result.testID);
        addMessageToPrintMessage(result.stackTrace, result.testID);
      }
    }

    // EnumValues({"error": Result.ERROR, "failure": Result.FAILURE, "success": Result.SUCCESS});

    final failureList = results
        .whereType<DartTestTestDoneEvent>()
        .where((result) => (result.result != 'success'))
        .map((result) {
          final testMetaData = testMetaDataByID[result.testID];
          final printMessage = printMessageByID[result.testID] ?? [];

          String? fileName;
          int? lineNo;
          String? testName;

          if (testMetaData != null) {
            final url = testMetaData.url;
            if (url != null && !url.startsWith('package:')) {
              fileName = url;
              lineNo = testMetaData.line ?? 0;
            } else if (testMetaData.rootUrl != null) {
              fileName = testMetaData.rootUrl!;
              lineNo = testMetaData.rootLine ?? 0;
            } else {
              final suiteMetaData = testSuiteMetaDataByID[testMetaData.suiteID];
              if (suiteMetaData != null && suiteMetaData.path != null) {
                fileName = suiteMetaData.path!;
                lineNo = 0;
              }
            }

            if (fileName != null) {
              fileName = fileName.replaceFirst('file://', '');

              if (fileName.startsWith(workingPath)) {
                fileName = fileName.substring(workingPath.length + 1);
              }
            }

            testName = testMetaData.name;
          }

          if (fileName == null || lineNo == null || testName == null) {
            return null;
          }

          return DangerDartErrorCase(
            fileName: fileName,
            lineNo: lineNo,
            message: printMessage.join('\n\n'),
            testName: testName,
          );
        })
        .whereType<DangerDartErrorCase>()
        .toList();

    if (failureList.isNotEmpty) {
      (reporter ?? DefaultTestReporter()).reportToDanger(failureList);
    }
  }
}
