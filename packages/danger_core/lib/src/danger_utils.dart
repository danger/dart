import 'dart:io';

import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/models/git_diff.dart';
import 'package:danger_core/src/utils/git_diff_parser.dart';

class DangerUtils {
  DangerUtils._();

  static Future<String> spawn(String command,
      {List<String> arguments = const []}) async {
    final result = await Process.run(command, arguments, runInShell: true);

    return result.stdout.toString().trim();
  }

  /// Get PR target branch based on git provider
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

  /// Get Git full diff.
  /// The default targetBranch will be selected based on current environment.
  ///
  /// This function needs Git history on the machine.
  ///
  /// For GitHub Action:
  /// ```yaml
  /// - uses: actions/checkout@v4
  ///   with:
  ///     fetch-depth: 0
  /// ```
  static Future<List<GitDiff>> getFullDiff(
      {String sourceBranch = "HEAD", String? targetBranch}) async {
    var base = targetBranch ?? '';
    if (base.isEmpty) {
      base = getTargetBranch();
    }

    final data =
        await DangerUtils.spawn('git', arguments: ['diff', 'HEAD', base]);
    print("=======");
    print(data);
    print("=======");
    return GitDiffParser.parse(data);
  }
}
