import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_golden_reporter/src/impl/github_golden_reporter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/utils/danger_isolate_sender_mock.dart';

class MockDangerJSONDSL extends Mock implements DangerJSONDSL {}

class MockGitJSONDSL extends Mock implements GitJSONDSL {}

class MockGitHubDSL extends Mock implements GitHubDSL {}

class MockGitHubAPIPR extends Mock implements GitHubAPIPR {}

class MockGitHubPRDSL extends Mock implements GitHubPRDSL {}

class MockGitHubMergeRef extends Mock implements GitHubMergeRef {}

void main() {
  DangerIsolateSenderMock dangerIsolateSenderMock;
  MockDangerJSONDSL mockDangerJSONDSL;
  MockGitJSONDSL mockGitJSONDSL;
  MockGitHubDSL mockGitHubDSL;
  MockGitHubAPIPR mockGitHubAPIPR;
  MockGitHubPRDSL gitHubPRDSL;

  MockGitHubMergeRef head;
  MockGitHubMergeRef base;

  final reporter = GithubGoldenReporter();

  setUp(() {
    mockDangerJSONDSL = MockDangerJSONDSL();
    mockGitJSONDSL = MockGitJSONDSL();
    mockGitHubDSL = MockGitHubDSL();
    mockGitHubAPIPR = MockGitHubAPIPR();
    gitHubPRDSL = MockGitHubPRDSL();
    head = MockGitHubMergeRef();
    base = MockGitHubMergeRef();

    dangerIsolateSenderMock = Danger.setupWithMock();
    dangerIsolateSenderMock.dangerJSONDSL = mockDangerJSONDSL;

    when(mockDangerJSONDSL.git).thenReturn(mockGitJSONDSL);
    when(mockDangerJSONDSL.github).thenReturn(mockGitHubDSL);
    when(mockGitJSONDSL.createdFiles).thenReturn([]);
    when(mockGitJSONDSL.modifiedFiles).thenReturn([]);

    when(mockGitHubDSL.thisPR).thenReturn(mockGitHubAPIPR);
    when(mockGitHubAPIPR.owner).thenReturn('danger');
    when(mockGitHubAPIPR.repo).thenReturn('dart');
    when(mockGitHubDSL.pr).thenReturn(gitHubPRDSL);

    when(gitHubPRDSL.head).thenReturn(head);
    when(gitHubPRDSL.base).thenReturn(base);

    when(head.sha).thenReturn('MOCK_HEAD_SHA');
    when(base.sha).thenReturn('MOCK_BASE_SHA');
  });

  test('reportForCreatedFile', () {
    final result = reporter.reportForCreatedFile('test/goldens/foo.png');
    expect(result, '''<tr>
  <td>
    <strong>test/goldens/foo.png</strong>
  </td>
</tr>
<tr>
  <td>
    <img src="https://github.com/danger/dart/raw/MOCK_HEAD_SHA/test/goldens/foo.png" width="400">
  </td>
</tr>''');
  });

  test('reportForModifiedFile', () {
    final result = reporter.reportForModifiedFile('test/goldens/foo.png');
    expect(result, '''<tr>
  <td colspan="2">
    <strong>test/goldens/foo.png</strong>
  </td>
</tr>
<tr>
  <td>
    <img src="https://github.com/danger/dart/raw/MOCK_BASE_SHA/test/goldens/foo.png" width="400">
  </td>
  <td>
    <img src="https://github.com/danger/dart/raw/MOCK_HEAD_SHA/test/goldens/foo.png" width="400">
  </td>
</tr>''');
  });

  test('reportAllCreatedFiles', () {
    reporter.reportAllCreatedFiles(['MOCK_MESSAGE1', 'MOCK_MESSAGE2']);
    expect(dangerIsolateSenderMock.markdownList.first.message,
        '''#### Found 2 Created Golden Images
<table>
  <thead>
    <tr>
      <th>New Image</th>
    </tr>
  </thead>
  <tbody>
    MOCK_MESSAGE1
MOCK_MESSAGE2
  </tbody>
</table>''');
  });

  test('reportAllModifiedFiles', () {
    reporter.reportAllModifiedFiles(['MOCK_MESSAGE1', 'MOCK_MESSAGE2']);
    expect(dangerIsolateSenderMock.markdownList.first.message,
        '''#### Found 2 Modified Golden Images
<table>
  <thead>
    <tr>
      <th>Old Image</th>
      <th>New Image</th>
    </tr>
  </thead>
  <tbody>
    MOCK_MESSAGE1
MOCK_MESSAGE2
  </tbody>
</table>''');
  });
}
