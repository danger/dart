import 'impl/github_golden_reporter.dart';
import 'golden_reporter.dart';
import 'package:danger_core/danger_core.dart';

class DangerPluginGoldenReporter {
  DangerPluginGoldenReporter._();

  static void report(String path,
      {GoldenReporter reporter = const GithubGoldenReporter()}) {
    final modifiedFileMessages = danger.git.modifiedFiles
        .where(
            (element) => element.startsWith(path) && element.endsWith('.png'))
        .map((e) => reporter.reportForModifiedFile(e));

    final createdFileMessages = danger.git.createdFiles
        .where(
            (element) => element.startsWith(path) && element.endsWith('.png'))
        .map((e) => reporter.reportForCreatedFile(e));

    if (modifiedFileMessages.isNotEmpty) {
      reporter.reportAllModifiedFiles(modifiedFileMessages.toList());
    }

    if (createdFileMessages.isNotEmpty) {
      reporter.reportAllCreatedFiles(createdFileMessages.toList());
    }
  }
}
