import 'package:danger_dart/danger_dart.dart' as danger_dart;

// ignore: non_constant_identifier_names
final LONG_ARS_REGEX = RegExp(r'^dart .* process --dangerfile ".*"$');

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    await danger_dart.main(['--help']);
  }

  final runnerIndex = arguments.indexOf('runner');
  if (runnerIndex != -1) {
    var newArgs = [...arguments];
    newArgs.removeRange(runnerIndex, newArgs.length);

    await danger_dart.main(newArgs);
  } else {
    await danger_dart.main(arguments);
  }
}
