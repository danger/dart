import 'dart:io';

import 'package:danger_dart/commands/ci_command.dart';
import 'package:danger_dart/danger_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../base/test_command_runner.dart';
import '../mock_util.mocks.dart';

void main() {
  group('CICommand', () {
    late MockDangerUtil _mockDangerUtil;
    late CICommand _ciCommand;
    late TestCommandRunner _commandRunner;

    setUp(() {
      _mockDangerUtil = MockDangerUtil();
      _ciCommand = CICommand(_mockDangerUtil);
      _commandRunner = TestCommandRunner.create(_ciCommand);

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
      await _commandRunner.run(['ci', '--verbose']);

      final result = verify(_mockDangerUtil.execShellCommand(captureAny,
              isVerbose: captureAnyNamed('isVerbose'),
              shell: captureAnyNamed('shell')))
          .captured;

      expect(result[1], equals(true));
    });

    test('Should pass process to danger-js', () async {
      await _commandRunner.run(['ci']);

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

    test('Should pass failOnErrors to danger-js', () async {
      await _commandRunner.run(['ci', '--failOnErrors']);

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
