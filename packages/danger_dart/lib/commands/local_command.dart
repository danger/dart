import 'package:args/command_runner.dart';

class LocalCommand extends Command {
  @override
  String get description =>
      'Runs danger standalone on a repo, useful for git hooks';

  @override
  String get name => 'local';

  @override
  Future<void> run() async {
    throw 'This command is not supported yet.';
  }
}
