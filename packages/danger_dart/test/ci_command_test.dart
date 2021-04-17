import 'dart:io';

import 'package:danger_dart/commands/ci_command.dart';
import 'package:danger_dart/danger_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'test_command_runner.dart';

class _MockDangerUtil extends Mock implements DangerUtil {}

void main() {
  group('CICommand', () {
    _MockDangerUtil _mockDangerUtil;
    CICommand _ciCommand;
    TestCommandRunner _commandRunner;

    setUp(() {
      _mockDangerUtil = _MockDangerUtil();
      _ciCommand = CICommand(_mockDangerUtil);
      _commandRunner = TestCommandRunner.create(_ciCommand);

      when(_mockDangerUtil.getDangerJSMetaData(any, shell: anyNamed('shell')))
          .thenAnswer((realInvocation) async {
        return DangerJSMetadata(
            executable: '/usr/local/danger-js',
            majorVersion: 10,
            minorVersion: 0,
            patchVersion: 0);
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
  });
}
