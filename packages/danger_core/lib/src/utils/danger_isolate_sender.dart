import 'package:danger_core/src/models/danger_dsl.dart';
import 'package:danger_core/src/models/violation.dart';

abstract class DangerIsolateSender {
  DangerJSONDSL get dangerJSONDSL;
  
  void message(Violation violation);
  void warn(Violation violation);
  void fail(Violation violation);
  void markdown(Violation violation);
}
