import 'dart:io';

import 'package:danger_plugin_dart_test/danger_plugin_dart_test.dart';
import 'package:danger_plugin_dart_test/src/danger_dart_test_reporter.dart';
import 'package:danger_plugin_dart_test/src/models/danger_dart_error_case.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' show join, current;

class _MockDangerDartTestReporter extends DangerDartTestReporter {
  List<DangerDartErrorCase> errorCases = [];
  @override
  void reportToDanger(List<DangerDartErrorCase> errorCases) {
    this.errorCases = errorCases;
  }
}

void main() {
  group('danger_plugin_dart_test', () {
    late _MockDangerDartTestReporter reporter;

    setUp(() {
      reporter = _MockDangerDartTestReporter();
    });

    test('should process success case correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'success_results.json'));

      DangerPluginDartTest.processFile(fixtureFile,
          reporter: reporter,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(reporter.errorCases.length, equals(0));
    });

    test('should process failure case correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'fail_results.json'));

      DangerPluginDartTest.processFile(fixtureFile,
          reporter: reporter,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(reporter.errorCases.length, equals(1));

      final result = reporter.errorCases.first;
      expect(
          result.fileName, equals('test/parser/bitbucket_cloud_dsl_test.dart'));
      expect(result.lineNo, equals(10));
      expect(result.message, equals('''Expected: <801>
  Actual: <80>


package:test_api                                expect
test/parser/bitbucket_cloud_dsl_test.dart 21:7  main.<fn>.<fn>
'''));
    });

    test('should process error case correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'error_results.json'));

      DangerPluginDartTest.processFile(fixtureFile,
          reporter: reporter,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(reporter.errorCases.length, equals(1));

      final result = reporter.errorCases.first;
      expect(
          result.fileName, equals('test/parser/bitbucket_cloud_dsl_test.dart'));
      expect(result.lineNo, equals(10));
      expect(
          result.message,
          startsWith(
              '''Failed to load "/Users/core/Documents/work/hello/test/utils/period_time_test.dart":
Compilation failed
Test: /Users/core/Documents/work/hello/test/utils/period_time_test.dart
Shell: /Users/core/fvm/versions/2.0.4/bin/cache/artifacts/engine/darwin-x64/flutter_tester

'''));
    });

    test('should process error from golden testcase correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'error_golden_test.json'));

      DangerPluginDartTest.processFile(fixtureFile,
          reporter: reporter,
          workingDirectoryPath:
              '/Users/core/Documents/project/danger.dart/packages/danger_core');

      expect(reporter.errorCases.length, equals(1));

      final result = reporter.errorCases.first;
      expect(
          result.fileName, equals('test/parser/bitbucket_cloud_dsl_test.dart'));
      expect(result.lineNo, equals(10));
      expect(
          result.message,
          startsWith(
              '''══╡ EXCEPTION CAUGHT BY FLUTTER TEST FRAMEWORK ╞════════════════════════════════════════════════════
The following assertion was thrown while running async test code:
Golden "goldens/test/default.iphone11.png": Pixel test failed, 12.38% diff detected.
Failure feedback can be found at
/Users/core/Documents/work/hello/test/goldens/pages/failures
'''));
    });
  });
}
