import 'dart:convert';

import 'package:danger_core/danger_core.dart' as danger_dart;
import 'package:danger_core/src/utils/danger_isolate_receiver.dart';
import 'package:isolate/isolate.dart';
import 'package:test/test.dart';

void main() {
  group('Cross isolate', () {
    late DangerIsolateReceiver receiver;
    setUp(() {
      receiver = DangerIsolateReceiver({
        'danger': {
          'git': {
            'modified_files': ['README.md'],
            'created_files': [],
            'deleted_files': [],
            'commits': []
          }
        }
      });
    });

    test('should pass message correctly', () async {
      final runner = await IsolateRunner.spawn();

      await runner.run(testMessage, receiver.toMessage());
      await runner.close();

      expect(
          receiver.dangerResults.messages.first.message, equals('README.md'));
    });

    test('should pass warning correctly', () async {
      final runner = await IsolateRunner.spawn();

      await runner.run(testWarn, receiver.toMessage());
      await runner.close();

      expect(
          receiver.dangerResults.warnings.first.message, equals('README.md'));
    });

    test('should pass failure correctly', () async {
      final runner = await IsolateRunner.spawn();

      await runner.run(testFail, receiver.toMessage());
      await runner.close();

      expect(receiver.dangerResults.fails.first.message, equals('README.md'));
    });

    test('should pass markdown correctly', () async {
      final runner = await IsolateRunner.spawn();

      await runner.run(testMarkdown, receiver.toMessage());
      await runner.close();

      expect(
          receiver.dangerResults.markdowns.first.message, equals('README.md'));
    });

    test('mix result', () async {
      final runner = await IsolateRunner.spawn();

      await runner.run(testMixResult, receiver.toMessage());
      await runner.close();

      final expected =
          r'{"fails":[{"message":"Hello World fail","file":"helloworld.dart"}],"warnings":[{"message":"Hello World warn","line":10}],"messages":[{"message":"Hello World message"}],"markdowns":[],"meta":{"runtimeName":"Danger Dart","runtimeHref":"https://danger.systems/dart"}}';
      final json = jsonEncode(receiver.dangerResults);
      expect(json, equals(expected));
    });
  });
}

void testMessage(dynamic data) {
  danger_dart.Danger.setup(data);
  danger_dart.message(danger_dart.danger.git.modifiedFiles.first);
}

void testWarn(dynamic data) {
  danger_dart.Danger.setup(data);
  danger_dart.warn(danger_dart.danger.git.modifiedFiles.first);
}

void testFail(dynamic data) {
  danger_dart.Danger.setup(data);
  danger_dart.fail(danger_dart.danger.git.modifiedFiles.first);
}

void testMarkdown(dynamic data) {
  danger_dart.Danger.setup(data);
  danger_dart.markdown(danger_dart.danger.git.modifiedFiles.first);
}

void testMixResult(dynamic data) {
  danger_dart.Danger.setup(data);
  danger_dart.message('Hello World message');
  danger_dart.warn('Hello World warn', line: 10);
  danger_dart.fail('Hello World fail', file: 'helloworld.dart');
}
