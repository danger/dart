import 'package:danger_core/src/models/bitbucket_cloud.dart';
import 'package:danger_core/src/models/git_dsl.dart';
import 'package:danger_core/src/models/github_dsl.dart';
import 'package:danger_core/src/models/gitlab_dsl.dart';
import 'package:danger_core/src/models/settings_github.dart';

import 'package:json_annotation/json_annotation.dart'
    if (dart.library.isolate) 'package:danger_core/src/mock_json_annotation.dart';

part 'danger_dsl.g.dart';

class DangerJSONDSL {
  /// The data only version of Git DSL
  GitJSONDSL get git => rawJSONDSL.git;

  /// The data only version of BitBucket Cloud DSL
  BitBucketCloudJSONDSL get bitbucketCloud => rawJSONDSL.bitbucketCloud!;

  /// The data only version of GitHub
  GitHubDSL get github => rawJSONDSL.github!;

  /// The data only version of GitLab
  GitLabDSL get gitLab => rawJSONDSL.gitlab!;

  DangerJSONSettings get settings => rawJSONDSL.settings!;

  final DangerRawJSONDSL rawJSONDSL;

  DangerJSONDSL(this.rawJSONDSL);
}

@JsonSerializable()
class DangerJSON {
  final DangerRawJSONDSL danger;

  factory DangerJSON.fromJson(Map<String, dynamic> json) =>
      _$DangerJSONFromJson(json);

  DangerJSON({required this.danger});

  Map<String, dynamic> toJson() => _$DangerJSONToJson(this);
}

@JsonSerializable()
class DangerRawJSONDSL {
  /// The data only version of Git DSL
  final GitJSONDSL git;

  /// The data only version of BitBucket Cloud DSL
  @JsonKey(name: 'bitbucket_cloud')
  final BitBucketCloudJSONDSL? bitbucketCloud;

  final GitHubDSL? github;

  final GitLabDSL? gitlab;

  final DangerJSONSettings? settings;

  factory DangerRawJSONDSL.fromJson(Map<String, dynamic> json) =>
      _$DangerRawJSONDSLFromJson(json);

  DangerRawJSONDSL(
      {required this.git,
      this.bitbucketCloud,
      this.github,
      this.settings,
      this.gitlab});
  Map<String, dynamic> toJson() => _$DangerRawJSONDSLToJson(this);
}

@JsonSerializable()
class DangerJSONSettings {
  final Map<String, dynamic>? cliArgs;
  final DangetSettingsGithub? github;

  factory DangerJSONSettings.fromJson(Map<String, dynamic> json) =>
      _$DangerJSONSettingsFromJson(json);

  DangerJSONSettings({this.cliArgs, this.github});
  Map<String, dynamic> toJson() => _$DangerJSONSettingsToJson(this);
}
