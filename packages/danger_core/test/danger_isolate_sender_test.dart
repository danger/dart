import 'dart:isolate';

import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/models/danger_core_constants.dart';
import 'package:danger_core/src/models/violation.dart';
import 'package:danger_core/src/utils/danger_isolate_sender_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class _MockGitJSONDSL extends Mock implements GitJSONDSL {}

class _MockDangerRawJSONDSL extends Mock implements DangerRawJSONDSL {
  final _mockGit = _MockGitJSONDSL();

  @override
  GitJSONDSL get git => _mockGit;
}

void main() {
  group('DangerIsolateSender', () {
    late DangerIsolateSenderImpl isolateSender;
    late ReceivePort receivePort;
    late _MockDangerRawJSONDSL mockDangerJSONDSL;

    dynamic lastMessage;
    final onlyMessageViolation = Violation(message: 'hello');

    setUp(() {
      receivePort = ReceivePort();
      mockDangerJSONDSL = _MockDangerRawJSONDSL();

      isolateSender = DangerIsolateSenderImpl({
        DANGER_SEND_PORT_MESSAGE_KEY: receivePort.sendPort,
        DANGER_DSL_MESSAGE_KEY: '{}',
      }, converter: (message) {
        lastMessage = message;
        return mockDangerJSONDSL;
      });
    });

    test('should initialize correctly', () {
      expect(isolateSender.sendPort, equals(receivePort.sendPort));
      expect(lastMessage, equals('{}'));
      expect(isolateSender.dangerJSONDSL.rawJSONDSL, equals(mockDangerJSONDSL));
      expect(isolateSender.dangerJSONDSL.git, equals(mockDangerJSONDSL.git));
    });

    test('should add message violation correctly', () async {
      isolateSender.message(onlyMessageViolation);
      final wrappedViolation = await receivePort.first;
      expect(wrappedViolation['type'], equals('message'));
      expect(wrappedViolation['violation'], onlyMessageViolation.toJson());
    });

    test('should add warn violation correctly', () async {
      isolateSender.warn(onlyMessageViolation);
      final wrappedViolation = await receivePort.first;
      expect(wrappedViolation['type'], equals('warn'));
      expect(wrappedViolation['violation'], onlyMessageViolation.toJson());
    });
    test('should add fail violation correctly', () async {
      isolateSender.fail(onlyMessageViolation);
      final wrappedViolation = await receivePort.first;
      expect(wrappedViolation['type'], equals('fail'));
      expect(wrappedViolation['violation'], onlyMessageViolation.toJson());
    });

    test('should add markdown violation correctly', () async {
      isolateSender.markdown(onlyMessageViolation);
      final wrappedViolation = await receivePort.first;
      expect(wrappedViolation['type'], equals('markdown'));
      expect(wrappedViolation['violation'], onlyMessageViolation.toJson());
    });

    test('should add multiple violations correctly', () async {
      isolateSender.markdown(onlyMessageViolation);
      isolateSender.fail(onlyMessageViolation);
      isolateSender.warn(onlyMessageViolation);
      isolateSender.message(onlyMessageViolation);

      final wrappedViolations = await receivePort.take(4).toList();
      expect(wrappedViolations[0]['type'], equals('markdown'));
      expect(wrappedViolations[1]['type'], equals('fail'));
      expect(wrappedViolations[2]['type'], equals('warn'));
      expect(wrappedViolations[3]['type'], equals('message'));
    });
  });
}
