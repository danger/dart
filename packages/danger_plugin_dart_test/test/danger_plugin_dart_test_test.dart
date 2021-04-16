import 'dart:io';

import 'package:danger_plugin_dart_test/danger_plugin_dart_test.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' show join, current;
import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/utils/danger_isolate_sender_mock.dart';

void main() {
  group('danger_plugin_dart_test', () {
    DangerIsolateSenderMock _mockDanger;

    setUp(() {
      _mockDanger = Danger.setupWithMock();
    });

    test('should process success case correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'success_results.json'));

      DangerPluginDartTest.readFile(fixtureFile,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(_mockDanger.failList.length, equals(0));
      expect(_mockDanger.warningList.length, equals(0));
      expect(_mockDanger.markdownList.length, equals(0));
      expect(_mockDanger.messageList.length, equals(0));
    });

    test('should process failure case correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'fail_results.json'));

      DangerPluginDartTest.readFile(fixtureFile,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(_mockDanger.failList.length, equals(1));

      final result = _mockDanger.failList.first;
      expect(result.file, equals('test/danger_isolate_sender_test.dart'));
      expect(result.line, equals(65));
      expect(
          result.message,
          equals(
              '''TestCase [DangerIsolateSender should add multiple violations correctly] on [test/danger_isolate_sender_test.dart] was failed
```
Expected: <801>
  Actual: <80>

package:test_api                                expect
test/parser/bitbucket_cloud_dsl_test.dart 21:7  main.<fn>.<fn>

```
'''));

      expect(_mockDanger.warningList.length, equals(0));
      expect(_mockDanger.markdownList.length, equals(0));
      expect(_mockDanger.messageList.length, equals(0));
    });
  });
}
