import 'package:json_annotation/json_annotation.dart'
    if (dart.library.isolate) 'package:danger_core/src/mock_json_annotation.dart';

part 'gitlab_dsl.g.dart';

@JsonSerializable()
class GitLabDSL {
  @JsonKey(name: 'mr')
  final GitLabMergeRequest mergeRequest;

  final GitLabMetadata metadata;

  GitLabDSL({required this.mergeRequest, required this.metadata});

  factory GitLabDSL.fromJson(Map<String, dynamic> json) =>
      _$GitLabDSLFromJson(json);
  Map<String, dynamic> toJson() => _$GitLabDSLToJson(this);
}

@JsonSerializable()
class GitLabDiffRefs {
  @JsonKey(name: 'base_sha')
  final String baseSha;

  @JsonKey(name: 'head_sha')
  final String headSha;

  @JsonKey(name: 'start_sha')
  final String startSha;

  GitLabDiffRefs(
      {required this.baseSha, required this.headSha, required this.startSha});

  factory GitLabDiffRefs.fromJson(Map<String, dynamic> json) =>
      _$GitLabDiffRefsFromJson(json);
  Map<String, dynamic> toJson() => _$GitLabDiffRefsToJson(this);
}

@JsonSerializable()
class GitLabUserMergeData {
  @JsonKey(name: 'can_merge')
  final bool canMerge;

  GitLabUserMergeData({required this.canMerge});

  factory GitLabUserMergeData.fromJson(Map<String, dynamic> json) =>
      _$GitLabUserMergeDataFromJson(json);
  Map<String, dynamic> toJson() => _$GitLabUserMergeDataToJson(this);
}

@JsonSerializable()
class GitLabMergeRequest {
  @JsonKey(name: 'allow_collaboration')
  final bool allowCollaboration;

  @JsonKey(name: 'allow_maintainer_to_push')
  final bool allowMaintainerToPush;

  @JsonKey(name: 'approvals_before_merge')
  final int? approvalsBeforeMerge;

  final GitLabUser? assignee;

  final GitLabUser author;

  @JsonKey(name: 'changes_count')
  final String changesCount;

  @JsonKey(name: 'closed_at')
  final DateTime? closedAt;

  @JsonKey(name: 'closed_by')
  final GitLabUser? closedBy;

  final String description;

  @JsonKey(name: 'diff_refs')
  final GitLabDiffRefs diffRefs;

  final int downvotes;

  @JsonKey(name: 'first_deployed_to_production_at')
  final DateTime? firstDeployedToProductionAt;

  @JsonKey(name: 'force_remove_source_branch')
  final bool forceRemoveSourceBranch;

  final int id;

  final int iid;

  @JsonKey(name: 'latest_build_finished_at')
  final DateTime? latestBuildFinishedAt;

  @JsonKey(name: 'latest_build_started_at')
  final DateTime? latestBuildStartedAt;

  final List<String> labels;

  @JsonKey(name: 'merge_commit_sha')
  final String? mergeCommitSha;

  @JsonKey(name: 'merged_at')
  final DateTime? mergedAt;

  @JsonKey(name: 'merged_by')
  final GitLabUser? mergedBy;

  @JsonKey(name: 'merge_when_pipeline_succeeds')
  final bool mergeOnPipelineSuccess;

  final GitLabMilestone? milestone;

  final GitLabPipeline pipeline;

  @JsonKey(name: 'project_id')
  final int projectId;

  final String sha;

  @JsonKey(name: 'should_remove_source_branch')
  final bool? shouldRemoveSourceBranch;

  @JsonKey(name: 'source_branch')
  final String sourceBranch;

  @JsonKey(name: 'source_project_id')
  final int sourceProjectId;

  final GitLabMergeRequestState state;

  final bool subscribed;

  @JsonKey(name: 'target_branch')
  final String targetBranch;

  @JsonKey(name: 'target_project_id')
  final int targetProjectId;

  final GitLabMergeRequestTimeStats? timeStats;

  final String title;

  final int upvotes;

  @JsonKey(name: 'user')
  final GitLabUserMergeData userMergeData;

  @JsonKey(name: 'user_notes_count')
  final int userNotesCount;

  @JsonKey(name: 'web_url')
  final String webUrl;

  @JsonKey(name: 'work_in_progress')
  final bool workInProgress;

  GitLabMergeRequest(
      {required this.allowCollaboration,
      required this.allowMaintainerToPush,
      this.approvalsBeforeMerge,
      this.assignee,
      required this.author,
      required this.changesCount,
      this.closedAt,
      this.closedBy,
      required this.description,
      required this.diffRefs,
      required this.downvotes,
      this.firstDeployedToProductionAt,
      required this.forceRemoveSourceBranch,
      required this.id,
      required this.iid,
      this.latestBuildFinishedAt,
      this.latestBuildStartedAt,
      required this.labels,
      this.mergeCommitSha,
      this.mergedAt,
      this.mergedBy,
      required this.mergeOnPipelineSuccess,
      this.milestone,
      required this.pipeline,
      required this.projectId,
      required this.sha,
      this.shouldRemoveSourceBranch,
      required this.sourceBranch,
      required this.sourceProjectId,
      required this.state,
      required this.subscribed,
      required this.targetBranch,
      required this.targetProjectId,
      this.timeStats,
      required this.title,
      required this.upvotes,
      required this.userMergeData,
      required this.userNotesCount,
      required this.webUrl,
      required this.workInProgress});

  factory GitLabMergeRequest.fromJson(Map<String, dynamic> json) =>
      _$GitLabMergeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GitLabMergeRequestToJson(this);
}

@JsonSerializable()
class GitLabMergeRequestTimeStats {
  @JsonKey(name: 'human_time_estimate')
  final int humanTimeEstimate;

  @JsonKey(name: 'human_time_spent')
  final int humanTimeSpent;

  @JsonKey(name: 'time_estimate')
  final int timeEstimate;

  @JsonKey(name: 'total_time_spent')
  final int totalTimeSpent;

  GitLabMergeRequestTimeStats(
      {required this.humanTimeEstimate,
      required this.humanTimeSpent,
      required this.timeEstimate,
      required this.totalTimeSpent});

  factory GitLabMergeRequestTimeStats.fromJson(Map<String, dynamic> json) =>
      _$GitLabMergeRequestTimeStatsFromJson(json);
  Map<String, dynamic> toJson() => _$GitLabMergeRequestTimeStatsToJson(this);
}

@JsonSerializable()
class GitLabMetadata {
  final String pullRequestID;
  final String repoSlug;

  GitLabMetadata({required this.pullRequestID, required this.repoSlug});

  factory GitLabMetadata.fromJson(Map<String, dynamic> json) =>
      _$GitLabMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$GitLabMetadataToJson(this);
}

enum GitLabMergeRequestState {
  @JsonValue('closed')
  closed,

  @JsonValue('locked')
  locked,

  @JsonValue('merged')
  merged,

  @JsonValue('opened')
  opened
}

@JsonSerializable()
class GitLabMilestone {
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  final String description;

  @JsonKey(name: 'due_date')
  final DateTime dueDate;

  final int id;

  final int iid;

  @JsonKey(name: 'project_id')
  final int projectID;

  @JsonKey(name: 'start_date')
  final DateTime startDate;

  final GitLabMilestoneState state;

  final String title;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'web_url')
  final String webUrl;

  GitLabMilestone(
      {required this.createdAt,
      required this.description,
      required this.dueDate,
      required this.id,
      required this.iid,
      required this.projectID,
      required this.startDate,
      required this.state,
      required this.title,
      required this.updatedAt,
      required this.webUrl});

  factory GitLabMilestone.fromJson(Map<String, dynamic> json) =>
      _$GitLabMilestoneFromJson(json);
  Map<String, dynamic> toJson() => _$GitLabMilestoneToJson(this);
}

enum GitLabMilestoneState {
  @JsonValue('active')
  active,

  @JsonValue('closed')
  closed
}

@JsonSerializable()
class GitLabPipeline {
  final int id;

  final String ref;

  final String sha;

  final GitLabPipelineStatus status;

  @JsonKey(name: 'web_url')
  final String webUrl;

  GitLabPipeline(
      {required this.id,
      required this.ref,
      required this.sha,
      required this.status,
      required this.webUrl});

  factory GitLabPipeline.fromJson(Map<String, dynamic> json) =>
      _$GitLabPipelineFromJson(json);
  Map<String, dynamic> toJson() => _$GitLabPipelineToJson(this);
}

enum GitLabPipelineStatus {
  @JsonValue('cancelled')
  cancelled,

  @JsonValue('failed')
  failed,

  @JsonValue('pending')
  pending,

  @JsonValue('running')
  running,

  @JsonValue('skipped')
  skipped,

  @JsonValue('success')
  success
}

@JsonSerializable()
class GitLabUser {
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  final int id;

  final String name;

  final GitLabUserState state;

  final String username;

  @JsonKey(name: 'web_url')
  final String webUrl;

  GitLabUser(
      {this.avatarUrl,
      required this.id,
      required this.name,
      required this.state,
      required this.username,
      required this.webUrl});

  factory GitLabUser.fromJson(Map<String, dynamic> json) =>
      _$GitLabUserFromJson(json);
  Map<String, dynamic> toJson() => _$GitLabUserToJson(this);
}

enum GitLabUserState {
  @JsonValue('active')
  active,

  @JsonValue('blocked')
  blocked,
}
