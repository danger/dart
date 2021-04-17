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

      DangerPluginDartTest.processFile(fixtureFile,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(_mockDanger.failList.length, equals(0));
      expect(_mockDanger.warningList.length, equals(0));
      expect(_mockDanger.markdownList.length, equals(0));
      expect(_mockDanger.messageList.length, equals(0));
    });

    test('should process inline failure case correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'fail_results.json'));

      DangerPluginDartTest.processFile(fixtureFile,
          inline: true,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(_mockDanger.failList.length, equals(1));

      final result = _mockDanger.failList.first;
      expect(result.file, equals('test/parser/bitbucket_cloud_dsl_test.dart'));
      expect(result.line, equals(10));
      expect(result.message, equals('''test/parser/bitbucket_cloud_dsl_test.dart#L10
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

    test('should process not inline failure case correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'fail_results.json'));

      DangerPluginDartTest.processFile(fixtureFile,
          inline: false,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(_mockDanger.failList.length, equals(1));

      final result = _mockDanger.failList.first;
      expect(result.file, isNull);
      expect(result.line, isNull);
      expect(result.message, equals('''test/parser/bitbucket_cloud_dsl_test.dart#L10
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


    test('should process error case correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'error_results.json'));

      DangerPluginDartTest.processFile(fixtureFile,
          inline: true,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(_mockDanger.failList.length, equals(1));

      final result = _mockDanger.failList.first;
      expect(result.file, equals('test/parser/bitbucket_cloud_dsl_test.dart'));
      expect(result.line, equals(10));
      expect(result.message, startsWith('''test/parser/bitbucket_cloud_dsl_test.dart#L10
```
Failed to load "/Users/core/Documents/work/hello/test/utils/period_time_test.dart":
Compilation failed
Test: /Users/core/Documents/work/hello/test/utils/period_time_test.dart
Shell: /Users/core/fvm/versions/2.0.4/bin/cache/artifacts/engine/darwin-x64/flutter_tester

'''));

      expect(_mockDanger.warningList.length, equals(0));
      expect(_mockDanger.markdownList.length, equals(0));
      expect(_mockDanger.messageList.length, equals(0));
    });


    test('should process error from golden testcase correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'error_golden_test.json'));

      DangerPluginDartTest.processFile(fixtureFile,
          inline: true,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(_mockDanger.failList.length, equals(1));

      final result = _mockDanger.failList.first;
      expect(result.file, equals('test/parser/bitbucket_cloud_dsl_test.dart'));
      expect(result.line, equals(10));
      expect(result.message, startsWith('''test/parser/bitbucket_cloud_dsl_test.dart#L10
```
══╡ EXCEPTION CAUGHT BY FLUTTER TEST FRAMEWORK ╞════════════════════════════════════════════════════
The following assertion was thrown while running async test code:
Golden "goldens/test/default.iphone11.png": Pixel test failed, 12.38% diff detected.
Failure feedback can be found at
/Users/core/Documents/work/hello/test/goldens/pages/failures
'''));

      expect(_mockDanger.warningList.length, equals(0));
      expect(_mockDanger.markdownList.length, equals(0));
      expect(_mockDanger.messageList.length, equals(0));
    });
  });
}
