import 'package:danger_dart/danger_runner.dart' as danger_runner;

void main(List<String> arguments) async {
  if (arguments.isNotEmpty) {
    if (RegExp(r'^dart .* process --dangerfile ".*"$')
        .hasMatch(arguments.last.toString())) {
      final newArgs = arguments.last.split(' ');
      newArgs.removeRange(0, 2);
      await danger_runner.main(newArgs);
      return;
    }
  }
  await danger_runner
      .main(arguments.isNotEmpty ? arguments : <String>['--help']);
}
