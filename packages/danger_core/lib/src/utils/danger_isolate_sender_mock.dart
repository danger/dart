import 'package:danger_core/src/models/violation.dart';
import 'package:danger_core/src/models/danger_dsl.dart';
import 'package:danger_core/src/utils/danger_isolate_sender.dart';

class DangerIsolateSenderMock extends DangerIsolateSender {
  @override
  DangerJSONDSL dangerJSONDSL;

  final failList = <Violation>[];
  final markdownList = <Violation>[];
  final warningList = <Violation>[];
  final messageList = <Violation>[];

  @override
  void fail(Violation violation) {
    failList.add(violation);
  }

  @override
  void markdown(Violation violation) {
    markdownList.add(violation);
  }

  @override
  void message(Violation violation) {
    messageList.add(violation);
  }

  @override
  void warn(Violation violation) {
    warningList.add(violation);
  }
}
