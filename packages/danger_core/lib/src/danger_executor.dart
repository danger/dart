import 'package:danger_core/src/models/danger_dsl.dart';
import 'package:danger_core/src/models/danger_results.dart';
import 'package:danger_core/src/models/violation.dart';

class DangerExecutor {
  final result =
      DangerResults(fails: [], markdowns: [], messages: [], warnings: []);

  static DangerExecutor setupDangerStatic(DangerJSONDSL schema) {
    danger = schema;
    _dangerExecutorStatic = DangerExecutor();
    return _dangerExecutorStatic;
  }
}

DangerExecutor _dangerExecutorStatic;

DangerJSONDSL danger;

void message(String message, {String file, int line, String icon}) {
  _dangerExecutorStatic.result.messages
      .add(Violation(message: message, file: file, line: line, icon: icon));
}

void warn(String message, {String file, int line, String icon}) {
  _dangerExecutorStatic.result.warnings
      .add(Violation(message: message, file: file, line: line, icon: icon));
}

void fail(String message, {String file, int line, String icon}) {
  _dangerExecutorStatic.result.fails
      .add(Violation(message: message, file: file, line: line, icon: icon));
}

void markdown(String message, {String file, int line, String icon}) {
  _dangerExecutorStatic.result.markdowns
      .add(Violation(message: message, file: file, line: line, icon: icon));
}
