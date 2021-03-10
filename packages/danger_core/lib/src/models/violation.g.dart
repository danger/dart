// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Violation _$ViolationFromJson(Map<String, dynamic> json) {
  return Violation(
    message: json['message'] as String,
    file: json['file'] as String?,
    line: json['line'] as int?,
    icon: json['icon'] as String?,
  );
}

Map<String, dynamic> _$ViolationToJson(Violation instance) {
  final val = <String, dynamic>{
    'message': instance.message,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file', instance.file);
  writeNotNull('line', instance.line);
  writeNotNull('icon', instance.icon);
  return val;
}
