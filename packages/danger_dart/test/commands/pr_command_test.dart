import 'dart:io';

import 'package:danger_dart/commands/pr_command.dart';
import 'package:danger_dart/danger_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../base/test_command_runner.dart';
import '../mock_util.mocks.dart';

void main() {
  group('PRCommand', () {
    late MockDangerUtil _mockDangerUtil;
    late PRCommand _prCommand;
    late TestCommandRunner _commandRunner;

    setUp(() {
      _mockDangerUtil = MockDangerUtil();
      _prCommand = PRCommand(_mockDangerUtil);
      _commandRunner = TestCommandRunner.create(_prCommand);

      when(_mockDangerUtil.getDangerJSMetaData(any, shell: anyNamed('shell')))
          .thenAnswer((realInvocation) async {
        return DangerJSMetadata(executable: '/usr/local/danger-js');
      });

      when(_mockDangerUtil.execShellCommand(captureAny,
              isVerbose: captureAnyNamed('isVerbose'),
              shell: captureAnyNamed('shell')))
          .thenAnswer((realInvocation) async {
        return [ProcessResult(pid, 0, stdout, stderr)];
      });

      when(_mockDangerUtil.getDangerFile(any))
          .thenReturn('mock_danger_file.dart');

      when(_mockDangerUtil.getScriptFilePath())
          .thenReturn('danger/danger_dart.dart');
    });

    test('Should pass url to danger-js', () async {
      await _commandRunner.run(['pr', 'https://www.github.com']);

      final result = verify(_mockDangerUtil.execShellCommand(captureAny,
              isVerbose: captureAnyNamed('isVerbose'),
              shell: captureAnyNamed('shell')))
          .captured;

      expect(result.first, contains('https://www.github.com'));
    });

    test('Should pass isVerbose', () async {
      await _commandRunner.run(['pr', '--verbose', 'https://www.github.com']);

      final result = verify(_mockDangerUtil.execShellCommand(captureAny,
              isVerbose: captureAnyNamed('isVerbose'),
              shell: captureAnyNamed('shell')))
          .captured;

      expect(result[1], equals(true));
    });

    test('Should pass process to danger-js', () async {
      await _commandRunner.run(['pr', 'https://www.github.com']);

      final result = verify(_mockDangerUtil.execShellCommand(captureAny,
              isVerbose: captureAnyNamed('isVerbose'),
              shell: captureAnyNamed('shell')))
          .captured;
      final processCommand =
          result.first.toString().split('--process').last.trim();

      expect(
          processCommand,
          equals(
              "'dart run danger/danger_dart.dart process --dangerfile mock_danger_file.dart'"));
    });

    test('Should pass extra args on debug mode', () async {
      await _commandRunner.run(['pr', '--debug', 'https://www.github.com']);

      final result = verify(_mockDangerUtil.execShellCommand(captureAny,
              isVerbose: captureAnyNamed('isVerbose'),
              shell: captureAnyNamed('shell')))
          .captured;

      final processCommand =
          result.first.toString().split('--process').last.trim();

      expect(processCommand, contains('--observe=8181'));
      expect(processCommand, contains('--no-pause-isolates-on-exit'));

      expect(processCommand, contains('--debug'));
    });

    test('Should pass failOnErrors to danger-js', () async {
      await _commandRunner
          .run(['pr', 'https://www.github.com', '--failOnErrors']);

      final result = verify(_mockDangerUtil.execShellCommand(captureAny,
              isVerbose: captureAnyNamed('isVerbose'),
              shell: captureAnyNamed('shell')))
          .captured;
      final processCommand =
          result.first.toString().split('--process').first.trim();

      expect(processCommand, contains("--failOnErrors"));
    });
  });
}
