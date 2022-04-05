import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_golden_reporter/src/golden_reporter.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  GoldenReporter,
  DangerJSONDSL,
  GitJSONDSL,
  GitHubDSL,
  GitHubAPIPR,
  GitHubPRDSL,
  GitHubMergeRef,
])
class MockUtils {}
