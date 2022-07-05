// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitlab_dsl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitLabDSL _$GitLabDSLFromJson(Map<String, dynamic> json) => GitLabDSL(
      mergeRequest:
          GitLabMergeRequest.fromJson(json['mr'] as Map<String, dynamic>),
      metadata:
          GitLabMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GitLabDSLToJson(GitLabDSL instance) => <String, dynamic>{
      'mr': instance.mergeRequest.toJson(),
      'metadata': instance.metadata.toJson(),
    };

GitLabDiffRefs _$GitLabDiffRefsFromJson(Map<String, dynamic> json) =>
    GitLabDiffRefs(
      baseSha: json['base_sha'] as String,
      headSha: json['head_sha'] as String,
      startSha: json['start_sha'] as String,
    );

Map<String, dynamic> _$GitLabDiffRefsToJson(GitLabDiffRefs instance) =>
    <String, dynamic>{
      'base_sha': instance.baseSha,
      'head_sha': instance.headSha,
      'start_sha': instance.startSha,
    };

GitLabUserMergeData _$GitLabUserMergeDataFromJson(Map<String, dynamic> json) =>
    GitLabUserMergeData(
      canMerge: json['can_merge'] as bool,
    );

Map<String, dynamic> _$GitLabUserMergeDataToJson(
        GitLabUserMergeData instance) =>
    <String, dynamic>{
      'can_merge': instance.canMerge,
    };

GitLabMergeRequest _$GitLabMergeRequestFromJson(Map<String, dynamic> json) =>
    GitLabMergeRequest(
      allowCollaboration: json['allow_collaboration'] as bool?,
      allowMaintainerToPush: json['allow_maintainer_to_push'] as bool?,
      approvalsBeforeMerge: json['approvals_before_merge'] as int?,
      assignee: json['assignee'] == null
          ? null
          : GitLabUser.fromJson(json['assignee'] as Map<String, dynamic>),
      author: GitLabUser.fromJson(json['author'] as Map<String, dynamic>),
      changesCount: json['changes_count'] as String,
      closedAt: json['closed_at'] == null
          ? null
          : DateTime.parse(json['closed_at'] as String),
      closedBy: json['closed_by'] == null
          ? null
          : GitLabUser.fromJson(json['closed_by'] as Map<String, dynamic>),
      description: json['description'] as String,
      diffRefs:
          GitLabDiffRefs.fromJson(json['diff_refs'] as Map<String, dynamic>),
      downvotes: json['downvotes'] as int,
      firstDeployedToProductionAt: json['first_deployed_to_production_at'] ==
              null
          ? null
          : DateTime.parse(json['first_deployed_to_production_at'] as String),
      forceRemoveSourceBranch: json['force_remove_source_branch'] as bool?,
      id: json['id'] as int,
      iid: json['iid'] as int,
      latestBuildFinishedAt: json['latest_build_finished_at'] == null
          ? null
          : DateTime.parse(json['latest_build_finished_at'] as String),
      latestBuildStartedAt: json['latest_build_started_at'] == null
          ? null
          : DateTime.parse(json['latest_build_started_at'] as String),
      labels:
          (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
      mergeCommitSha: json['merge_commit_sha'] as String?,
      mergedAt: json['merged_at'] == null
          ? null
          : DateTime.parse(json['merged_at'] as String),
      mergedBy: json['merged_by'] == null
          ? null
          : GitLabUser.fromJson(json['merged_by'] as Map<String, dynamic>),
      mergeOnPipelineSuccess: json['merge_when_pipeline_succeeds'] as bool,
      milestone: json['milestone'] == null
          ? null
          : GitLabMilestone.fromJson(json['milestone'] as Map<String, dynamic>),
      pipeline: json['pipeline'] == null
          ? null
          : GitLabPipeline.fromJson(json['pipeline'] as Map<String, dynamic>),
      projectId: json['project_id'] as int,
      sha: json['sha'] as String,
      shouldRemoveSourceBranch: json['should_remove_source_branch'] as bool?,
      sourceBranch: json['source_branch'] as String,
      sourceProjectId: json['source_project_id'] as int,
      state: $enumDecode(_$GitLabMergeRequestStateEnumMap, json['state']),
      subscribed: json['subscribed'] as bool,
      targetBranch: json['target_branch'] as String,
      targetProjectId: json['target_project_id'] as int,
      timeStats: GitLabMergeRequestTimeStats.fromJson(
          json['timeStats'] as Map<String, dynamic>),
      title: json['title'] as String,
      upvotes: json['upvotes'] as int,
      userMergeData:
          GitLabUserMergeData.fromJson(json['user'] as Map<String, dynamic>),
      userNotesCount: json['user_notes_count'] as int,
      webUrl: json['web_url'] as String,
      workInProgress: json['work_in_progress'] as bool,
    );

Map<String, dynamic> _$GitLabMergeRequestToJson(GitLabMergeRequest instance) =>
    <String, dynamic>{
      'allow_collaboration': instance.allowCollaboration,
      'allow_maintainer_to_push': instance.allowMaintainerToPush,
      'approvals_before_merge': instance.approvalsBeforeMerge,
      'assignee': instance.assignee?.toJson(),
      'author': instance.author.toJson(),
      'changes_count': instance.changesCount,
      'closed_at': instance.closedAt?.toIso8601String(),
      'closed_by': instance.closedBy?.toJson(),
      'description': instance.description,
      'diff_refs': instance.diffRefs.toJson(),
      'downvotes': instance.downvotes,
      'first_deployed_to_production_at':
          instance.firstDeployedToProductionAt?.toIso8601String(),
      'force_remove_source_branch': instance.forceRemoveSourceBranch,
      'id': instance.id,
      'iid': instance.iid,
      'latest_build_finished_at':
          instance.latestBuildFinishedAt?.toIso8601String(),
      'latest_build_started_at':
          instance.latestBuildStartedAt?.toIso8601String(),
      'labels': instance.labels,
      'merge_commit_sha': instance.mergeCommitSha,
      'merged_at': instance.mergedAt?.toIso8601String(),
      'merged_by': instance.mergedBy?.toJson(),
      'merge_when_pipeline_succeeds': instance.mergeOnPipelineSuccess,
      'milestone': instance.milestone?.toJson(),
      'pipeline': instance.pipeline?.toJson(),
      'project_id': instance.projectId,
      'sha': instance.sha,
      'should_remove_source_branch': instance.shouldRemoveSourceBranch,
      'source_branch': instance.sourceBranch,
      'source_project_id': instance.sourceProjectId,
      'state': _$GitLabMergeRequestStateEnumMap[instance.state],
      'subscribed': instance.subscribed,
      'target_branch': instance.targetBranch,
      'target_project_id': instance.targetProjectId,
      'timeStats': instance.timeStats.toJson(),
      'title': instance.title,
      'upvotes': instance.upvotes,
      'user': instance.userMergeData.toJson(),
      'user_notes_count': instance.userNotesCount,
      'web_url': instance.webUrl,
      'work_in_progress': instance.workInProgress,
    };

const _$GitLabMergeRequestStateEnumMap = {
  GitLabMergeRequestState.closed: 'closed',
  GitLabMergeRequestState.locked: 'locked',
  GitLabMergeRequestState.merged: 'merged',
  GitLabMergeRequestState.opened: 'opened',
};

GitLabMergeRequestTimeStats _$GitLabMergeRequestTimeStatsFromJson(
        Map<String, dynamic> json) =>
    GitLabMergeRequestTimeStats(
      humanTimeEstimate: json['human_time_estimate'] as int?,
      humanTimeSpent: json['human_time_spent'] as int?,
      timeEstimate: json['time_estimate'] as int,
      totalTimeSpent: json['total_time_spent'] as int,
    );

Map<String, dynamic> _$GitLabMergeRequestTimeStatsToJson(
        GitLabMergeRequestTimeStats instance) =>
    <String, dynamic>{
      'human_time_estimate': instance.humanTimeEstimate,
      'human_time_spent': instance.humanTimeSpent,
      'time_estimate': instance.timeEstimate,
      'total_time_spent': instance.totalTimeSpent,
    };

GitLabMetadata _$GitLabMetadataFromJson(Map<String, dynamic> json) =>
    GitLabMetadata(
      pullRequestID: json['pullRequestID'] as String,
      repoSlug: json['repoSlug'] as String,
    );

Map<String, dynamic> _$GitLabMetadataToJson(GitLabMetadata instance) =>
    <String, dynamic>{
      'pullRequestID': instance.pullRequestID,
      'repoSlug': instance.repoSlug,
    };

GitLabMilestone _$GitLabMilestoneFromJson(Map<String, dynamic> json) =>
    GitLabMilestone(
      createdAt: DateTime.parse(json['created_at'] as String),
      description: json['description'] as String,
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      id: json['id'] as int,
      iid: json['iid'] as int,
      projectID: json['project_id'] as int,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      state: $enumDecode(_$GitLabMilestoneStateEnumMap, json['state']),
      title: json['title'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      webUrl: json['web_url'] as String,
    );

Map<String, dynamic> _$GitLabMilestoneToJson(GitLabMilestone instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'description': instance.description,
      'due_date': instance.dueDate?.toIso8601String(),
      'id': instance.id,
      'iid': instance.iid,
      'project_id': instance.projectID,
      'start_date': instance.startDate?.toIso8601String(),
      'state': _$GitLabMilestoneStateEnumMap[instance.state],
      'title': instance.title,
      'updated_at': instance.updatedAt.toIso8601String(),
      'web_url': instance.webUrl,
    };

const _$GitLabMilestoneStateEnumMap = {
  GitLabMilestoneState.active: 'active',
  GitLabMilestoneState.closed: 'closed',
};

GitLabPipeline _$GitLabPipelineFromJson(Map<String, dynamic> json) =>
    GitLabPipeline(
      id: json['id'] as int,
      ref: json['ref'] as String,
      sha: json['sha'] as String,
      status: $enumDecode(_$GitLabPipelineStatusEnumMap, json['status']),
      webUrl: json['web_url'] as String,
    );

Map<String, dynamic> _$GitLabPipelineToJson(GitLabPipeline instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ref': instance.ref,
      'sha': instance.sha,
      'status': _$GitLabPipelineStatusEnumMap[instance.status],
      'web_url': instance.webUrl,
    };

const _$GitLabPipelineStatusEnumMap = {
  GitLabPipelineStatus.cancelled: 'cancelled',
  GitLabPipelineStatus.failed: 'failed',
  GitLabPipelineStatus.pending: 'pending',
  GitLabPipelineStatus.running: 'running',
  GitLabPipelineStatus.skipped: 'skipped',
  GitLabPipelineStatus.success: 'success',
};

GitLabUser _$GitLabUserFromJson(Map<String, dynamic> json) => GitLabUser(
      avatarUrl: json['avatar_url'] as String?,
      id: json['id'] as int,
      name: json['name'] as String,
      state: $enumDecode(_$GitLabUserStateEnumMap, json['state']),
      username: json['username'] as String,
      webUrl: json['web_url'] as String,
    );

Map<String, dynamic> _$GitLabUserToJson(GitLabUser instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'id': instance.id,
      'name': instance.name,
      'state': _$GitLabUserStateEnumMap[instance.state],
      'username': instance.username,
      'web_url': instance.webUrl,
    };

const _$GitLabUserStateEnumMap = {
  GitLabUserState.active: 'active',
  GitLabUserState.blocked: 'blocked',
};
