import 'package:json_annotation/json_annotation.dart';

part 'git_dsl.g.dart';

@JsonSerializable()
class GitJSONDSL {
  /// Filepaths with changes relative to the git root
  @JsonKey(name: 'modified_files')
  final List<String> modifiedFiles;

  ///Newly created filepaths relative to the git root
  @JsonKey(name: 'created_files')
  final List<String> createdFiles;

  /// Removed filepaths relative to the git root
  @JsonKey(name: 'deleted_files')
  final List<String> deletedFiles;

  /// The Git commit metadata
  final List<GitCommit> commits;

  factory GitJSONDSL.fromJson(Map<String, dynamic> json) =>
      _$GitJSONDSLFromJson(json);

  GitJSONDSL(
      {this.modifiedFiles, this.createdFiles, this.deletedFiles, this.commits});

  Map<String, dynamic> toJson() => _$GitJSONDSLToJson(this);
}

@JsonSerializable()
class GitCommit {
  /// The SHA for the commit
  final String sha;

  /// Who wrote the commit
  final GitCommitAuthor author;

  /// Who deployed the commit
  final GitCommitAuthor committer;

  /// The commit message
  final String message;

  /// Potential parent commits, and other assorted metadata
  final dynamic tree;

  /// SHAs for the commit's parents
  final List<String> parents;

  /// Link to the commit
  final String url;

  factory GitCommit.fromJson(Map<String, dynamic> json) =>
      _$GitCommitFromJson(json);

  GitCommit(
      {this.sha,
      this.author,
      this.committer,
      this.message,
      this.tree,
      this.parents,
      this.url});
  Map<String, dynamic> toJson() => _$GitCommitToJson(this);
}

@JsonSerializable()
class GitCommitAuthor {
  /// The display name for the author
  final String name;

  /// The authors email
  final String email;

  /// ISO6801 date string
  final String date;

  factory GitCommitAuthor.fromJson(Map<String, dynamic> json) =>
      _$GitCommitAuthorFromJson(json);

  GitCommitAuthor({this.name, this.email, this.date});
  Map<String, dynamic> toJson() => _$GitCommitAuthorToJson(this);
}
