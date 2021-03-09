
import 'package:danger_core/src/danger_incoming_message.dart';

class DangerExecutor {
  final DangerDsljsonType schema;
  var result = <String>[];

  DangerExecutor(this.schema);

  void message(String message) {
    result.add('[Message] $message');
  }

  void warn(String warn) {
    result.add('[Warn] $warn');
  }

  void error(String error) {
    result.add('[Error] $error');
  }

  String getResult() {
    return result.join('\n');
  }
}
