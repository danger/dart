import 'package:danger_core/src/models/violation.dart';
import 'package:json_annotation/json_annotation.dart'
    if (dart.library.isolate) 'package:danger_core/src/mock_json_annotation.dart';

part 'danger_results.g.dart';

@JsonSerializable()
class DangerResults {
  final List<Violation> fails;

  final List<Violation> warnings;

  final List<Violation> messages;

  final List<Violation> markdowns;

  final meta = DangerResultMetaData();

  DangerResults({this.fails, this.warnings, this.messages, this.markdowns});

  factory DangerResults.fromJson(Map<String, dynamic> json) =>
      _$DangerResultsFromJson(json);
  Map<String, dynamic> toJson() => _$DangerResultsToJson(this);
}

@JsonSerializable()
class DangerResultMetaData {
  final String runtimeName = 'Danger Dart';
  final String runtimeHref = 'https://danger.systems/dart';

  DangerResultMetaData();

  factory DangerResultMetaData.fromJson(Map<String, dynamic> json) =>
      _$DangerResultMetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$DangerResultMetaDataToJson(this);
}
