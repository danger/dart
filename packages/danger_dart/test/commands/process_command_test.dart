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
import '../mock_util.mocks.dart';

void main() {
  group('ProcessCommand', () {
    late MockDangerUtil _mockDangerUtil;
    late MockStdin _mockStdin;
    late MockStdout _mockStdout;
    late ProcessCommand _processCommand;
    late TestCommandRunner _commandRunner;

    setUp(() {
      _mockDangerUtil = MockDangerUtil();
      _mockStdin = MockStdin();
      _mockStdout = MockStdout();
      _processCommand =
          ProcessCommand(_mockDangerUtil, _mockStdin, _mockStdout);
      _commandRunner = TestCommandRunner.create(_processCommand);

      when(_mockDangerUtil.getDangerJSMetaData(any, shell: anyNamed('shell')))
          .thenAnswer((realInvocation) async {
        return DangerJSMetadata(executable: '/usr/local/danger-js');
      });

      when(_mockDangerUtil.spawnFile(captureAny, captureAny, captureAny))
          .thenAnswer((realInvocation) async {});

      when(_mockDangerUtil.getDangerFile(any))
          .thenReturn('mock_danger_file.dart');

      when(_mockDangerUtil.getScriptFilePath())
          .thenReturn('danger/danger_dart.dart');

      when(_mockStdin.transform(any)).thenAnswer((realInvocation) {
        final fixtureFile =
            File(join(current, 'test', 'fixtures', 'bbc-dsl-input.json'));

        return Stream<String>.value('danger://dsl/${fixtureFile.path}');
      });

      when(_mockStdout.flush()).thenAnswer((realInvocation) async {});
    });

    test('Should pass dangerfile', () async {
      await _commandRunner.run(
          ['process', '--dangerfile', 'bin/danger_dart.dart', '--verbose']);

      final result =
          verify(_mockDangerUtil.spawnFile(captureAny, captureAny, captureAny))
              .captured;
      final url = result[0];
      expect(url.path.toString(), endsWith('/bin/danger_dart.dart'));
    });

    test('Should pass sendPort in message key DANGER_SEND_PORT_MESSAGE_KEY',
        () async {
      await _commandRunner.run(
          ['process', '--dangerfile', 'bin/danger_dart.dart', '--verbose']);

      final result =
          verify(_mockDangerUtil.spawnFile(captureAny, captureAny, captureAny))
              .captured;
      final message = result[1];

      final sendPort = message[DANGER_SEND_PORT_MESSAGE_KEY];
      expect(sendPort, TypeMatcher<SendPort>());
    });

    test('Should pass DSL in message key DANGER_DSL_MESSAGE_KEY', () async {
      await _commandRunner.run(
          ['process', '--dangerfile', 'bin/danger_dart.dart', '--verbose']);

      final result =
          verify(_mockDangerUtil.spawnFile(captureAny, captureAny, captureAny))
              .captured;
      final message = result[1];

      final dslJSON = message[DANGER_DSL_MESSAGE_KEY];
      expect(dslJSON, isNotNull);

      final dsl = DangerRawJSONDSL.fromJson(dslJSON);

      /// check this according to fixture
      expect(dsl, isNotNull);
      expect(dsl.github, isNull);
      expect(dsl.bitbucketCloud, isNotNull);
    });

    test('Should write and flush stdout after running dangerfile', () async {
      await _commandRunner.run(
          ['process', '--dangerfile', 'bin/danger_dart.dart', '--verbose']);

      verify(_mockStdout.flush()).called(1);

      final result = verify(_mockStdout.write(captureAny)).captured;
      final urlResult = result[0];
      final fileResult =
          File(urlResult.toString().substring('danger-results:/'.length));
      final str = fileResult.readAsStringSync();
      expect(
          str,
          equals(
              '{"fails":[],"warnings":[],"messages":[],"markdowns":[],"meta":{"runtimeName":"Danger Dart","runtimeHref":"https://danger.systems/dart"}}'));
    });
  });
}
