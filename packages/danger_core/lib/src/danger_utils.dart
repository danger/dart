import 'dart:io';

class DangerUtils {
  Future<String> spawn(String command, {List<String> arguments}) async {
    final result = await Process.run(command, arguments);

    return result.stdout.toString().trim();
  }
}
