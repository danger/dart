import 'package:json_annotation/json_annotation.dart';

part 'bitbucket_cloud.g.dart';

enum BitBucketCloudPRState {
  @JsonValue('OPEN')
  open,
  @JsonValue('MERGED')
  merged,
  @JsonValue('DECLINED')
  declined,
  @JsonValue('SUPERSEDED')
  superseded
}

@JsonSerializable()
class BitBucketCloudJSONDSL {
  /// The pull request and repository metadata
  final RepoMetaData metadata;

  /// The PR metadata
  final BitBucketCloudPRDSL pr;

  /// The commits associated with the pull request
  final List<BitBucketCloudCommit> commits;

  /// The comments on the pull request
  final List<BitBucketCloudPRComment> comments;

  /// The activities such as OPENING, CLOSING, MERGING or UPDATING a pull request
  final List<BitBucketCloudPRActivity> activities;

  BitBucketCloudJSONDSL(
      {required this.metadata,
      required this.pr,
      required this.commits,
      required this.comments,
      required this.activities});

  factory BitBucketCloudJSONDSL.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudJSONDSLFromJson(json);
  Map<String, dynamic> toJson() => _$BitBucketCloudJSONDSLToJson(this);
}

@JsonSerializable()
class RepoMetaData {
  final String repoSlug;
  final String pullRequestID;

  factory RepoMetaData.fromJson(Map<String, dynamic> json) =>
      _$RepoMetaDataFromJson(json);

  RepoMetaData({required this.repoSlug, required this.pullRequestID});
  Map<String, dynamic> toJson() => _$RepoMetaDataToJson(this);
}

@JsonSerializable()
class BitBucketCloudPRDSL {
  /// The PR's ID
  final int id;

  /// Title of the pull request.
  final String title;

  /// The text describing the PR
  final String description;

  /// The pull request's current status.
  final BitBucketCloudPRState state;

  /// When the pr was created, in ISO 8601 format
  @JsonKey(name: 'created_on')
  final String createdOn;

  /// When the pr was updated, in ISO 8601 format
  @JsonKey(name: 'updated_on')
  final String updatedOn;

  /// The PR's source, The repo Danger is running on
  final BitBucketCloudMergeRef? source;

  /// The PR's destination
  final BitBucketCloudMergeRef destination;

  /// The creator of the PR
  final BitBucketCloudUser author;

  /// People requested as reviewers
  final List<BitBucketCloudUser> reviewers;

  /// People who have participated in the PR
  final List<BitBucketCloudPRParticipant> participants;

  /// Misc links for hypermedia conformance
  /// Avaliable keys:
  /// "decline", "commits", "self", "comments", "merge", "html", "activity", "diff", "approve", "statuses"
  final Map<String, BitBucketCloudLink> links;
  factory BitBucketCloudPRDSL.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudPRDSLFromJson(json);

  BitBucketCloudPRDSL(
      {required this.id,
      required this.title,
      required this.description,
      required this.state,
      required this.createdOn,
      required this.updatedOn,
      this.source,
      required this.destination,
      required this.author,
      required this.reviewers,
      required this.participants,
      required this.links});

  Map<String, dynamic> toJson() => _$BitBucketCloudPRDSLToJson(this);
}

@JsonSerializable()
class BitBucketCloudCommit {
  /// The SHA for the commit
  final String hash;

  /// The author of the commit, assumed to be the person who wrote the code.
  final BitBucketCloudCommitAuthor author;

  /// When the commit was committed to the project, in ISO 8601 format
  final String date;

  /// The commit's message
  final String message;

  /// The commit's parents
  final List<BitBucketCloudPRCommitParent> parents;

  /// The commit's links
  /// Avaliable keys:
  /// "html"
  final Map<String, BitBucketCloudLink> links;

  factory BitBucketCloudCommit.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudCommitFromJson(json);

  BitBucketCloudCommit(
      {required this.hash,
      required this.author,
      required this.date,
      required this.message,
      required this.parents,
      required this.links});
  Map<String, dynamic> toJson() => _$BitBucketCloudCommitToJson(this);
}

@JsonSerializable()
class BitBucketCloudPRComment {
  final bool deleted;

  /// Available keys: "self", "html"
  final Map<String, BitBucketCloudLink> links;

  final BitBucketCloudContent content;

  /// When the comment was created, in ISO 8601 format
  @JsonKey(name: 'created_on')
  final String createdOn;

  final BitBucketCloudUser user;

  /// When the comment was updated, in ISO 8601 format
  @JsonKey(name: 'updated_on')
  final String updatedOn;
  final String type;
  final int id;

  final BitBucketCloudPRCommentInline? inline;

  factory BitBucketCloudPRComment.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudPRCommentFromJson(json);

  BitBucketCloudPRComment(
      {required this.deleted,
      required this.links,
      required this.content,
      required this.createdOn,
      required this.user,
      required this.updatedOn,
      required this.type,
      required this.id,
      this.inline});

  Map<String, dynamic> toJson() => _$BitBucketCloudPRCommentToJson(this);
}

@JsonSerializable()
class BitBucketCloudPRActivity {
  final BitBucketCloudPRComment? comment;

  factory BitBucketCloudPRActivity.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudPRActivityFromJson(json);

  BitBucketCloudPRActivity({this.comment});

  Map<String, dynamic> toJson() => _$BitBucketCloudPRActivityToJson(this);
}

@JsonSerializable()
class BitBucketCloudCommitAuthor {
  /// Format: `Foo Bar <foo@bar.com>`
  final String raw;

  final BitBucketCloudUser? user;

  factory BitBucketCloudCommitAuthor.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudCommitAuthorFromJson(json);

  BitBucketCloudCommitAuthor({required this.raw, this.user});

  Map<String, dynamic> toJson() => _$BitBucketCloudCommitAuthorToJson(this);
}

@JsonSerializable()
class BitBucketCloudPRParticipant {
  final BitBucketCloudUser user;
  final bool approved;

  factory BitBucketCloudPRParticipant.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudPRParticipantFromJson(json);

  BitBucketCloudPRParticipant({required this.user, required this.approved});

  Map<String, dynamic> toJson() => _$BitBucketCloudPRParticipantToJson(this);
}

@JsonSerializable()
class BitBucketCloudUser {
  /// The uuid of the commit author
  final String uuid;

  /// The display name of the commit author
  @JsonKey(name: 'display_name')
  final String displayName;

  /// The nick name of the commit author
  final String nickname;

  /// The acount id of the commit author (could be null on bot user)
  @JsonKey(name: 'account_id')
  final String? accountId;

  factory BitBucketCloudUser.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudUserFromJson(json);

  BitBucketCloudUser(
      {required this.uuid,
      required this.displayName,
      required this.nickname,
      this.accountId});

  Map<String, dynamic> toJson() => _$BitBucketCloudUserToJson(this);
}

@JsonSerializable()
class BitBucketCloudMergeRef {
  final BitBucketCloudMergeRefCommit? commit;
  final BitBucketCloudMergeRefBranch branch;
  final BitBucketCloudRepo? repository;

  factory BitBucketCloudMergeRef.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudMergeRefFromJson(json);

  BitBucketCloudMergeRef({this.commit, required this.branch, this.repository});
  Map<String, dynamic> toJson() => _$BitBucketCloudMergeRefToJson(this);
}

@JsonSerializable()
class BitBucketCloudMergeRefBranch {
  final String name;

  factory BitBucketCloudMergeRefBranch.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudMergeRefBranchFromJson(json);

  BitBucketCloudMergeRefBranch({required this.name});
  Map<String, dynamic> toJson() => _$BitBucketCloudMergeRefBranchToJson(this);
}

@JsonSerializable()
class BitBucketCloudMergeRefCommit {
  final String hash;

  factory BitBucketCloudMergeRefCommit.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudMergeRefCommitFromJson(json);

  BitBucketCloudMergeRefCommit({required this.hash});
  Map<String, dynamic> toJson() => _$BitBucketCloudMergeRefCommitToJson(this);
}

@JsonSerializable()
class BitBucketCloudRepo {
  final String name;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String uuid;

  factory BitBucketCloudRepo.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudRepoFromJson(json);

  BitBucketCloudRepo(this.name, this.fullName, this.uuid);
  Map<String, dynamic> toJson() => _$BitBucketCloudRepoToJson(this);
}

@JsonSerializable()
class BitBucketCloudLink {
  final String href;

  factory BitBucketCloudLink.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudLinkFromJson(json);

  BitBucketCloudLink({required this.href});
  Map<String, dynamic> toJson() => _$BitBucketCloudLinkToJson(this);
}

@JsonSerializable()
class BitBucketCloudContent {
  final String raw;
  final String markup;
  final String html;

  /// "rendered"
  final String type;

  factory BitBucketCloudContent.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudContentFromJson(json);

  BitBucketCloudContent(
      {required this.raw,
      required this.markup,
      required this.html,
      required this.type});

  Map<String, dynamic> toJson() => _$BitBucketCloudContentToJson(this);
}

@JsonSerializable()
class BitBucketCloudPRCommentInline {
  final int? to;
  final int? from;
  final String? path;

  factory BitBucketCloudPRCommentInline.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudPRCommentInlineFromJson(json);

  BitBucketCloudPRCommentInline({this.to, this.from, this.path});
  Map<String, dynamic> toJson() => _$BitBucketCloudPRCommentInlineToJson(this);
}

@JsonSerializable()
class BitBucketCloudPRCommitParent {
  final String hash;

  factory BitBucketCloudPRCommitParent.fromJson(Map<String, dynamic> json) =>
      _$BitBucketCloudPRCommitParentFromJson(json);

  BitBucketCloudPRCommitParent({required this.hash});
  Map<String, dynamic> toJson() => _$BitBucketCloudPRCommitParentToJson(this);
}
