import 'package:danger_core/src/models/danger_core_constants.dart';
import 'package:danger_core/src/models/violation.dart';
import 'package:danger_core/src/utils/danger_isolate_receiver.dart';
import 'package:test/test.dart';

void main() {
  group('DangerIsolateReceiver', () {
    DangerIsolateReceiver receiver;
    final onlyMessageViolation = Violation(message: 'hello');
    final json = {'danger': 'JSON'};

    setUp(() {
      receiver = DangerIsolateReceiver(json);
    });

    test('toMessage() should return correctly', () {
      final message = receiver.toMessage();
      expect(message[DANGER_DSL_MESSAGE_KEY], equals('JSON'));
      expect(message[DANGER_SEND_PORT_MESSAGE_KEY],
          equals(receiver.receivePort.sendPort));
    });

    test('should add message to dangerResults', () async {
      final wrappedViolation = WrappedViolation(
          type: ViolationType.message, violation: onlyMessageViolation);

      receiver.receivePort.sendPort.send(wrappedViolation.toJson());
      await Future.delayed(Duration.zero);

      expect(receiver.dangerResults.messages.length, equals(1));
      expect(receiver.dangerResults.messages.first.toJson(),
          equals(onlyMessageViolation.toJson()));
    });

    test('should add warn to dangerResults', () async {
      final wrappedViolation = WrappedViolation(
          type: ViolationType.warn, violation: onlyMessageViolation);

      receiver.receivePort.sendPort.send(wrappedViolation.toJson());
      await Future.delayed(Duration.zero);

      expect(receiver.dangerResults.warnings.length, equals(1));
      expect(receiver.dangerResults.warnings.first.toJson(),
          equals(onlyMessageViolation.toJson()));
    });

    test('should add fail to dangerResults', () async {
      final wrappedViolation = WrappedViolation(
          type: ViolationType.fail, violation: onlyMessageViolation);

      receiver.receivePort.sendPort.send(wrappedViolation.toJson());
      await Future.delayed(Duration.zero);

      expect(receiver.dangerResults.fails.length, equals(1));
      expect(receiver.dangerResults.fails.first.toJson(),
          equals(onlyMessageViolation.toJson()));
    });

    test('should add markdown to dangerResults', () async {
      final wrappedViolation = WrappedViolation(
          type: ViolationType.markdown, violation: onlyMessageViolation);

      receiver.receivePort.sendPort.send(wrappedViolation.toJson());
      await Future.delayed(Duration.zero);

      expect(receiver.dangerResults.markdowns.length, equals(1));
      expect(receiver.dangerResults.markdowns.first.toJson(),
          equals(onlyMessageViolation.toJson()));
    });
  });
}
