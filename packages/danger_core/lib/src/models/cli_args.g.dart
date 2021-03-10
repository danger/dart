// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cli_args.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CliArgs _$CliArgsFromJson(Map<String, dynamic> json) {
  return CliArgs(
    base: json['base'] as String,
    verbose: json['verbose'] as String,
    externalCiProvider: json['externalCiProvider'] as String,
    textOnly: json['textOnly'] as String,
    dangerfile: json['dangerfile'] as String,
    id: json['id'] as String,
    staging: json['staging'] as bool,
  );
}

Map<String, dynamic> _$CliArgsToJson(CliArgs instance) => <String, dynamic>{
      'base': instance.base,
      'verbose': instance.verbose,
      'externalCiProvider': instance.externalCiProvider,
      'textOnly': instance.textOnly,
      'dangerfile': instance.dangerfile,
      'id': instance.id,
      'staging': instance.staging,
    };
