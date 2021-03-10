import 'package:danger_dart/danger_runner.dart' as danger_runner;

final LONG_ARS_REGEX = RegExp(r'^dart .* process --dangerfile ".*"$');

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    await danger_runner.main(['--help']);
  }

  final innerArgs = arguments.firstWhere(
      (element) => LONG_ARS_REGEX.hasMatch(element),
      orElse: () => null);

  if (innerArgs != null) {
    final newArgs = innerArgs.split(' ');
    newArgs.removeRange(0, 2);
    await danger_runner.main(newArgs);
  } else {
    await danger_runner.main(arguments);
  }
}
