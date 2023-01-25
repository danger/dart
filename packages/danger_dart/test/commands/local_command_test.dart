import 'dart:io';

import 'package:danger_dart/commands/local_command.dart';
import 'package:danger_dart/danger_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../base/test_command_runner.dart';
import '../mock_util.mocks.dart';

void main() {
  group('LocalCommand', () {
    late MockDangerUtil _mockDangerUtil;
    late LocalCommand _localCommand;
    late TestCommandRunner _commandRunner;

    setUp(() {
      _mockDangerUtil = MockDangerUtil();
      _localCommand = LocalCommand(_mockDangerUtil);
      _commandRunner = TestCommandRunner.create(_localCommand);

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

    test('Should pass isVerbose', () async {
      await _commandRunner.run([
        'local',
        '--verbose',
      ]);

      final result = verify(_mockDangerUtil.execShellCommand(captureAny,
              isVerbose: captureAnyNamed('isVerbose'),
              shell: captureAnyNamed('shell')))
          .captured;

      expect(result[1], equals(true));
    });

    test('Should pass base to danger-js', () async {
      await _commandRunner.run(['local', '--base', 'master']);

      final result = verify(_mockDangerUtil.execShellCommand(captureAny,
              isVerbose: captureAnyNamed('isVerbose'),
              shell: captureAnyNamed('shell')))
          .captured;

      expect(result[0], contains('--base master'));
    });

    test('Should pass staging to danger-js', () async {
      await _commandRunner.run(['local', '--staging']);

      final result = verify(_mockDangerUtil.execShellCommand(captureAny,
              isVerbose: captureAnyNamed('isVerbose'),
              shell: captureAnyNamed('shell')))
          .captured;

      expect(result[0], contains('--staging'));
    });

    test('Should pass extra args on debug mode', () async {
      await _commandRunner.run(['local', '--debug']);

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
      await _commandRunner.run(['local', '--failOnErrors']);

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
