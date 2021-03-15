import 'package:danger_dart/danger_runner.dart' as danger_runner;

final LONG_ARS_REGEX = RegExp(r'^dart .* process --dangerfile ".*"$');

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    await danger_runner.main(['--help']);
  }

  final runnerIndex = arguments.indexOf('runner');
  if (runnerIndex != -1) {
    var newArgs = [...arguments];
    newArgs.removeRange(runnerIndex, newArgs.length);

    await danger_runner.main(newArgs);
  } else {
    await danger_runner.main(arguments);
  }
}
