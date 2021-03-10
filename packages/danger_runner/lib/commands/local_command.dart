import 'package:danger_runner/commands/base/danger_wrapper_command.dart';

class LocalCommand extends DangerWrapperCommand {
  @override
  String get description =>
      'Runs danger standalone on a repo, useful for git hooks';

  @override
  String get name => 'local';
}
