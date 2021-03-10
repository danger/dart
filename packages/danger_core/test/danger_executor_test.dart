import 'dart:convert';

import 'package:danger_core/src/danger_executor.dart' as danger;
import 'package:danger_core/src/models/danger_dsl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class _MockDangerJSONDSL extends Mock implements DangerJSONDSL {}

void main() {
  group('danger_executor_static', () {
    late danger.DangerExecutor executor;
    late _MockDangerJSONDSL mockDSL;
    setUp(() {
      mockDSL = _MockDangerJSONDSL();
      executor = danger.DangerExecutor.setupDangerStatic(mockDSL);
    });

    test('violation should be empty on the first time', () {
      expect(executor.messages.length, equals(0));
      expect(executor.fails.length, equals(0));
      expect(executor.warnings.length, equals(0));
      expect(executor.markdowns.length, equals(0));
    });

    test('should add violation to messages when message() called', () {
      danger.message('Hello World message');

      expect(executor.messages.length, equals(1));
      expect(executor.messages.first.message, equals('Hello World message'));
    });

    test('should add violation to fails when fail() called', () {
      danger.fail('Hello World fail', file: 'helloworld.dart');

      expect(executor.fails.length, equals(1));
      expect(executor.fails.first.message, equals('Hello World fail'));
      expect(executor.fails.first.file, equals('helloworld.dart'));
    });

    test('should add violation to warnings when warn() called', () {
      danger.warn('Hello World warn', line: 10);

      expect(executor.warnings.length, equals(1));
      expect(executor.warnings.first.message, equals('Hello World warn'));
      expect(executor.warnings.first.line, equals(10));
    });

    test('should add violation to markdowns when markdown() called', () {
      danger.markdown('Hello World markdown');

      expect(executor.markdowns.length, equals(1));
      expect(executor.markdowns.first.message, equals('Hello World markdown'));
    });

    test('toResult should return map with all 4 keys', () {
      danger.message('Hello World message');
      danger.markdown('Hello World markdown');
      danger.warn('Hello World warn', line: 10);
      danger.fail('Hello World fail', file: 'helloworld.dart');

      final result = executor.toResult();
      expect(result['fails']!.length, equals(1));
      expect(result['markdowns']!.length, equals(1));
      expect(result['messages']!.length, equals(1));
      expect(result['warnings']!.length, equals(1));
    });

    test('snapshot result', () {
      danger.message('Hello World message');
      danger.warn('Hello World warn', line: 10);
      danger.fail('Hello World fail', file: 'helloworld.dart');

      final result = executor.toResult();
      final expected =
          r'{"fails":[{"message":"Hello World fail","file":"helloworld.dart","line":null,"icon":null}],"markdowns":[],"messages":[{"message":"Hello World message","file":null,"line":null,"icon":null}],"warnings":[{"message":"Hello World warn","file":null,"line":10,"icon":null}]}';
      final json = jsonEncode(result);
      expect(json, equals(expected));
    });
  });
}
