import 'package:danger_dart/commands/base/danger_wrapper_command.dart';
import 'package:danger_dart/danger_util.dart';

class CICommand extends DangerWrapperCommand {
  CICommand(DangerUtil dangerUtil) : super(dangerUtil);

  @override
  String get description => 'Runs Danger on CI';

  @override
  String get name => 'ci';
}
