import 'dart:io';
import 'dart:isolate';

import 'package:danger_core/danger_core.dart';
import 'package:danger_dart/commands/process_command.dart';
import 'package:danger_dart/danger_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' show join, current;
import 'package:danger_core/src/models/danger_core_constants.dart';

import '../base/test_command_runner.dart';

class _MockDangerUtil extends Mock implements DangerUtil {}

class _MockStdin extends Mock implements Stdin {}

class _MockStdout extends Mock implements Stdout {}

void main() {
  group('ProcessCommand', () {
    _MockDangerUtil _mockDangerUtil;
    _MockStdin _mockStdin;
    _MockStdout _mockStdout;
    ProcessCommand _processCommand;
    TestCommandRunner _commandRunner;

    setUp(() {
      _mockDangerUtil = _MockDangerUtil();
      _mockStdin = _MockStdin();
      _mockStdout = _MockStdout();
      _processCommand = ProcessCommand(_mockDangerUtil, _mockStdin, _mockStdout);
      _commandRunner = TestCommandRunner.create(_processCommand);

      when(_mockDangerUtil.getDangerJSMetaData(any, shell: anyNamed('shell')))
          .thenAnswer((realInvocation) async {
        return DangerJSMetadata(executable: '/usr/local/danger-js');
      });

      when(_mockDangerUtil.spawnUri(captureAny, captureAny))
          .thenAnswer((realInvocation) async {});

      when(_mockDangerUtil.getDangerFile(any))
          .thenReturn('mock_danger_file.dart');

      when(_mockDangerUtil.getScriptFilePath())
          .thenReturn('danger/danger_dart.dart');

      when(_mockStdin.transform(any)).thenAnswer((realInvocation) {
        final fixtureFile =
            File(join(current, 'test', 'fixtures', 'bbc-dsl-input.json'));

        final str = fixtureFile.readAsStringSync();
        return Stream<String>.value(str);
      });

      when(_mockStdout.flush()).thenAnswer((realInvocation) async {});
    });

    test('Should pass dangerfile', () async {
      await _commandRunner
          .run(['process', '--dangerfile', 'hello.dart', '--verbose']);

      final result =
          verify(_mockDangerUtil.spawnUri(captureAny, captureAny)).captured;
      final url = result[0];
      expect(url.toString(), endsWith('/hello.dart'));
    });

    test('Should pass sendPort in message key DANGER_SEND_PORT_MESSAGE_KEY',
        () async {
      await _commandRunner
          .run(['process', '--dangerfile', 'hello.dart', '--verbose']);

      final result =
          verify(_mockDangerUtil.spawnUri(captureAny, captureAny)).captured;
      final message = result[1];

      final sendPort = message[DANGER_SEND_PORT_MESSAGE_KEY];
      expect(sendPort, TypeMatcher<SendPort>());
    });

    test('Should pass DSL in message key DANGER_DSL_MESSAGE_KEY', () async {
      await _commandRunner
          .run(['process', '--dangerfile', 'hello.dart', '--verbose']);

      final result =
          verify(_mockDangerUtil.spawnUri(captureAny, captureAny)).captured;
      final message = result[1];

      final dslJSON = message[DANGER_DSL_MESSAGE_KEY];
      expect(dslJSON, isNotNull);

      final dsl = DangerJSONDSL.fromJson(dslJSON);

      /// check this according to fixture
      expect(dsl, isNotNull);
      expect(dsl.github, isNull);
      expect(dsl.bitbucketCloud, isNotNull);
    });

    test('Should write and flush stdout after running dangerfile', () async {
      await _commandRunner
          .run(['process', '--dangerfile', 'hello.dart', '--verbose']);

      verify(_mockStdout.flush()).called(1);

      final result = verify(_mockStdout.write(captureAny)).captured;
      final str = result[0];
      expect(
          str,
          equals(
              '{"fails":[],"warnings":[],"messages":[],"markdowns":[],"meta":{"runtimeName":"Danger Dart","runtimeHref":"https://danger.systems/dart"}}'));
    });
  });
}
