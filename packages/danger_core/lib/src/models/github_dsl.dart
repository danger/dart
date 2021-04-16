import 'package:danger_core/src/models/git_dsl.dart';
import 'package:json_annotation/json_annotation.dart'
    if (dart.library.isolate) 'package:danger_core/src/mock_json_annotation.dart';

part 'github_dsl.g.dart';

enum GitHubPRState {
  @JsonValue('closed')
  closed,
  @JsonValue('open')
  open,
  @JsonValue('locked')
  locked,
  @JsonValue('merged')
  merged,
}

enum GitHubUserType {
  @JsonValue('User')
  user,
  @JsonValue('Organization')
  organization,
  @JsonValue('Bot')
  bot,
}

enum GitHubPRAuthorAssociation {
  @JsonValue('COLLABORATOR')
  collaborator,
  @JsonValue('CONTRIBUTOR')
  contributor,
  @JsonValue('FIRST_TIMER')
  firstTimer,
  @JsonValue('FIRST_TIME_CONTRIBUTOR')
  firstTimeContributor,
  @JsonValue('MEMBER')
  member,
  @JsonValue('NONE')
  none,
  @JsonValue('OWNER')
  owner,
}

enum GitHubReviewState {
  @JsonValue('APPROVED')
  approved,
  @JsonValue('REQUEST_CHANGES')
  requestChanges,
  @JsonValue('COMMENT')
  comment,
  @JsonValue('PENDING')
  pending,
  @JsonValue('COMMENTED')
  commented,
}

@JsonSerializable()
class GitHubDSL {
  /// The issue metadata for a code review session
  final GitHubIssue issue;

  /// The PR metadata for a code review session
  final GitHubPRDSL pr;

  /// The PR metadata specifically formatted for using with the GitHub API client
  final GitHubAPIPR thisPR;

  /// The github commit metadata for a code review session
  final List<GitHubCommit> commits;

  /// The reviews left on this pull request
  final List<GitHubReview> reviews;

  /// The people/teams requested to review this PR
  @JsonKey(name: 'requested_reviewers')
  final GitHubReviewers requested_reviewers;

  GitHubDSL(
      {this.issue,
      this.pr,
      this.thisPR,
      this.commits,
      this.reviews,
      this.requested_reviewers});

  factory GitHubDSL.fromJson(Map<String, dynamic> json) =>
      _$GitHubDSLFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubDSLToJson(this);
}

@JsonSerializable()
class GitHubPRDSL {
  /// The UUID for the PR
  final int number;

  /// The state for the PR
  final GitHubPRState state;

  /// Has the PR been locked to contributors only?
  final bool locked;

  /// The title of the PR
  final String title;

  /// The markdown body message of the PR
  final String body;

  /// ISO6801 Date string for when PR was created
  @JsonKey(name: 'created_at')
  final String createdAt;

  /// ISO6801 Date string for when PR was updated
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  /// optional ISO6801 Date string for when PR was closed
  @JsonKey(name: 'closed_at')
  final String closedAt;

  /// Optional ISO6801 Date string for when PR was merged.
  @JsonKey(name: 'merged_at')
  final String mergedAt;

  /// Merge reference for the _other_ repo.
  final GitHubMergeRef head;

  /// Merge reference for _this_ repo.
  final GitHubMergeRef base;

  /// The User who submitted the PR
  final GitHubUser user;

  /// The User who is assigned the PR
  final GitHubUser assignee;

  /// The Users who are assigned to the PR
  final List<GitHubUser> assignees;

  /// Has the PR been merged yet?
  final bool merged;

  /// The number of comments on the PR
  final int comments;

  /// The number of review-specific comments on the PR
  @JsonKey(name: 'review_comments')
  final int reviewComments;

  /// The number of commits in the PR
  final int commits;

  /// The number of additional lines in the PR
  final int additions;

  /// The number of deleted lines in the PR
  final int deletions;

  /// The number of changed files in the PR
  @JsonKey(name: 'changed_files')
  final int changedFiles;

  /// The link back to this PR as user-facing
  @JsonKey(name: 'html_url')
  final String htmlUrl;

  /// How does the PR author relate to this repo/org?
  @JsonKey(name: 'author_association')
  final GitHubPRAuthorAssociation authorAssociation;

  GitHubPRDSL(
      {this.number,
      this.state,
      this.locked,
      this.title,
      this.body,
      this.createdAt,
      this.updatedAt,
      this.closedAt,
      this.mergedAt,
      this.head,
      this.base,
      this.user,
      this.assignee,
      this.assignees,
      this.merged,
      this.comments,
      this.reviewComments,
      this.commits,
      this.additions,
      this.deletions,
      this.changedFiles,
      this.htmlUrl,
      this.authorAssociation});

  factory GitHubPRDSL.fromJson(Map<String, dynamic> json) =>
      _$GitHubPRDSLFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubPRDSLToJson(this);
}

@JsonSerializable()
class GitHubIssue {
  /// The labels associated with this issue
  final List<GitHubIssueLabel> labels;

  GitHubIssue({this.labels});

  factory GitHubIssue.fromJson(Map<String, dynamic> json) =>
      _$GitHubIssueFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubIssueToJson(this);
}

@JsonSerializable()
class GitHubIssueLabel {
  /// The identifying number of this label
  final int id;

  /// The URL that links to this label
  final String url;

  /// The name of the label
  final String name;

  /// The color associated with this label
  final String color;

  GitHubIssueLabel({this.id, this.url, this.name, this.color});

  factory GitHubIssueLabel.fromJson(Map<String, dynamic> json) =>
      _$GitHubIssueLabelFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubIssueLabelToJson(this);
}

@JsonSerializable()
class GitHubUser {
  /// Generic UUID
  final int id;

  /// The handle for the user/org
  final String login;

  /// Whether the user is an org, or a user
  final GitHubUserType type;

  ///The url for a users's image
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  ///The href for a users's page
  final String href;

  GitHubUser({this.id, this.login, this.type, this.avatarUrl, this.href});

  factory GitHubUser.fromJson(Map<String, dynamic> json) =>
      _$GitHubUserFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubUserToJson(this);
}

@JsonSerializable()
class GitHubRepo {
  /// Generic UUID
  final int id;

  /// The name of the repo, e.g. "Danger-JS"
  final String name;

  /// The full name of the owner + repo, e.g. "Danger/Danger-JS"
  @JsonKey(name: 'full_name')
  final String fullName;

  /// The owner of the repo
  final GitHubUser owner;

  /// Is the repo publicly accessible?
  final bool private;

  /// The textual description of the repo
  final String description;

  /// Is the repo a fork?
  final bool fork;

  /// Is someone assigned to this PR?
  final GitHubUser assignee;

  /// Are there people assigned to this PR?
  final List<GitHubUser> assignees;

  /// The root web URL for the repo, e.g. https://github.com/artsy/emission
  @JsonKey(name: 'html_url')
  final String htmlUrl;

  GitHubRepo(
      {this.id,
      this.name,
      this.fullName,
      this.owner,
      this.private,
      this.description,
      this.fork,
      this.assignee,
      this.assignees,
      this.htmlUrl});

  factory GitHubRepo.fromJson(Map<String, dynamic> json) =>
      _$GitHubRepoFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubRepoToJson(this);
}

@JsonSerializable()
class GitHubMergeRef {
  /// The human display name for the merge reference, e.g. "artsy:master"
  final String label;

  /// The reference point for the merge, e.g. "master"
  final String ref;

  /// The reference point for the merge, e.g. "704dc55988c6996f69b6873c2424be7d1de67bbe"
  final String sha;

  /// The user that owns the merge reference e.g. "artsy"
  final GitHubUser user;

  /// The repo from whch the reference comes from
  final GitHubRepo repo;

  GitHubMergeRef({this.label, this.ref, this.sha, this.user, this.repo});

  factory GitHubMergeRef.fromJson(Map<String, dynamic> json) =>
      _$GitHubMergeRefFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubMergeRefToJson(this);
}

@JsonSerializable()
class GitHubAPIPR {
  /// The repo owner
  final String owner;

  /// The repo name
  final String repo;

  /// The PR number
  final int number;

  GitHubAPIPR({this.owner, this.repo, this.number});

  factory GitHubAPIPR.fromJson(Map<String, dynamic> json) =>
      _$GitHubAPIPRFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubAPIPRToJson(this);
}

@JsonSerializable()
class GitHubCommit {
  /// The raw commit metadata
  final GitCommit commit;

  /// The SHA for the commit
  final String sha;

  /// the url for the commit on GitHub
  final String url;

  /// The GitHub user who wrote the code
  final GitHubUser author;

  /// The GitHub user who shipped the code
  final GitHubUser committer;

  /// An array of parent commit shas
  final List<dynamic> parents;

  GitHubCommit(
      {this.commit,
      this.sha,
      this.url,
      this.author,
      this.committer,
      this.parents});

  factory GitHubCommit.fromJson(Map<String, dynamic> json) =>
      _$GitHubCommitFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubCommitToJson(this);
}

@JsonSerializable()
class GitHubReview {
  /// The user requested to review, or the user who has completed the review
  final GitHubUser user;

  /// If there is a review, this provides the ID for it
  final int id;

  /// If there is a review, the body of the review
  final String body;

  /// If there is a review, the commit ID this review was made on
  @JsonKey(name: 'commit_id')
  final String commitId;

  /// The state of the review
  /// * APPROVED, REQUEST_CHANGES, COMMENT or PENDING
  final GitHubReviewState state;

  GitHubReview({this.user, this.id, this.body, this.commitId, this.state});

  factory GitHubReview.fromJson(Map<String, dynamic> json) =>
      _$GitHubReviewFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubReviewToJson(this);
}

@JsonSerializable()
class GitHubReviewers {
  /// Users that have been requested
  final List<GitHubUser> users;

  /// Teams that have been requested
  final List<dynamic> teams;

  GitHubReviewers({this.users, this.teams});

  factory GitHubReviewers.fromJson(Map<String, dynamic> json) =>
      _$GitHubReviewersFromJson(json);
  Map<String, dynamic> toJson() => _$GitHubReviewersToJson(this);
}
