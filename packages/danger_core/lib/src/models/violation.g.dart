// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Violation _$ViolationFromJson(Map<String, dynamic> json) {
  return Violation(
    message: json['message'] as String,
    file: json['file'] as String,
    line: json['line'] as int,
    icon: json['icon'] as String,
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

WrappedViolation _$WrappedViolationFromJson(Map<String, dynamic> json) {
  return WrappedViolation(
    type: _$enumDecodeNullable(_$ViolationTypeEnumMap, json['type']),
    violation: json['violation'] == null
        ? null
        : Violation.fromJson(json['violation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WrappedViolationToJson(WrappedViolation instance) =>
    <String, dynamic>{
      'type': _$ViolationTypeEnumMap[instance.type],
      'violation': instance.violation?.toJson(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ViolationTypeEnumMap = {
  ViolationType.message: 'message',
  ViolationType.warn: 'warn',
  ViolationType.fail: 'fail',
  ViolationType.markdown: 'markdown',
};
