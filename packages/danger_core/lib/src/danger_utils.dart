import 'dart:io';

import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/models/git_diff.dart';
import 'package:danger_core/src/utils/git_diff_parser.dart';

class DangerUtils {
  DangerUtils._();

  static Future<String> spawn(String command,
      {List<String> arguments = const []}) async {
    final result = await Process.run(command, arguments);

    return result.stdout.toString().trim();
  }

  static Future<List<GitDiff>> getFullDiff() async {
    var base = '';

    if (danger.isGitHub) {
      base = danger.github.pr.base.ref;
    } else if (danger.isBitbucketCloud) {
      base = danger.bitbucketCloud.pr.destination.branch.name;
    } else if (danger.isGitLab) {
      base = danger.gitLab.mergeRequest.targetBranch;
    } else {
      base = danger.settings.cliArgs?['base'] ?? '';
    }

    if (base.isEmpty) {
      throw 'Cannot find base branch';
    }

    print('BASE is [$base]');

    final data =
        await DangerUtils.spawn('git', arguments: ['diff', 'HEAD', base]);
    print('DATA =====');
    print(data);
    print('DATA =====');
    return GitDiffParser.parse(data);
  }
}
