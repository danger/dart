import 'package:args/command_runner.dart';
import 'package:danger_dart/danger_util.dart';

import 'package:fimber/fimber.dart';
import 'package:danger_dart/commands/pr_command.dart';
import 'package:danger_dart/commands/ci_command.dart';
import 'package:danger_dart/commands/local_command.dart';
import 'package:danger_dart/commands/process_command.dart';

final logger = FimberLog('Danger.Dart');

Future<void> main(List<String> arguments) async {
  final runner = CommandRunner('danger_dart', 'Danger Dart.');

  runner.addCommand(PRCommand(DangerUtil()));
  runner.addCommand(ProcessCommand());
  runner.addCommand(CICommand(DangerUtil()));
  runner.addCommand(LocalCommand(DangerUtil()));

  await runner.run(arguments);
}
