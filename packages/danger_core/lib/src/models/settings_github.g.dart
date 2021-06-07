// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_github.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DangetSettingsGithub _$DangetSettingsGithubFromJson(Map<String, dynamic> json) {
  return DangetSettingsGithub(
    additionalHeaders: json['additionalHeaders'] as Map<String, dynamic>,
    accessToken: json['accessToken'] as String,
  );
}

Map<String, dynamic> _$DangetSettingsGithubToJson(
        DangetSettingsGithub instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'additionalHeaders': instance.additionalHeaders,
    };
