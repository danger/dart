import 'package:danger_runner/danger_runner.dart' as danger_runner;

void main(List<String> arguments) async {
  if (RegExp(r'^dart .* process --dangerfile ".*"$')
      .hasMatch(arguments.last.toString())) {
    final newArgs = arguments.last.split(' ');
    newArgs.removeRange(0, 2);
    await danger_runner.main(newArgs);
  } else {
    await danger_runner.main(arguments);
  }
}
