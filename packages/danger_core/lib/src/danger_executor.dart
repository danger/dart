import 'dart:isolate';

import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/models/danger_dsl.dart';
import 'package:danger_core/src/models/violation.dart';
import 'package:danger_core/src/utils/danger_isolate_sender.dart';

class Danger {
  static void setup(dynamic data) {
    _sender = DangerIsolateSender(data);
  }
}

DangerIsolateSender _sender;
DangerJSONDSL get danger => _sender.dangerJSONDSL;

void message(String message, {String file, int line, String icon}) {
  final violation =
      Violation(message: message, file: file, line: line, icon: icon);
  _sender.message(violation);
}

void warn(String message, {String file, int line, String icon}) {
  final violation =
      Violation(message: message, file: file, line: line, icon: icon);
  _sender.warn(violation);
}

void fail(String message, {String file, int line, String icon}) {
  final violation =
      Violation(message: message, file: file, line: line, icon: icon);
  _sender.fail(violation);
}

void markdown(String message, {String file, int line, String icon}) {
  final violation =
      Violation(message: message, file: file, line: line, icon: icon);
  _sender.markdown(violation);
}
