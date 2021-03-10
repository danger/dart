import 'package:json_annotation/json_annotation.dart';

part 'violation.g.dart';

@JsonSerializable()
class Violation {
  /// The string representation
  final String message;

  /// Optional path to the file
  final String? file;

  /// Optional line in the file
  final int? line;

  /// Optional icon for table (Only valid for messages)
  final String? icon;

  factory Violation.fromJson(Map<String, dynamic> json) =>
      _$ViolationFromJson(json);

  Violation({required this.message, this.file, this.line, this.icon});
  Map<String, dynamic> toJson() => _$ViolationToJson(this);
}
