import 'package:args/command_runner.dart';

import 'package:fimber/fimber.dart';
import 'package:danger_runner/commands/pr_command.dart';
import 'package:danger_runner/commands/ci_command.dart';
import 'package:danger_runner/commands/local_command.dart';
import 'package:danger_runner/commands/process_command.dart';

final logger = FimberLog('Danger.Dart');

Future<void> main(List<String> arguments) async {
  final runner = CommandRunner('danger_dart', 'Danger Dart.');

  runner.addCommand(PRCommand());
  runner.addCommand(ProcessCommand());
  runner.addCommand(CICommand());
  runner.addCommand(LocalCommand());

  await runner.run(arguments);
}
