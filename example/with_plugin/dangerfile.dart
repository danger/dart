// @dart=2.10
import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_example/danger_plugin_example.dart';


void main(List<String> args, dynamic data) {
  Danger.setup(data);
  dangerRandomGenerateCode();

  message('Hello World');
}
