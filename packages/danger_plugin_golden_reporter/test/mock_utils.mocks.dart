// Mocks generated by Mockito 5.1.0 from annotations
// in danger_plugin_golden_reporter/test/mock_utils.dart.
// Do not manually edit this file.

import 'package:danger_core/src/models/bitbucket_cloud.dart' as _i4;
import 'package:danger_core/src/models/danger_dsl.dart' as _i2;
import 'package:danger_core/src/models/git_dsl.dart' as _i3;
import 'package:danger_core/src/models/github_dsl.dart' as _i5;
import 'package:danger_core/src/models/gitlab_dsl.dart' as _i6;
import 'package:danger_plugin_golden_reporter/src/golden_reporter.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeDangerRawJSONDSL_0 extends _i1.Fake implements _i2.DangerRawJSONDSL {
}

class _FakeGitJSONDSL_1 extends _i1.Fake implements _i3.GitJSONDSL {}

class _FakeBitBucketCloudJSONDSL_2 extends _i1.Fake
    implements _i4.BitBucketCloudJSONDSL {}

class _FakeGitHubDSL_3 extends _i1.Fake implements _i5.GitHubDSL {}

class _FakeGitLabDSL_4 extends _i1.Fake implements _i6.GitLabDSL {}

class _FakeDangerJSONSettings_5 extends _i1.Fake
    implements _i2.DangerJSONSettings {}

class _FakeGitHubIssue_6 extends _i1.Fake implements _i5.GitHubIssue {}

class _FakeGitHubPRDSL_7 extends _i1.Fake implements _i5.GitHubPRDSL {}

class _FakeGitHubAPIPR_8 extends _i1.Fake implements _i5.GitHubAPIPR {}

class _FakeGitHubReviewers_9 extends _i1.Fake implements _i5.GitHubReviewers {}

class _FakeGitHubMergeRef_10 extends _i1.Fake implements _i5.GitHubMergeRef {}

class _FakeGitHubUser_11 extends _i1.Fake implements _i5.GitHubUser {}

class _FakeGitHubRepo_12 extends _i1.Fake implements _i5.GitHubRepo {}

/// A class which mocks [GoldenReporter].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoldenReporter extends _i1.Mock implements _i7.GoldenReporter {
  MockGoldenReporter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String reportForModifiedFile(String? filePath) =>
      (super.noSuchMethod(Invocation.method(#reportForModifiedFile, [filePath]),
          returnValue: '') as String);
  @override
  String reportForCreatedFile(String? filePath) =>
      (super.noSuchMethod(Invocation.method(#reportForCreatedFile, [filePath]),
          returnValue: '') as String);
  @override
  void reportAllModifiedFiles(List<String>? messages) =>
      super.noSuchMethod(Invocation.method(#reportAllModifiedFiles, [messages]),
          returnValueForMissingStub: null);
  @override
  void reportAllCreatedFiles(List<String>? messages) =>
      super.noSuchMethod(Invocation.method(#reportAllCreatedFiles, [messages]),
          returnValueForMissingStub: null);
}

/// A class which mocks [DangerJSONDSL].
///
/// See the documentation for Mockito's code generation for more information.
class MockDangerJSONDSL extends _i1.Mock implements _i2.DangerJSONDSL {
  MockDangerJSONDSL() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DangerRawJSONDSL get rawJSONDSL =>
      (super.noSuchMethod(Invocation.getter(#rawJSONDSL),
          returnValue: _FakeDangerRawJSONDSL_0()) as _i2.DangerRawJSONDSL);
  @override
  _i3.GitJSONDSL get git => (super.noSuchMethod(Invocation.getter(#git),
      returnValue: _FakeGitJSONDSL_1()) as _i3.GitJSONDSL);
  @override
  _i4.BitBucketCloudJSONDSL get bitbucketCloud =>
      (super.noSuchMethod(Invocation.getter(#bitbucketCloud),
              returnValue: _FakeBitBucketCloudJSONDSL_2())
          as _i4.BitBucketCloudJSONDSL);
  @override
  _i5.GitHubDSL get github => (super.noSuchMethod(Invocation.getter(#github),
      returnValue: _FakeGitHubDSL_3()) as _i5.GitHubDSL);
  @override
  _i6.GitLabDSL get gitLab => (super.noSuchMethod(Invocation.getter(#gitLab),
      returnValue: _FakeGitLabDSL_4()) as _i6.GitLabDSL);
  @override
  _i2.DangerJSONSettings get settings =>
      (super.noSuchMethod(Invocation.getter(#settings),
          returnValue: _FakeDangerJSONSettings_5()) as _i2.DangerJSONSettings);
  @override
  bool get isGitHub =>
      (super.noSuchMethod(Invocation.getter(#isGitHub), returnValue: false)
          as bool);
  @override
  bool get isBitbucketCloud =>
      (super.noSuchMethod(Invocation.getter(#isBitbucketCloud),
          returnValue: false) as bool);
  @override
  bool get isGitLab =>
      (super.noSuchMethod(Invocation.getter(#isGitLab), returnValue: false)
          as bool);
}

/// A class which mocks [GitJSONDSL].
///
/// See the documentation for Mockito's code generation for more information.
class MockGitJSONDSL extends _i1.Mock implements _i3.GitJSONDSL {
  MockGitJSONDSL() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<String> get modifiedFiles =>
      (super.noSuchMethod(Invocation.getter(#modifiedFiles),
          returnValue: <String>[]) as List<String>);
  @override
  List<String> get createdFiles =>
      (super.noSuchMethod(Invocation.getter(#createdFiles),
          returnValue: <String>[]) as List<String>);
  @override
  List<String> get deletedFiles =>
      (super.noSuchMethod(Invocation.getter(#deletedFiles),
          returnValue: <String>[]) as List<String>);
  @override
  List<_i3.GitCommit> get commits =>
      (super.noSuchMethod(Invocation.getter(#commits),
          returnValue: <_i3.GitCommit>[]) as List<_i3.GitCommit>);
  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}

/// A class which mocks [GitHubDSL].
///
/// See the documentation for Mockito's code generation for more information.
class MockGitHubDSL extends _i1.Mock implements _i5.GitHubDSL {
  MockGitHubDSL() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.GitHubIssue get issue => (super.noSuchMethod(Invocation.getter(#issue),
      returnValue: _FakeGitHubIssue_6()) as _i5.GitHubIssue);
  @override
  _i5.GitHubPRDSL get pr => (super.noSuchMethod(Invocation.getter(#pr),
      returnValue: _FakeGitHubPRDSL_7()) as _i5.GitHubPRDSL);
  @override
  _i5.GitHubAPIPR get thisPR => (super.noSuchMethod(Invocation.getter(#thisPR),
      returnValue: _FakeGitHubAPIPR_8()) as _i5.GitHubAPIPR);
  @override
  List<_i5.GitHubCommit> get commits =>
      (super.noSuchMethod(Invocation.getter(#commits),
          returnValue: <_i5.GitHubCommit>[]) as List<_i5.GitHubCommit>);
  @override
  List<_i5.GitHubReview> get reviews =>
      (super.noSuchMethod(Invocation.getter(#reviews),
          returnValue: <_i5.GitHubReview>[]) as List<_i5.GitHubReview>);
  @override
  _i5.GitHubReviewers get requestedReviewers =>
      (super.noSuchMethod(Invocation.getter(#requestedReviewers),
          returnValue: _FakeGitHubReviewers_9()) as _i5.GitHubReviewers);
  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}

/// A class which mocks [GitHubAPIPR].
///
/// See the documentation for Mockito's code generation for more information.
class MockGitHubAPIPR extends _i1.Mock implements _i5.GitHubAPIPR {
  MockGitHubAPIPR() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get owner =>
      (super.noSuchMethod(Invocation.getter(#owner), returnValue: '')
          as String);
  @override
  String get repo =>
      (super.noSuchMethod(Invocation.getter(#repo), returnValue: '') as String);
  @override
  int get number =>
      (super.noSuchMethod(Invocation.getter(#number), returnValue: 0) as int);
  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}

/// A class which mocks [GitHubPRDSL].
///
/// See the documentation for Mockito's code generation for more information.
class MockGitHubPRDSL extends _i1.Mock implements _i5.GitHubPRDSL {
  MockGitHubPRDSL() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get number =>
      (super.noSuchMethod(Invocation.getter(#number), returnValue: 0) as int);
  @override
  _i5.GitHubPRState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _i5.GitHubPRState.closed) as _i5.GitHubPRState);
  @override
  bool get locked =>
      (super.noSuchMethod(Invocation.getter(#locked), returnValue: false)
          as bool);
  @override
  String get title =>
      (super.noSuchMethod(Invocation.getter(#title), returnValue: '')
          as String);
  @override
  String get createdAt =>
      (super.noSuchMethod(Invocation.getter(#createdAt), returnValue: '')
          as String);
  @override
  String get updatedAt =>
      (super.noSuchMethod(Invocation.getter(#updatedAt), returnValue: '')
          as String);
  @override
  _i5.GitHubMergeRef get head => (super.noSuchMethod(Invocation.getter(#head),
      returnValue: _FakeGitHubMergeRef_10()) as _i5.GitHubMergeRef);
  @override
  _i5.GitHubMergeRef get base => (super.noSuchMethod(Invocation.getter(#base),
      returnValue: _FakeGitHubMergeRef_10()) as _i5.GitHubMergeRef);
  @override
  _i5.GitHubUser get user => (super.noSuchMethod(Invocation.getter(#user),
      returnValue: _FakeGitHubUser_11()) as _i5.GitHubUser);
  @override
  int get comments =>
      (super.noSuchMethod(Invocation.getter(#comments), returnValue: 0) as int);
  @override
  int get reviewComments =>
      (super.noSuchMethod(Invocation.getter(#reviewComments), returnValue: 0)
          as int);
  @override
  int get commits =>
      (super.noSuchMethod(Invocation.getter(#commits), returnValue: 0) as int);
  @override
  String get htmlUrl =>
      (super.noSuchMethod(Invocation.getter(#htmlUrl), returnValue: '')
          as String);
  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}

/// A class which mocks [GitHubMergeRef].
///
/// See the documentation for Mockito's code generation for more information.
class MockGitHubMergeRef extends _i1.Mock implements _i5.GitHubMergeRef {
  MockGitHubMergeRef() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get label =>
      (super.noSuchMethod(Invocation.getter(#label), returnValue: '')
          as String);
  @override
  String get ref =>
      (super.noSuchMethod(Invocation.getter(#ref), returnValue: '') as String);
  @override
  String get sha =>
      (super.noSuchMethod(Invocation.getter(#sha), returnValue: '') as String);
  @override
  _i5.GitHubUser get user => (super.noSuchMethod(Invocation.getter(#user),
      returnValue: _FakeGitHubUser_11()) as _i5.GitHubUser);
  @override
  _i5.GitHubRepo get repo => (super.noSuchMethod(Invocation.getter(#repo),
      returnValue: _FakeGitHubRepo_12()) as _i5.GitHubRepo);
  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}
