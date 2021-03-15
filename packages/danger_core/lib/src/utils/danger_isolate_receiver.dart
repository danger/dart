import 'dart:isolate';

import 'package:danger_core/src/models/danger_core_constants.dart';
import 'package:danger_core/src/models/danger_results.dart';
import 'package:danger_core/src/models/violation.dart';

class DangerIsolateReceiver {
  final ReceivePort receivePort;
  final dynamic json;
  final DangerResults dangerResults;

  DangerIsolateReceiver(this.json)
      : receivePort = ReceivePort(),
        dangerResults = DangerResults(
            warnings: [], messages: [], markdowns: [], fails: []) {
    _initialize();
  }

  void _initialize() {
    receivePort.listen((message) {
      if (message is Map) {
        try {
          final wrappedViolation = WrappedViolation.fromJson(message);
          switch (wrappedViolation.type) {
            case ViolationType.message:
              dangerResults.messages.add(wrappedViolation.violation);
              break;
            case ViolationType.warn:
              dangerResults.warnings.add(wrappedViolation.violation);
              break;
            case ViolationType.fail:
              dangerResults.fails.add(wrappedViolation.violation);
              break;
            case ViolationType.markdown:
              dangerResults.markdowns.add(wrappedViolation.violation);
              break;
          }
        } catch (e) {
          //do nothing
        }
      }
    });
  }

  dynamic toMessage() {
    return {
      DANGER_DSL_MESSAGE_KEY: json['danger'],
      DANGER_SEND_PORT_MESSAGE_KEY: receivePort.sendPort,
    };
  }
}
