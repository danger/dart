// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'danger_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DangerResults _$DangerResultsFromJson(Map<String, dynamic> json) {
  return DangerResults(
    fails: (json['fails'] as List)
        ?.map((e) =>
            e == null ? null : Violation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    warnings: (json['warnings'] as List)
        ?.map((e) =>
            e == null ? null : Violation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Violation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    markdowns: (json['markdowns'] as List)
        ?.map((e) =>
            e == null ? null : Violation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DangerResultsToJson(DangerResults instance) =>
    <String, dynamic>{
      'fails': instance.fails?.map((e) => e?.toJson())?.toList(),
      'warnings': instance.warnings?.map((e) => e?.toJson())?.toList(),
      'messages': instance.messages?.map((e) => e?.toJson())?.toList(),
      'markdowns': instance.markdowns?.map((e) => e?.toJson())?.toList(),
    };

DangerResultMetaData _$DangerResultMetaDataFromJson(Map<String, dynamic> json) {
  return DangerResultMetaData();
}

Map<String, dynamic> _$DangerResultMetaDataToJson(
        DangerResultMetaData instance) =>
    <String, dynamic>{};
