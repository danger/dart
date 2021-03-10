import 'package:danger_runner/commands/base/danger_wrapper_command.dart';

class CICommand extends DangerWrapperCommand {
  @override
  String get description => 'Runs Danger on CI';

  @override
  String get name => 'ci';
}
