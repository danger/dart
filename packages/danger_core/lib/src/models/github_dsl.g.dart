// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_dsl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitHubDSL _$GitHubDSLFromJson(Map<String, dynamic> json) => GitHubDSL(
      issue: GitHubIssue.fromJson(json['issue'] as Map<String, dynamic>),
      pr: GitHubPRDSL.fromJson(json['pr'] as Map<String, dynamic>),
      thisPR: GitHubAPIPR.fromJson(json['thisPR'] as Map<String, dynamic>),
      commits: (json['commits'] as List<dynamic>)
          .map((e) => GitHubCommit.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => GitHubReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestedReviewers: GitHubReviewers.fromJson(
          json['requested_reviewers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GitHubDSLToJson(GitHubDSL instance) => <String, dynamic>{
      'issue': instance.issue.toJson(),
      'pr': instance.pr.toJson(),
      'thisPR': instance.thisPR.toJson(),
      'commits': instance.commits.map((e) => e.toJson()).toList(),
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
      'requested_reviewers': instance.requestedReviewers.toJson(),
    };

GitHubPRDSL _$GitHubPRDSLFromJson(Map<String, dynamic> json) => GitHubPRDSL(
      number: json['number'] as int,
      state: $enumDecode(_$GitHubPRStateEnumMap, json['state']),
      locked: json['locked'] as bool,
      title: json['title'] as String,
      body: json['body'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      closedAt: json['closed_at'] as String?,
      mergedAt: json['merged_at'] as String?,
      head: GitHubMergeRef.fromJson(json['head'] as Map<String, dynamic>),
      base: GitHubMergeRef.fromJson(json['base'] as Map<String, dynamic>),
      user: GitHubUser.fromJson(json['user'] as Map<String, dynamic>),
      assignee: json['assignee'] == null
          ? null
          : GitHubUser.fromJson(json['assignee'] as Map<String, dynamic>),
      assignees: (json['assignees'] as List<dynamic>?)
          ?.map((e) => GitHubUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      merged: json['merged'] as bool?,
      comments: json['comments'] as int,
      reviewComments: json['review_comments'] as int,
      commits: json['commits'] as int,
      additions: json['additions'] as int?,
      deletions: json['deletions'] as int?,
      changedFiles: json['changed_files'] as int?,
      htmlUrl: json['html_url'] as String,
      authorAssociation: $enumDecodeNullable(
          _$GitHubPRAuthorAssociationEnumMap, json['author_association']),
    );

Map<String, dynamic> _$GitHubPRDSLToJson(GitHubPRDSL instance) =>
    <String, dynamic>{
      'number': instance.number,
      'state': _$GitHubPRStateEnumMap[instance.state],
      'locked': instance.locked,
      'title': instance.title,
      'body': instance.body,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'closed_at': instance.closedAt,
      'merged_at': instance.mergedAt,
      'head': instance.head.toJson(),
      'base': instance.base.toJson(),
      'user': instance.user.toJson(),
      'assignee': instance.assignee?.toJson(),
      'assignees': instance.assignees?.map((e) => e.toJson()).toList(),
      'merged': instance.merged,
      'comments': instance.comments,
      'review_comments': instance.reviewComments,
      'commits': instance.commits,
      'additions': instance.additions,
      'deletions': instance.deletions,
      'changed_files': instance.changedFiles,
      'html_url': instance.htmlUrl,
      'author_association':
          _$GitHubPRAuthorAssociationEnumMap[instance.authorAssociation],
    };

const _$GitHubPRStateEnumMap = {
  GitHubPRState.closed: 'closed',
  GitHubPRState.open: 'open',
  GitHubPRState.locked: 'locked',
  GitHubPRState.merged: 'merged',
};

const _$GitHubPRAuthorAssociationEnumMap = {
  GitHubPRAuthorAssociation.collaborator: 'COLLABORATOR',
  GitHubPRAuthorAssociation.contributor: 'CONTRIBUTOR',
  GitHubPRAuthorAssociation.firstTimer: 'FIRST_TIMER',
  GitHubPRAuthorAssociation.firstTimeContributor: 'FIRST_TIME_CONTRIBUTOR',
  GitHubPRAuthorAssociation.member: 'MEMBER',
  GitHubPRAuthorAssociation.none: 'NONE',
  GitHubPRAuthorAssociation.owner: 'OWNER',
};

GitHubIssue _$GitHubIssueFromJson(Map<String, dynamic> json) => GitHubIssue(
      labels: (json['labels'] as List<dynamic>)
          .map((e) => GitHubIssueLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GitHubIssueToJson(GitHubIssue instance) =>
    <String, dynamic>{
      'labels': instance.labels.map((e) => e.toJson()).toList(),
    };

GitHubIssueLabel _$GitHubIssueLabelFromJson(Map<String, dynamic> json) =>
    GitHubIssueLabel(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$GitHubIssueLabelToJson(GitHubIssueLabel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'color': instance.color,
    };

GitHubUser _$GitHubUserFromJson(Map<String, dynamic> json) => GitHubUser(
      id: json['id'] as int,
      login: json['login'] as String,
      type: $enumDecode(_$GitHubUserTypeEnumMap, json['type']),
      avatarUrl: json['avatar_url'] as String?,
      href: json['html_url'] as String,
    );

Map<String, dynamic> _$GitHubUserToJson(GitHubUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'type': _$GitHubUserTypeEnumMap[instance.type],
      'avatar_url': instance.avatarUrl,
      'html_url': instance.href,
    };

const _$GitHubUserTypeEnumMap = {
  GitHubUserType.user: 'User',
  GitHubUserType.organization: 'Organization',
  GitHubUserType.bot: 'Bot',
};

GitHubRepo _$GitHubRepoFromJson(Map<String, dynamic> json) => GitHubRepo(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      owner: GitHubUser.fromJson(json['owner'] as Map<String, dynamic>),
      private: json['private'] as bool,
      description: json['description'] as String?,
      fork: json['fork'] as bool,
      htmlUrl: json['html_url'] as String,
    );

Map<String, dynamic> _$GitHubRepoToJson(GitHubRepo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'owner': instance.owner.toJson(),
      'private': instance.private,
      'description': instance.description,
      'fork': instance.fork,
      'html_url': instance.htmlUrl,
    };

GitHubMergeRef _$GitHubMergeRefFromJson(Map<String, dynamic> json) =>
    GitHubMergeRef(
      label: json['label'] as String,
      ref: json['ref'] as String,
      sha: json['sha'] as String,
      user: GitHubUser.fromJson(json['user'] as Map<String, dynamic>),
      repo: GitHubRepo.fromJson(json['repo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GitHubMergeRefToJson(GitHubMergeRef instance) =>
    <String, dynamic>{
      'label': instance.label,
      'ref': instance.ref,
      'sha': instance.sha,
      'user': instance.user.toJson(),
      'repo': instance.repo.toJson(),
    };

GitHubAPIPR _$GitHubAPIPRFromJson(Map<String, dynamic> json) => GitHubAPIPR(
      owner: json['owner'] as String,
      repo: json['repo'] as String,
      number: json['number'] as int,
    );

Map<String, dynamic> _$GitHubAPIPRToJson(GitHubAPIPR instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'repo': instance.repo,
      'number': instance.number,
    };

GitHubCommit _$GitHubCommitFromJson(Map<String, dynamic> json) => GitHubCommit(
      commit: GitCommit.fromJson(json['commit'] as Map<String, dynamic>),
      sha: json['sha'] as String,
      url: json['url'] as String,
      author: json['author'] == null
          ? null
          : GitHubUser.fromJson(json['author'] as Map<String, dynamic>),
      committer: json['committer'] == null
          ? null
          : GitHubUser.fromJson(json['committer'] as Map<String, dynamic>),
      parents: json['parents'] as List<dynamic>?,
    );

Map<String, dynamic> _$GitHubCommitToJson(GitHubCommit instance) =>
    <String, dynamic>{
      'commit': instance.commit.toJson(),
      'sha': instance.sha,
      'url': instance.url,
      'author': instance.author?.toJson(),
      'committer': instance.committer?.toJson(),
      'parents': instance.parents,
    };

GitHubReview _$GitHubReviewFromJson(Map<String, dynamic> json) => GitHubReview(
      user: GitHubUser.fromJson(json['user'] as Map<String, dynamic>),
      id: json['id'] as int?,
      body: json['body'] as String?,
      commitId: json['commit_id'] as String?,
      state: $enumDecodeNullable(_$GitHubReviewStateEnumMap, json['state']),
    );

Map<String, dynamic> _$GitHubReviewToJson(GitHubReview instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'id': instance.id,
      'body': instance.body,
      'commit_id': instance.commitId,
      'state': _$GitHubReviewStateEnumMap[instance.state],
    };

const _$GitHubReviewStateEnumMap = {
  GitHubReviewState.approved: 'APPROVED',
  GitHubReviewState.changesRequested: 'CHANGES_REQUESTED',
  GitHubReviewState.dimissed: 'DISMISSED',
  GitHubReviewState.requestChanges: 'REQUEST_CHANGES',
  GitHubReviewState.comment: 'COMMENT',
  GitHubReviewState.pending: 'PENDING',
  GitHubReviewState.commented: 'COMMENTED',
};

GitHubReviewers _$GitHubReviewersFromJson(Map<String, dynamic> json) =>
    GitHubReviewers(
      users: (json['users'] as List<dynamic>)
          .map((e) => GitHubUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      teams: json['teams'] as List<dynamic>,
    );

Map<String, dynamic> _$GitHubReviewersToJson(GitHubReviewers instance) =>
    <String, dynamic>{
      'users': instance.users.map((e) => e.toJson()).toList(),
      'teams': instance.teams,
    };
