import 'dart:isolate';

import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/models/danger_core_constants.dart';
import 'package:danger_core/src/models/violation.dart';
import 'package:danger_core/src/utils/danger_isolate_sender.dart';

typedef DangerJSONDSLMessageConverter = DangerRawJSONDSL Function(
    dynamic message);

DangerRawJSONDSL _defaultDangerJSONDSLMessageConverter(dynamic message) {
  return DangerRawJSONDSL.fromJson(message);
}

class DangerIsolateSenderImpl extends DangerIsolateSender {
  final SendPort sendPort;

  DangerIsolateSenderImpl(dynamic message,
      {DangerJSONDSLMessageConverter? converter})
      : sendPort = message[DANGER_SEND_PORT_MESSAGE_KEY],
        dangerJSONDSL = DangerJSONDSL(
            (converter ?? _defaultDangerJSONDSLMessageConverter)(
                message[DANGER_DSL_MESSAGE_KEY]));

  @override
  final DangerJSONDSL dangerJSONDSL;

  @override
  void message(Violation violation) {
    final wrapped =
        WrappedViolation(type: ViolationType.message, violation: violation);
    sendPort.send(wrapped.toJson());
  }

  @override
  void warn(Violation violation) {
    final wrapped =
        WrappedViolation(type: ViolationType.warn, violation: violation);
    sendPort.send(wrapped.toJson());
  }

  @override
  void fail(Violation violation) {
    final wrapped =
        WrappedViolation(type: ViolationType.fail, violation: violation);
    sendPort.send(wrapped.toJson());
  }

  @override
  void markdown(Violation violation) {
    final wrapped =
        WrappedViolation(type: ViolationType.markdown, violation: violation);
    sendPort.send(wrapped.toJson());
  }
}
