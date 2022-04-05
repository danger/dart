import 'package:json_annotation/json_annotation.dart'
    if (dart.library.isolate) 'package:danger_core/src/mock_json_annotation.dart';

part 'settings_github.g.dart';

@JsonSerializable()
class DangetSettingsGithub {
  final String accessToken;
  final Map<String, dynamic>? additionalHeaders;

  factory DangetSettingsGithub.fromJson(Map<String, dynamic> json) =>
      _$DangetSettingsGithubFromJson(json);

  DangetSettingsGithub({this.additionalHeaders, required this.accessToken});
  Map<String, dynamic> toJson() => _$DangetSettingsGithubToJson(this);
}
