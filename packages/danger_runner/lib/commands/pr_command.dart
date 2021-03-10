import 'package:danger_runner/commands/base/danger_wrapper_command.dart';

class PRCommand extends DangerWrapperCommand {
  @override
  String get description =>
      'Runs your local Dangerfile against an existing GitHub PR. Will not post on the PR';

  @override
  String get name => 'pr';
}
