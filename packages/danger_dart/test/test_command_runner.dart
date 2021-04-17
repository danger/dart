import 'package:args/command_runner.dart';

class TestCommandRunner extends CommandRunner {
  TestCommandRunner(String executableName, String description)
      : super(executableName, description);

  factory TestCommandRunner.create(Command command) {
    final runner = TestCommandRunner('danger_dart', 'Danger Dart.');
    runner.addCommand(command);
    return runner;
  }
}
