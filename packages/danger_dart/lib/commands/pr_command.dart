import 'package:danger_dart/commands/base/danger_wrapper_command.dart';
import 'package:danger_dart/danger_util.dart';

class PRCommand extends DangerWrapperCommand {
  PRCommand(DangerUtil dangerUtil) : super(dangerUtil);

  @override
  String get description =>
      'Runs your local Dangerfile against an existing GitHub PR. Will not post on the PR';

  @override
  String get name => 'pr';
}
