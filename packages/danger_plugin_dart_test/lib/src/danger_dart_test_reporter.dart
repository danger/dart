import 'package:danger_plugin_dart_test/src/models/danger_dart_error_case.dart';

abstract class DangerDartTestReporter {
  void reportToDanger(List<DangerDartErrorCase> errorCases);
}