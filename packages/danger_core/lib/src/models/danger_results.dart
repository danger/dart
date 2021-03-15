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

  final DangerResultMetaData meta;

  DangerResults(
      {this.fails,
      this.warnings,
      this.messages,
      this.markdowns,
      this.meta = const DangerResultMetaData()});

  factory DangerResults.fromJson(Map<String, dynamic> json) =>
      _$DangerResultsFromJson(json);
  Map<String, dynamic> toJson() => _$DangerResultsToJson(this);
}

@JsonSerializable()
class DangerResultMetaData {
  final String runtimeName;
  final String runtimeHref;

  const DangerResultMetaData(
      {this.runtimeName = 'Danger Dart',
      this.runtimeHref = 'https://danger.systems/dart'});

  factory DangerResultMetaData.fromJson(Map<String, dynamic> json) =>
      _$DangerResultMetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$DangerResultMetaDataToJson(this);
}
