// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'danger_dsl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DangerJSON _$DangerJSONFromJson(Map<String, dynamic> json) => DangerJSON(
      danger: DangerRawJSONDSL.fromJson(json['danger'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DangerJSONToJson(DangerJSON instance) =>
    <String, dynamic>{
      'danger': instance.danger.toJson(),
    };

DangerRawJSONDSL _$DangerRawJSONDSLFromJson(Map<String, dynamic> json) =>
    DangerRawJSONDSL(
      git: GitJSONDSL.fromJson(json['git'] as Map<String, dynamic>),
      bitbucketCloud: json['bitbucket_cloud'] == null
          ? null
          : BitBucketCloudJSONDSL.fromJson(
              json['bitbucket_cloud'] as Map<String, dynamic>),
      github: json['github'] == null
          ? null
          : GitHubDSL.fromJson(json['github'] as Map<String, dynamic>),
      settings: json['settings'] == null
          ? null
          : DangerJSONSettings.fromJson(
              json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DangerRawJSONDSLToJson(DangerRawJSONDSL instance) =>
    <String, dynamic>{
      'git': instance.git.toJson(),
      'bitbucket_cloud': instance.bitbucketCloud?.toJson(),
      'github': instance.github?.toJson(),
      'settings': instance.settings?.toJson(),
    };

DangerJSONSettings _$DangerJSONSettingsFromJson(Map<String, dynamic> json) =>
    DangerJSONSettings(
      cliArgs: json['cliArgs'] as Map<String, dynamic>?,
      github: json['github'] == null
          ? null
          : DangetSettingsGithub.fromJson(
              json['github'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DangerJSONSettingsToJson(DangerJSONSettings instance) =>
    <String, dynamic>{
      'cliArgs': instance.cliArgs,
      'github': instance.github?.toJson(),
    };
