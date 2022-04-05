// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitbucket_cloud.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BitBucketCloudJSONDSL _$BitBucketCloudJSONDSLFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudJSONDSL(
      metadata: RepoMetaData.fromJson(json['metadata'] as Map<String, dynamic>),
      pr: BitBucketCloudPRDSL.fromJson(json['pr'] as Map<String, dynamic>),
      commits: (json['commits'] as List<dynamic>)
          .map((e) => BitBucketCloudCommit.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) =>
              BitBucketCloudPRComment.fromJson(e as Map<String, dynamic>))
          .toList(),
      activities: (json['activities'] as List<dynamic>)
          .map((e) =>
              BitBucketCloudPRActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BitBucketCloudJSONDSLToJson(
        BitBucketCloudJSONDSL instance) =>
    <String, dynamic>{
      'metadata': instance.metadata.toJson(),
      'pr': instance.pr.toJson(),
      'commits': instance.commits.map((e) => e.toJson()).toList(),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'activities': instance.activities.map((e) => e.toJson()).toList(),
    };

RepoMetaData _$RepoMetaDataFromJson(Map<String, dynamic> json) => RepoMetaData(
      repoSlug: json['repoSlug'] as String,
      pullRequestID: json['pullRequestID'] as String,
    );

Map<String, dynamic> _$RepoMetaDataToJson(RepoMetaData instance) =>
    <String, dynamic>{
      'repoSlug': instance.repoSlug,
      'pullRequestID': instance.pullRequestID,
    };

BitBucketCloudPRDSL _$BitBucketCloudPRDSLFromJson(Map<String, dynamic> json) =>
    BitBucketCloudPRDSL(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      state: $enumDecode(_$BitBucketCloudPRStateEnumMap, json['state']),
      createdOn: json['created_on'] as String,
      updatedOn: json['updated_on'] as String,
      source: BitBucketCloudMergeRef.fromJson(
          json['source'] as Map<String, dynamic>),
      destination: BitBucketCloudMergeRef.fromJson(
          json['destination'] as Map<String, dynamic>),
      author:
          BitBucketCloudUser.fromJson(json['author'] as Map<String, dynamic>),
      reviewers: (json['reviewers'] as List<dynamic>)
          .map((e) => BitBucketCloudUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      participants: (json['participants'] as List<dynamic>)
          .map((e) =>
              BitBucketCloudPRParticipant.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, BitBucketCloudLink.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$BitBucketCloudPRDSLToJson(
        BitBucketCloudPRDSL instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'state': _$BitBucketCloudPRStateEnumMap[instance.state],
      'created_on': instance.createdOn,
      'updated_on': instance.updatedOn,
      'source': instance.source.toJson(),
      'destination': instance.destination.toJson(),
      'author': instance.author.toJson(),
      'reviewers': instance.reviewers.map((e) => e.toJson()).toList(),
      'participants': instance.participants.map((e) => e.toJson()).toList(),
      'links': instance.links.map((k, e) => MapEntry(k, e.toJson())),
    };

const _$BitBucketCloudPRStateEnumMap = {
  BitBucketCloudPRState.open: 'OPEN',
  BitBucketCloudPRState.merged: 'MERGED',
  BitBucketCloudPRState.declined: 'DECLINED',
  BitBucketCloudPRState.superseded: 'SUPERSEDED',
};

BitBucketCloudCommit _$BitBucketCloudCommitFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudCommit(
      hash: json['hash'] as String,
      author: BitBucketCloudCommitAuthor.fromJson(
          json['author'] as Map<String, dynamic>),
      date: json['date'] as String,
      message: json['message'] as String,
      parents: (json['parents'] as List<dynamic>)
          .map((e) =>
              BitBucketCloudPRCommitParent.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, BitBucketCloudLink.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$BitBucketCloudCommitToJson(
        BitBucketCloudCommit instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'author': instance.author.toJson(),
      'date': instance.date,
      'message': instance.message,
      'parents': instance.parents.map((e) => e.toJson()).toList(),
      'links': instance.links.map((k, e) => MapEntry(k, e.toJson())),
    };

BitBucketCloudPRComment _$BitBucketCloudPRCommentFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudPRComment(
      deleted: json['deleted'] as bool,
      links: (json['links'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, BitBucketCloudLink.fromJson(e as Map<String, dynamic>)),
      ),
      content: BitBucketCloudContent.fromJson(
          json['content'] as Map<String, dynamic>),
      createdOn: json['created_on'] as String,
      user: BitBucketCloudUser.fromJson(json['user'] as Map<String, dynamic>),
      updatedOn: json['updated_on'] as String,
      type: json['type'] as String,
      id: json['id'] as int,
      inline: json['inline'] == null
          ? null
          : BitBucketCloudPRCommentInline.fromJson(
              json['inline'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BitBucketCloudPRCommentToJson(
        BitBucketCloudPRComment instance) =>
    <String, dynamic>{
      'deleted': instance.deleted,
      'links': instance.links.map((k, e) => MapEntry(k, e.toJson())),
      'content': instance.content.toJson(),
      'created_on': instance.createdOn,
      'user': instance.user.toJson(),
      'updated_on': instance.updatedOn,
      'type': instance.type,
      'id': instance.id,
      'inline': instance.inline?.toJson(),
    };

BitBucketCloudPRActivity _$BitBucketCloudPRActivityFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudPRActivity(
      comment: json['comment'] == null
          ? null
          : BitBucketCloudPRComment.fromJson(
              json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BitBucketCloudPRActivityToJson(
        BitBucketCloudPRActivity instance) =>
    <String, dynamic>{
      'comment': instance.comment?.toJson(),
    };

BitBucketCloudCommitAuthor _$BitBucketCloudCommitAuthorFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudCommitAuthor(
      raw: json['raw'] as String,
      user: json['user'] == null
          ? null
          : BitBucketCloudUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BitBucketCloudCommitAuthorToJson(
        BitBucketCloudCommitAuthor instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'user': instance.user?.toJson(),
    };

BitBucketCloudPRParticipant _$BitBucketCloudPRParticipantFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudPRParticipant(
      user: BitBucketCloudUser.fromJson(json['user'] as Map<String, dynamic>),
      approved: json['approved'] as bool,
    );

Map<String, dynamic> _$BitBucketCloudPRParticipantToJson(
        BitBucketCloudPRParticipant instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'approved': instance.approved,
    };

BitBucketCloudUser _$BitBucketCloudUserFromJson(Map<String, dynamic> json) =>
    BitBucketCloudUser(
      uuid: json['uuid'] as String,
      displayName: json['display_name'] as String,
      nickname: json['nickname'] as String?,
      accountId: json['account_id'] as String?,
    );

Map<String, dynamic> _$BitBucketCloudUserToJson(BitBucketCloudUser instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'display_name': instance.displayName,
      'nickname': instance.nickname,
      'account_id': instance.accountId,
    };

BitBucketCloudMergeRef _$BitBucketCloudMergeRefFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudMergeRef(
      commit: BitBucketCloudMergeRefCommit.fromJson(
          json['commit'] as Map<String, dynamic>),
      branch: BitBucketCloudMergeRefBranch.fromJson(
          json['branch'] as Map<String, dynamic>),
      repository: BitBucketCloudRepo.fromJson(
          json['repository'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BitBucketCloudMergeRefToJson(
        BitBucketCloudMergeRef instance) =>
    <String, dynamic>{
      'commit': instance.commit.toJson(),
      'branch': instance.branch.toJson(),
      'repository': instance.repository.toJson(),
    };

BitBucketCloudMergeRefBranch _$BitBucketCloudMergeRefBranchFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudMergeRefBranch(
      name: json['name'] as String,
    );

Map<String, dynamic> _$BitBucketCloudMergeRefBranchToJson(
        BitBucketCloudMergeRefBranch instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

BitBucketCloudMergeRefCommit _$BitBucketCloudMergeRefCommitFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudMergeRefCommit(
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$BitBucketCloudMergeRefCommitToJson(
        BitBucketCloudMergeRefCommit instance) =>
    <String, dynamic>{
      'hash': instance.hash,
    };

BitBucketCloudRepo _$BitBucketCloudRepoFromJson(Map<String, dynamic> json) =>
    BitBucketCloudRepo(
      json['name'] as String,
      json['full_name'] as String,
      json['uuid'] as String,
    );

Map<String, dynamic> _$BitBucketCloudRepoToJson(BitBucketCloudRepo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'full_name': instance.fullName,
      'uuid': instance.uuid,
    };

BitBucketCloudLink _$BitBucketCloudLinkFromJson(Map<String, dynamic> json) =>
    BitBucketCloudLink(
      href: json['href'] as String,
    );

Map<String, dynamic> _$BitBucketCloudLinkToJson(BitBucketCloudLink instance) =>
    <String, dynamic>{
      'href': instance.href,
    };

BitBucketCloudContent _$BitBucketCloudContentFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudContent(
      raw: json['raw'] as String,
      markup: json['markup'] as String,
      html: json['html'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$BitBucketCloudContentToJson(
        BitBucketCloudContent instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'markup': instance.markup,
      'html': instance.html,
      'type': instance.type,
    };

BitBucketCloudPRCommentInline _$BitBucketCloudPRCommentInlineFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudPRCommentInline(
      to: json['to'] as int?,
      from: json['from'] as int?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$BitBucketCloudPRCommentInlineToJson(
        BitBucketCloudPRCommentInline instance) =>
    <String, dynamic>{
      'to': instance.to,
      'from': instance.from,
      'path': instance.path,
    };

BitBucketCloudPRCommitParent _$BitBucketCloudPRCommitParentFromJson(
        Map<String, dynamic> json) =>
    BitBucketCloudPRCommitParent(
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$BitBucketCloudPRCommitParentToJson(
        BitBucketCloudPRCommitParent instance) =>
    <String, dynamic>{
      'hash': instance.hash,
    };
