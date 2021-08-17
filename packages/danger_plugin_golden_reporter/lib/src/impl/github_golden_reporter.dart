import '../golden_reporter.dart';
import 'package:danger_core/danger_core.dart';

class GithubGoldenReporter implements GoldenReporter {
  const GithubGoldenReporter();

  @override
  String reportForCreatedFile(String filePath) {
    final headSHA = danger.github.pr.head.sha;
    final repoOwner = danger.github.thisPR.owner;
    final repoName = danger.github.thisPR.repo;
    return '''<tr>
  <td>
    <strong>$filePath</strong>
  </td>
</tr>
<tr>
  <td>
    <img src="https://github.com/$repoOwner/$repoName/raw/$headSHA/$filePath" width="400">
  </td>
</tr>''';
  }

  @override
  String reportForModifiedFile(String filePath) {
    final baseSHA = danger.github.pr.base.sha;
    final headSHA = danger.github.pr.head.sha;
    final repoOwner = danger.github.thisPR.owner;
    final repoName = danger.github.thisPR.repo;

    return '''<tr>
  <td colspan="2">
    <strong>$filePath</strong>
  </td>
</tr>
<tr>
  <td>
    <img src="https://github.com/$repoOwner/$repoName/raw/$baseSHA/$filePath" width="400">
  </td>
  <td>
    <img src="https://github.com/$repoOwner/$repoName/raw/$headSHA/$filePath" width="400">
  </td>
</tr>''';
  }

  @override
  void reportAllCreatedFiles(List<String> messages) {
    final message = messages.join('\n');
    markdown('''#### Found ${messages.length} Created Golden Images
<table>
  <thead>
    <tr>
      <th>New Image</th>
    </tr>
  </thead>
  <tbody>
    $message
  </tbody>
</table>''');
  }

  @override
  void reportAllModifiedFiles(List<String> messages) {
    final message = messages.join('\n');
    markdown('''#### Found ${messages.length} Modified Golden Images
<table>
  <thead>
    <tr>
      <th>Old Image</th>
      <th>New Image</th>
    </tr>
  </thead>
  <tbody>
    $message
  </tbody>
</table>''');
  }
}
