import 'package:danger_core/src/models/bitbucket_cloud.dart';
import 'package:danger_core/src/models/git_dsl.dart';
import 'package:danger_core/src/models/cli_args.dart';
import 'package:danger_core/src/models/github_dsl.dart';

import 'package:json_annotation/json_annotation.dart'
    if (dart.library.isolate) 'package:danger_core/src/mock_json_annotation.dart';

part 'danger_dsl.g.dart';

@JsonSerializable()
class DangerJSON {
  final DangerJSONDSL danger;

  factory DangerJSON.fromJson(Map<String, dynamic> json) =>
      _$DangerJSONFromJson(json);

  DangerJSON({this.danger});

  Map<String, dynamic> toJson() => _$DangerJSONToJson(this);
}

@JsonSerializable()
class DangerJSONDSL {
  /// The data only version of Git DSL
  final GitJSONDSL git;

  /// The data only version of BitBucket Cloud DSL
  @JsonKey(name: 'bitbucket_cloud')
  final BitBucketCloudJSONDSL bitbucketCloud;

  final GitHubDSL github;

  factory DangerJSONDSL.fromJson(Map<String, dynamic> json) =>
      _$DangerJSONDSLFromJson(json);

  DangerJSONDSL({this.bitbucketCloud, this.git, this.github});
  Map<String, dynamic> toJson() => _$DangerJSONDSLToJson(this);
}

@JsonSerializable()
class DangerJSONSettings {
  final CliArgs cliArgs;

  factory DangerJSONSettings.fromJson(Map<String, dynamic> json) =>
      _$DangerJSONSettingsFromJson(json);

  DangerJSONSettings({this.cliArgs});
  Map<String, dynamic> toJson() => _$DangerJSONSettingsToJson(this);
}
