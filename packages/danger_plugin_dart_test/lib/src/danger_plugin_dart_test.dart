import 'dart:io';

import 'package:danger_plugin_dart_test/src/danger_dart_test_reporter.dart';
import 'package:danger_plugin_dart_test/src/models/danger_dart_error_case.dart';
import 'package:danger_plugin_dart_test/src/models/dart_test_result.dart';
import 'package:danger_plugin_dart_test/src/reporters/default_test_reporter.dart';

import 'package:path/path.dart' show current;

class DangerPluginDartTest {
  /// Reporter could be `DefaultTestReporter`, `DefaultInlineTestReporter`, `BitbucketCloudTestReporter`, or any class extends `DangerDartTestReporter`
  static Future<void> processFile(File file,
      {String workingDirectoryPath, int limitMessageCharsPerLine, DangerDartTestReporter reporter}) async {
    final workingPath = workingDirectoryPath ?? current;

    final line = file.readAsLinesSync();
    final results = line.map((e) => DartTestResultClass.fromRawJson(e));

    final testMetaDataByID = <int, DartTestResultClass>{};
    final printMessageByID = <int, List<String>>{};

    void addMessageToPrintMessage(String message, int testId) {
      if (message == null || message.isEmpty) {
        return;
      }

      var msg;
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

    final failureList = results
        .where((result) => (result.testId != null &&
            result.result != null &&
            result.result != Result.SUCCESS))
        .map((result) {
      final testMetaData = testMetaDataByID[result.testId];
      final printMessage = printMessageByID[result.testId] ?? [];

      String fileName;
      int lineNo;
      String testName;

      if (testMetaData != null) {
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

        testName = testMetaData.test.name;
      }

      return DangerDartErrorCase(
        fileName: fileName,
        lineNo: lineNo,
        message: printMessage.join('\n\n'),
        testName: testName,
      );
    }).toList();

    (reporter ?? DefaultTestReporter()).reportToDanger(failureList);
  }
}
