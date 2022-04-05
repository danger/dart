// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'danger_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DangerResults _$DangerResultsFromJson(Map<String, dynamic> json) =>
    DangerResults(
      fails: (json['fails'] as List<dynamic>)
          .map((e) => Violation.fromJson(e as Map<String, dynamic>))
          .toList(),
      warnings: (json['warnings'] as List<dynamic>)
          .map((e) => Violation.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Violation.fromJson(e as Map<String, dynamic>))
          .toList(),
      markdowns: (json['markdowns'] as List<dynamic>)
          .map((e) => Violation.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? const DangerResultMetaData()
          : DangerResultMetaData.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DangerResultsToJson(DangerResults instance) =>
    <String, dynamic>{
      'fails': instance.fails.map((e) => e.toJson()).toList(),
      'warnings': instance.warnings.map((e) => e.toJson()).toList(),
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'markdowns': instance.markdowns.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };

DangerResultMetaData _$DangerResultMetaDataFromJson(
        Map<String, dynamic> json) =>
    DangerResultMetaData(
      runtimeName: json['runtimeName'] as String? ?? 'Danger Dart',
      runtimeHref:
          json['runtimeHref'] as String? ?? 'https://danger.systems/dart',
    );

Map<String, dynamic> _$DangerResultMetaDataToJson(
        DangerResultMetaData instance) =>
    <String, dynamic>{
      'runtimeName': instance.runtimeName,
      'runtimeHref': instance.runtimeHref,
    };
