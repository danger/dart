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

  static String getTargetBranch() {
    var target = '';

    if (danger.isGitHub) {
      target = danger.github.pr.base.ref;
    } else if (danger.isBitbucketCloud) {
      target = danger.bitbucketCloud.pr.destination.branch.name;
    } else if (danger.isGitLab) {
      target = danger.gitLab.mergeRequest.targetBranch;
    } else {
      target = danger.settings.cliArgs?['base'] ?? '';
    }

    if (target.isEmpty) {
      throw 'Cannot find base branch';
    }

    return target;
  }

  static Future<List<GitDiff>> getFullDiff(
      {String source = "HEAD", String? target}) async {
    var base = target ?? '';
    if (base.isEmpty) {
      base = getTargetBranch();
    }

    final data =
        await DangerUtils.spawn('git', arguments: ['diff', 'HEAD', base]);
    return GitDiffParser.parse(data);
  }
}
