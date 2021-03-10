import 'package:json_annotation/json_annotation.dart';

part 'cli_args.g.dart';

@JsonSerializable()
class CliArgs {
  /// The base reference used by danger PR (e.g. not master)
  final String base;

  /// For debugging
  final String verbose;

  /// Used by danger-js o allow having a custom CI
  final String externalCiProvider;

  /// Use SDTOUT instead of posting to the code review side
  final String textOnly;

  /// A custom path for the dangerfile (can also be a remote reference)
  final String dangerfile;

  /// So you can have many danger runs in one code review
  final String id;

  /// Use staged changes
  final bool? staging;

  factory CliArgs.fromJson(Map<String, dynamic> json) =>
      _$CliArgsFromJson(json);

  CliArgs(
      {required this.base,
      required this.verbose,
      required this.externalCiProvider,
      required this.textOnly,
      required this.dangerfile,
      required this.id,
      this.staging});

  Map<String, dynamic> toJson() => _$CliArgsToJson(this);
}
