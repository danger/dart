import 'package:danger_core/src/models/danger_dsl.dart';
import 'package:danger_core/src/models/violation.dart';

class DangerExecutor {
  final fails = <Violation>[];
  final markdowns = <Violation>[];
  final messages = <Violation>[];
  final warnings = <Violation>[];

  static DangerExecutor setupDangerStatic(DangerJSONDSL schema) {
    danger = schema;
    _dangerStatic = DangerExecutor();
    return _dangerStatic;
  }

  Map<String, List<Violation>> toResult() {
    var result = <String, List<Violation>>{};
    result['fails'] = fails;
    result['markdowns'] = markdowns;
    result['messages'] = messages;
    result['warnings'] = warnings;
    return result;
  }
}

DangerExecutor _dangerStatic;

DangerJSONDSL danger;

void message(String message, {String file, int line, String icon}) {
  _dangerStatic.messages
      .add(Violation(message: message, file: file, line: line, icon: icon));
}

void warn(String message, {String file, int line, String icon}) {
  _dangerStatic.warnings
      .add(Violation(message: message, file: file, line: line, icon: icon));
}

void fail(String message, {String file, int line, String icon}) {
  _dangerStatic.fails
      .add(Violation(message: message, file: file, line: line, icon: icon));
}

void markdown(String message, {String file, int line, String icon}) {
  _dangerStatic.markdowns
      .add(Violation(message: message, file: file, line: line, icon: icon));
}
