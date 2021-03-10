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

Map<String, dynamic> _$ViolationToJson(Violation instance) => <String, dynamic>{
      'message': instance.message,
      'file': instance.file,
      'line': instance.line,
      'icon': instance.icon,
    };
