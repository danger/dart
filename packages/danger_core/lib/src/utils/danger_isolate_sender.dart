import 'dart:isolate';

import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/models/danger_core_constants.dart';
import 'package:danger_core/src/models/violation.dart';

class DangerIsolateSender {
  final SendPort sendPort;
  final DangerJSONDSL dangerJSONDSL;

  DangerIsolateSender(dynamic message)
      : sendPort = message[DANGER_SEND_PORT_MESSAGE_KEY],
        dangerJSONDSL = DangerJSONDSL.fromJson(message[DANGER_DSL_MESSAGE_KEY]);

  void message(Violation violation) {
    final wrapped =
        WrappedViolation(type: ViolationType.message, violation: violation);
    sendPort.send(wrapped.toJson());
  }

  void warn(Violation violation) {
    final wrapped =
        WrappedViolation(type: ViolationType.warn, violation: violation);
    sendPort.send(wrapped.toJson());
  }

  void fail(Violation violation) {
    final wrapped =
        WrappedViolation(type: ViolationType.fail, violation: violation);
    sendPort.send(wrapped.toJson());
  }

  void markdown(Violation violation) {
    final wrapped =
        WrappedViolation(type: ViolationType.markdown, violation: violation);
    sendPort.send(wrapped.toJson());
  }
}
