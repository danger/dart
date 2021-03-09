// To parse this JSON data, do
//
//     final DangerRootSchema = DangerRootSchemaFromJson(jsonString);

import 'dart:convert';

/**
 * The shape of the JSON passed between Danger and a subprocess. It's built
 * to be expanded in the future.
 */
class DangerRootSchema {
    DangerRootSchema({
        this.danger,
    });

    final DangerDsljsonType danger;

    factory DangerRootSchema.fromRawJson(String str) => DangerRootSchema.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DangerRootSchema.fromJson(Map<String, dynamic> json) => DangerRootSchema(
        danger: json["danger"] == null ? null : DangerDsljsonType.fromJson(json["danger"]),
    );

    Map<String, dynamic> toJson() => {
        "danger": danger == null ? null : danger.toJson(),
    };
}

/**
 * The root of the Danger JSON DSL.
 */
class DangerDsljsonType {
    DangerDsljsonType({
        this.bitbucketCloud,
        this.bitbucketServer,
        this.git,
        this.github,
        this.gitlab,
        this.settings,
    });

    final BitBucketCloudJsondsl bitbucketCloud;
    final BitBucketServerJsondsl bitbucketServer;
    final GitJsondsl git;
    final GitHubDsl github;
    final GitLabDsl gitlab;
    final Settings settings;

    factory DangerDsljsonType.fromRawJson(String str) => DangerDsljsonType.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DangerDsljsonType.fromJson(Map<String, dynamic> json) => DangerDsljsonType(
        bitbucketCloud: json["bitbucket_cloud"] == null ? null : BitBucketCloudJsondsl.fromJson(json["bitbucket_cloud"]),
        bitbucketServer: json["bitbucket_server"] == null ? null : BitBucketServerJsondsl.fromJson(json["bitbucket_server"]),
        git: json["git"] == null ? null : GitJsondsl.fromJson(json["git"]),
        github: json["github"] == null ? null : GitHubDsl.fromJson(json["github"]),
        gitlab: json["gitlab"] == null ? null : GitLabDsl.fromJson(json["gitlab"]),
        settings: json["settings"] == null ? null : Settings.fromJson(json["settings"]),
    );

    Map<String, dynamic> toJson() => {
        "bitbucket_cloud": bitbucketCloud == null ? null : bitbucketCloud.toJson(),
        "bitbucket_server": bitbucketServer == null ? null : bitbucketServer.toJson(),
        "git": git == null ? null : git.toJson(),
        "github": github == null ? null : github.toJson(),
        "gitlab": gitlab == null ? null : gitlab.toJson(),
        "settings": settings == null ? null : settings.toJson(),
    };
}

/**
 * The data only version of BitBucket Cloud DSL
 */
class BitBucketCloudJsondsl {
    BitBucketCloudJsondsl({
        this.activities,
        this.comments,
        this.commits,
        this.metadata,
        this.pr,
    });

    final List<BitBucketCloudPrActivity> activities;
    final List<BitBucketCloudPrComment> comments;
    final List<BitBucketCloudCommit> commits;
    final RepoMetaData metadata;
    final BitBucketCloudPrdsl pr;

    factory BitBucketCloudJsondsl.fromRawJson(String str) => BitBucketCloudJsondsl.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudJsondsl.fromJson(Map<String, dynamic> json) => BitBucketCloudJsondsl(
        activities: json["activities"] == null ? null : List<BitBucketCloudPrActivity>.from(json["activities"].map((x) => BitBucketCloudPrActivity.fromJson(x))),
        comments: json["comments"] == null ? null : List<BitBucketCloudPrComment>.from(json["comments"].map((x) => BitBucketCloudPrComment.fromJson(x))),
        commits: json["commits"] == null ? null : List<BitBucketCloudCommit>.from(json["commits"].map((x) => BitBucketCloudCommit.fromJson(x))),
        metadata: json["metadata"] == null ? null : RepoMetaData.fromJson(json["metadata"]),
        pr: json["pr"] == null ? null : BitBucketCloudPrdsl.fromJson(json["pr"]),
    );

    Map<String, dynamic> toJson() => {
        "activities": activities == null ? null : List<dynamic>.from(activities.map((x) => x.toJson())),
        "comments": comments == null ? null : List<dynamic>.from(comments.map((x) => x.toJson())),
        "commits": commits == null ? null : List<dynamic>.from(commits.map((x) => x.toJson())),
        "metadata": metadata == null ? null : metadata.toJson(),
        "pr": pr == null ? null : pr.toJson(),
    };
}

class BitBucketCloudPrActivity {
    BitBucketCloudPrActivity({
        this.comment,
        this.pullRequest,
    });

    final BitBucketCloudPrComment comment;
    final PullRequest pullRequest;

    factory BitBucketCloudPrActivity.fromRawJson(String str) => BitBucketCloudPrActivity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudPrActivity.fromJson(Map<String, dynamic> json) => BitBucketCloudPrActivity(
        comment: json["comment"] == null ? null : BitBucketCloudPrComment.fromJson(json["comment"]),
        pullRequest: json["pull_request"] == null ? null : PullRequest.fromJson(json["pull_request"]),
    );

    Map<String, dynamic> toJson() => {
        "comment": comment == null ? null : comment.toJson(),
        "pull_request": pullRequest == null ? null : pullRequest.toJson(),
    };
}

class BitBucketCloudPrComment {
    BitBucketCloudPrComment({
        this.content,
        this.createdOn,
        this.deleted,
        this.id,
        this.inline,
        this.links,
        this.pullrequest,
        this.type,
        this.updatedOn,
        this.user,
    });

    final BitBucketCloudContent content;
    final String createdOn;
    final bool deleted;
    final double id;
    final Inline inline;
    final BitBucketCloudLinksHtmlSelf links;
    final Pullrequest pullrequest;
    final String type;
    final String updatedOn;
    final BitBucketCloudUser user;

    factory BitBucketCloudPrComment.fromRawJson(String str) => BitBucketCloudPrComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudPrComment.fromJson(Map<String, dynamic> json) => BitBucketCloudPrComment(
        content: json["content"] == null ? null : BitBucketCloudContent.fromJson(json["content"]),
        createdOn: json["created_on"] == null ? null : json["created_on"],
        deleted: json["deleted"] == null ? null : json["deleted"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        inline: json["inline"] == null ? null : Inline.fromJson(json["inline"]),
        links: json["links"] == null ? null : BitBucketCloudLinksHtmlSelf.fromJson(json["links"]),
        pullrequest: json["pullrequest"] == null ? null : Pullrequest.fromJson(json["pullrequest"]),
        type: json["type"] == null ? null : json["type"],
        updatedOn: json["updated_on"] == null ? null : json["updated_on"],
        user: json["user"] == null ? null : BitBucketCloudUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "content": content == null ? null : content.toJson(),
        "created_on": createdOn == null ? null : createdOn,
        "deleted": deleted == null ? null : deleted,
        "id": id == null ? null : id,
        "inline": inline == null ? null : inline.toJson(),
        "links": links == null ? null : links.toJson(),
        "pullrequest": pullrequest == null ? null : pullrequest.toJson(),
        "type": type == null ? null : type,
        "updated_on": updatedOn == null ? null : updatedOn,
        "user": user == null ? null : user.toJson(),
    };
}

class BitBucketCloudContent {
    BitBucketCloudContent({
        this.html,
        this.markup,
        this.raw,
        this.type,
    });

    final String html;
    final String markup;
    final String raw;
    final ContentType type;

    factory BitBucketCloudContent.fromRawJson(String str) => BitBucketCloudContent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudContent.fromJson(Map<String, dynamic> json) => BitBucketCloudContent(
        html: json["html"] == null ? null : json["html"],
        markup: json["markup"] == null ? null : json["markup"],
        raw: json["raw"] == null ? null : json["raw"],
        type: json["type"] == null ? null : contentTypeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "html": html == null ? null : html,
        "markup": markup == null ? null : markup,
        "raw": raw == null ? null : raw,
        "type": type == null ? null : contentTypeValues.reverse[type],
    };
}

enum ContentType { RENDERED }

final contentTypeValues = EnumValues({
    "rendered": ContentType.RENDERED
});

class Inline {
    Inline({
        this.from,
        this.path,
        this.to,
    });

    final double from;
    final String path;
    final double to;

    factory Inline.fromRawJson(String str) => Inline.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Inline.fromJson(Map<String, dynamic> json) => Inline(
        from: json["from"] == null ? null : json["from"].toDouble(),
        path: json["path"] == null ? null : json["path"],
        to: json["to"] == null ? null : json["to"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "from": from == null ? null : from,
        "path": path == null ? null : path,
        "to": to == null ? null : to,
    };
}

class BitBucketCloudLinksHtmlSelf {
    BitBucketCloudLinksHtmlSelf({
        this.html,
        this.self,
    });

    final PurpleHtml html;
    final PurpleSelf self;

    factory BitBucketCloudLinksHtmlSelf.fromRawJson(String str) => BitBucketCloudLinksHtmlSelf.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudLinksHtmlSelf.fromJson(Map<String, dynamic> json) => BitBucketCloudLinksHtmlSelf(
        html: json["html"] == null ? null : PurpleHtml.fromJson(json["html"]),
        self: json["self"] == null ? null : PurpleSelf.fromJson(json["self"]),
    );

    Map<String, dynamic> toJson() => {
        "html": html == null ? null : html.toJson(),
        "self": self == null ? null : self.toJson(),
    };
}

class PurpleHtml {
    PurpleHtml({
        this.href,
    });

    final String href;

    factory PurpleHtml.fromRawJson(String str) => PurpleHtml.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PurpleHtml.fromJson(Map<String, dynamic> json) => PurpleHtml(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class PurpleSelf {
    PurpleSelf({
        this.href,
    });

    final String href;

    factory PurpleSelf.fromRawJson(String str) => PurpleSelf.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PurpleSelf.fromJson(Map<String, dynamic> json) => PurpleSelf(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class Pullrequest {
    Pullrequest({
        this.id,
        this.links,
        this.title,
    });

    final double id;
    final BitBucketCloudLinksHtmlSelf links;
    final String title;

    factory Pullrequest.fromRawJson(String str) => Pullrequest.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Pullrequest.fromJson(Map<String, dynamic> json) => Pullrequest(
        id: json["id"] == null ? null : json["id"].toDouble(),
        links: json["links"] == null ? null : BitBucketCloudLinksHtmlSelf.fromJson(json["links"]),
        title: json["title"] == null ? null : json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "links": links == null ? null : links.toJson(),
        "title": title == null ? null : title,
    };
}

/**
 * The creator of the PR
 */
class BitBucketCloudUser {
    BitBucketCloudUser({
        this.accountId,
        this.displayName,
        this.nickname,
        this.uuid,
    });

    final String accountId;
    final String displayName;
    final String nickname;
    final String uuid;

    factory BitBucketCloudUser.fromRawJson(String str) => BitBucketCloudUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudUser.fromJson(Map<String, dynamic> json) => BitBucketCloudUser(
        accountId: json["account_id"] == null ? null : json["account_id"],
        displayName: json["display_name"] == null ? null : json["display_name"],
        nickname: json["nickname"] == null ? null : json["nickname"],
        uuid: json["uuid"] == null ? null : json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "account_id": accountId == null ? null : accountId,
        "display_name": displayName == null ? null : displayName,
        "nickname": nickname == null ? null : nickname,
        "uuid": uuid == null ? null : uuid,
    };
}

class PullRequest {
    PullRequest({
        this.id,
        this.title,
    });

    final double id;
    final String title;

    factory PullRequest.fromRawJson(String str) => PullRequest.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullRequest.fromJson(Map<String, dynamic> json) => PullRequest(
        id: json["id"] == null ? null : json["id"].toDouble(),
        title: json["title"] == null ? null : json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
    };
}

/**
 * A BitBucketCloud specific implementation of a git commit.
 */
class BitBucketCloudCommit {
    BitBucketCloudCommit({
        this.author,
        this.date,
        this.hash,
        this.links,
        this.message,
        this.parents,
    });

    final PurpleAuthor author;
    final String date;
    final String hash;
    final BitBucketCloudLinksHtml links;
    final String message;
    final List<PurpleParent> parents;

    factory BitBucketCloudCommit.fromRawJson(String str) => BitBucketCloudCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudCommit.fromJson(Map<String, dynamic> json) => BitBucketCloudCommit(
        author: json["author"] == null ? null : PurpleAuthor.fromJson(json["author"]),
        date: json["date"] == null ? null : json["date"],
        hash: json["hash"] == null ? null : json["hash"],
        links: json["links"] == null ? null : BitBucketCloudLinksHtml.fromJson(json["links"]),
        message: json["message"] == null ? null : json["message"],
        parents: json["parents"] == null ? null : List<PurpleParent>.from(json["parents"].map((x) => PurpleParent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "author": author == null ? null : author.toJson(),
        "date": date == null ? null : date,
        "hash": hash == null ? null : hash,
        "links": links == null ? null : links.toJson(),
        "message": message == null ? null : message,
        "parents": parents == null ? null : List<dynamic>.from(parents.map((x) => x.toJson())),
    };
}

/**
 * The author of the commit, assumed to be the person who wrote the code.
 */
class PurpleAuthor {
    PurpleAuthor({
        this.raw,
        this.user,
    });

    final String raw;
    final BitBucketCloudUser user;

    factory PurpleAuthor.fromRawJson(String str) => PurpleAuthor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PurpleAuthor.fromJson(Map<String, dynamic> json) => PurpleAuthor(
        raw: json["raw"] == null ? null : json["raw"],
        user: json["user"] == null ? null : BitBucketCloudUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "raw": raw == null ? null : raw,
        "user": user == null ? null : user.toJson(),
    };
}

/**
 * The commit's links
 */
class BitBucketCloudLinksHtml {
    BitBucketCloudLinksHtml({
        this.html,
    });

    final FluffyHtml html;

    factory BitBucketCloudLinksHtml.fromRawJson(String str) => BitBucketCloudLinksHtml.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudLinksHtml.fromJson(Map<String, dynamic> json) => BitBucketCloudLinksHtml(
        html: json["html"] == null ? null : FluffyHtml.fromJson(json["html"]),
    );

    Map<String, dynamic> toJson() => {
        "html": html == null ? null : html.toJson(),
    };
}

class FluffyHtml {
    FluffyHtml({
        this.href,
    });

    final String href;

    factory FluffyHtml.fromRawJson(String str) => FluffyHtml.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FluffyHtml.fromJson(Map<String, dynamic> json) => FluffyHtml(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class PurpleParent {
    PurpleParent({
        this.hash,
    });

    final String hash;

    factory PurpleParent.fromRawJson(String str) => PurpleParent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PurpleParent.fromJson(Map<String, dynamic> json) => PurpleParent(
        hash: json["hash"] == null ? null : json["hash"],
    );

    Map<String, dynamic> toJson() => {
        "hash": hash == null ? null : hash,
    };
}

/**
 * The pull request and repository metadata
 *
 * Key details about a repo
 *
 * Info about the repo
 */
class RepoMetaData {
    RepoMetaData({
        this.pullRequestId,
        this.repoSlug,
    });

    final String pullRequestId;
    final String repoSlug;

    factory RepoMetaData.fromRawJson(String str) => RepoMetaData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RepoMetaData.fromJson(Map<String, dynamic> json) => RepoMetaData(
        pullRequestId: json["pullRequestID"] == null ? null : json["pullRequestID"],
        repoSlug: json["repoSlug"] == null ? null : json["repoSlug"],
    );

    Map<String, dynamic> toJson() => {
        "pullRequestID": pullRequestId == null ? null : pullRequestId,
        "repoSlug": repoSlug == null ? null : repoSlug,
    };
}

/**
 * The PR metadata
 */
class BitBucketCloudPrdsl {
    BitBucketCloudPrdsl({
        this.author,
        this.createdOn,
        this.description,
        this.destination,
        this.id,
        this.links,
        this.participants,
        this.reviewers,
        this.source,
        this.state,
        this.title,
        this.updatedOn,
    });

    final BitBucketCloudUser author;
    final String createdOn;
    final String description;
    final BitBucketCloudMergeRef destination;
    final double id;
    final BitBucketCloudLinksHtmlSelfDeclineCommitsCommentsMergeActivityDiffApproveStatuses links;
    final List<BitBucketCloudPrParticipant> participants;
    final List<BitBucketCloudUser> reviewers;
    final BitBucketCloudMergeRef source;
    final PurpleState state;
    final String title;
    final String updatedOn;

    factory BitBucketCloudPrdsl.fromRawJson(String str) => BitBucketCloudPrdsl.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudPrdsl.fromJson(Map<String, dynamic> json) => BitBucketCloudPrdsl(
        author: json["author"] == null ? null : BitBucketCloudUser.fromJson(json["author"]),
        createdOn: json["created_on"] == null ? null : json["created_on"],
        description: json["description"] == null ? null : json["description"],
        destination: json["destination"] == null ? null : BitBucketCloudMergeRef.fromJson(json["destination"]),
        id: json["id"] == null ? null : json["id"].toDouble(),
        links: json["links"] == null ? null : BitBucketCloudLinksHtmlSelfDeclineCommitsCommentsMergeActivityDiffApproveStatuses.fromJson(json["links"]),
        participants: json["participants"] == null ? null : List<BitBucketCloudPrParticipant>.from(json["participants"].map((x) => BitBucketCloudPrParticipant.fromJson(x))),
        reviewers: json["reviewers"] == null ? null : List<BitBucketCloudUser>.from(json["reviewers"].map((x) => BitBucketCloudUser.fromJson(x))),
        source: json["source"] == null ? null : BitBucketCloudMergeRef.fromJson(json["source"]),
        state: json["state"] == null ? null : purpleStateValues.map[json["state"]],
        title: json["title"] == null ? null : json["title"],
        updatedOn: json["updated_on"] == null ? null : json["updated_on"],
    );

    Map<String, dynamic> toJson() => {
        "author": author == null ? null : author.toJson(),
        "created_on": createdOn == null ? null : createdOn,
        "description": description == null ? null : description,
        "destination": destination == null ? null : destination.toJson(),
        "id": id == null ? null : id,
        "links": links == null ? null : links.toJson(),
        "participants": participants == null ? null : List<dynamic>.from(participants.map((x) => x.toJson())),
        "reviewers": reviewers == null ? null : List<dynamic>.from(reviewers.map((x) => x.toJson())),
        "source": source == null ? null : source.toJson(),
        "state": state == null ? null : purpleStateValues.reverse[state],
        "title": title == null ? null : title,
        "updated_on": updatedOn == null ? null : updatedOn,
    };
}

/**
 * The PR's destination
 *
 * The PR's source, The repo Danger is running on
 */
class BitBucketCloudMergeRef {
    BitBucketCloudMergeRef({
        this.branch,
        this.commit,
        this.repository,
    });

    final Branch branch;
    final Commit commit;
    final BitBucketCloudRepo repository;

    factory BitBucketCloudMergeRef.fromRawJson(String str) => BitBucketCloudMergeRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudMergeRef.fromJson(Map<String, dynamic> json) => BitBucketCloudMergeRef(
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        commit: json["commit"] == null ? null : Commit.fromJson(json["commit"]),
        repository: json["repository"] == null ? null : BitBucketCloudRepo.fromJson(json["repository"]),
    );

    Map<String, dynamic> toJson() => {
        "branch": branch == null ? null : branch.toJson(),
        "commit": commit == null ? null : commit.toJson(),
        "repository": repository == null ? null : repository.toJson(),
    };
}

class Branch {
    Branch({
        this.name,
    });

    final String name;

    factory Branch.fromRawJson(String str) => Branch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
    };
}

class Commit {
    Commit({
        this.hash,
    });

    final String hash;

    factory Commit.fromRawJson(String str) => Commit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        hash: json["hash"] == null ? null : json["hash"],
    );

    Map<String, dynamic> toJson() => {
        "hash": hash == null ? null : hash,
    };
}

class BitBucketCloudRepo {
    BitBucketCloudRepo({
        this.fullName,
        this.name,
        this.uuid,
    });

    final String fullName;
    final String name;
    final String uuid;

    factory BitBucketCloudRepo.fromRawJson(String str) => BitBucketCloudRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudRepo.fromJson(Map<String, dynamic> json) => BitBucketCloudRepo(
        fullName: json["full_name"] == null ? null : json["full_name"],
        name: json["name"] == null ? null : json["name"],
        uuid: json["uuid"] == null ? null : json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName == null ? null : fullName,
        "name": name == null ? null : name,
        "uuid": uuid == null ? null : uuid,
    };
}

/**
 * Misc links for hypermedia conformance
 */
class BitBucketCloudLinksHtmlSelfDeclineCommitsCommentsMergeActivityDiffApproveStatuses {
    BitBucketCloudLinksHtmlSelfDeclineCommitsCommentsMergeActivityDiffApproveStatuses({
        this.activity,
        this.approve,
        this.comments,
        this.commits,
        this.decline,
        this.diff,
        this.html,
        this.merge,
        this.self,
        this.statuses,
    });

    final LinksActivity activity;
    final Approve approve;
    final Comments comments;
    final LinksCommits commits;
    final Decline decline;
    final Diff diff;
    final TentacledHtml html;
    final LinksMerge merge;
    final FluffySelf self;
    final Statuses statuses;

    factory BitBucketCloudLinksHtmlSelfDeclineCommitsCommentsMergeActivityDiffApproveStatuses.fromRawJson(String str) => BitBucketCloudLinksHtmlSelfDeclineCommitsCommentsMergeActivityDiffApproveStatuses.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudLinksHtmlSelfDeclineCommitsCommentsMergeActivityDiffApproveStatuses.fromJson(Map<String, dynamic> json) => BitBucketCloudLinksHtmlSelfDeclineCommitsCommentsMergeActivityDiffApproveStatuses(
        activity: json["activity"] == null ? null : LinksActivity.fromJson(json["activity"]),
        approve: json["approve"] == null ? null : Approve.fromJson(json["approve"]),
        comments: json["comments"] == null ? null : Comments.fromJson(json["comments"]),
        commits: json["commits"] == null ? null : LinksCommits.fromJson(json["commits"]),
        decline: json["decline"] == null ? null : Decline.fromJson(json["decline"]),
        diff: json["diff"] == null ? null : Diff.fromJson(json["diff"]),
        html: json["html"] == null ? null : TentacledHtml.fromJson(json["html"]),
        merge: json["merge"] == null ? null : LinksMerge.fromJson(json["merge"]),
        self: json["self"] == null ? null : FluffySelf.fromJson(json["self"]),
        statuses: json["statuses"] == null ? null : Statuses.fromJson(json["statuses"]),
    );

    Map<String, dynamic> toJson() => {
        "activity": activity == null ? null : activity.toJson(),
        "approve": approve == null ? null : approve.toJson(),
        "comments": comments == null ? null : comments.toJson(),
        "commits": commits == null ? null : commits.toJson(),
        "decline": decline == null ? null : decline.toJson(),
        "diff": diff == null ? null : diff.toJson(),
        "html": html == null ? null : html.toJson(),
        "merge": merge == null ? null : merge.toJson(),
        "self": self == null ? null : self.toJson(),
        "statuses": statuses == null ? null : statuses.toJson(),
    };
}

class LinksActivity {
    LinksActivity({
        this.href,
    });

    final String href;

    factory LinksActivity.fromRawJson(String str) => LinksActivity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LinksActivity.fromJson(Map<String, dynamic> json) => LinksActivity(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class Approve {
    Approve({
        this.href,
    });

    final String href;

    factory Approve.fromRawJson(String str) => Approve.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Approve.fromJson(Map<String, dynamic> json) => Approve(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class Comments {
    Comments({
        this.href,
    });

    final String href;

    factory Comments.fromRawJson(String str) => Comments.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class LinksCommits {
    LinksCommits({
        this.href,
    });

    final String href;

    factory LinksCommits.fromRawJson(String str) => LinksCommits.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LinksCommits.fromJson(Map<String, dynamic> json) => LinksCommits(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class Decline {
    Decline({
        this.href,
    });

    final String href;

    factory Decline.fromRawJson(String str) => Decline.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Decline.fromJson(Map<String, dynamic> json) => Decline(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class Diff {
    Diff({
        this.href,
    });

    final String href;

    factory Diff.fromRawJson(String str) => Diff.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Diff.fromJson(Map<String, dynamic> json) => Diff(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class TentacledHtml {
    TentacledHtml({
        this.href,
    });

    final String href;

    factory TentacledHtml.fromRawJson(String str) => TentacledHtml.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TentacledHtml.fromJson(Map<String, dynamic> json) => TentacledHtml(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class LinksMerge {
    LinksMerge({
        this.href,
    });

    final String href;

    factory LinksMerge.fromRawJson(String str) => LinksMerge.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LinksMerge.fromJson(Map<String, dynamic> json) => LinksMerge(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class FluffySelf {
    FluffySelf({
        this.href,
    });

    final String href;

    factory FluffySelf.fromRawJson(String str) => FluffySelf.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FluffySelf.fromJson(Map<String, dynamic> json) => FluffySelf(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class Statuses {
    Statuses({
        this.href,
    });

    final String href;

    factory Statuses.fromRawJson(String str) => Statuses.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Statuses.fromJson(Map<String, dynamic> json) => Statuses(
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
    };
}

class BitBucketCloudPrParticipant {
    BitBucketCloudPrParticipant({
        this.approved,
        this.role,
        this.user,
    });

    final bool approved;
    final PurpleRole role;
    final BitBucketCloudUser user;

    factory BitBucketCloudPrParticipant.fromRawJson(String str) => BitBucketCloudPrParticipant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketCloudPrParticipant.fromJson(Map<String, dynamic> json) => BitBucketCloudPrParticipant(
        approved: json["approved"] == null ? null : json["approved"],
        role: json["role"] == null ? null : purpleRoleValues.map[json["role"]],
        user: json["user"] == null ? null : BitBucketCloudUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "approved": approved == null ? null : approved,
        "role": role == null ? null : purpleRoleValues.reverse[role],
        "user": user == null ? null : user.toJson(),
    };
}

/**
 * How did they contribute
 */
enum PurpleRole { PARTICIPANT, REVIEWER }

final purpleRoleValues = EnumValues({
    "PARTICIPANT": PurpleRole.PARTICIPANT,
    "REVIEWER": PurpleRole.REVIEWER
});

/**
 * The pull request's current status.
 */
enum PurpleState { DECLINED, MERGED, OPEN, SUPERSEDED }

final purpleStateValues = EnumValues({
    "DECLINED": PurpleState.DECLINED,
    "MERGED": PurpleState.MERGED,
    "OPEN": PurpleState.OPEN,
    "SUPERSEDED": PurpleState.SUPERSEDED
});

/**
 * The data only version of BitBucket Server DSL
 */
class BitBucketServerJsondsl {
    BitBucketServerJsondsl({
        this.activities,
        this.comments,
        this.commits,
        this.issues,
        this.metadata,
        this.pr,
    });

    final List<BitBucketServerPrActivity> activities;
    final List<BitBucketServerPrActivity> comments;
    final List<BitBucketServerCommit> commits;
    final List<JiraIssue> issues;
    final RepoMetaData metadata;
    final BitBucketServerPrdsl pr;

    factory BitBucketServerJsondsl.fromRawJson(String str) => BitBucketServerJsondsl.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketServerJsondsl.fromJson(Map<String, dynamic> json) => BitBucketServerJsondsl(
        activities: json["activities"] == null ? null : List<BitBucketServerPrActivity>.from(json["activities"].map((x) => BitBucketServerPrActivity.fromJson(x))),
        comments: json["comments"] == null ? null : List<BitBucketServerPrActivity>.from(json["comments"].map((x) => BitBucketServerPrActivity.fromJson(x))),
        commits: json["commits"] == null ? null : List<BitBucketServerCommit>.from(json["commits"].map((x) => BitBucketServerCommit.fromJson(x))),
        issues: json["issues"] == null ? null : List<JiraIssue>.from(json["issues"].map((x) => JiraIssue.fromJson(x))),
        metadata: json["metadata"] == null ? null : RepoMetaData.fromJson(json["metadata"]),
        pr: json["pr"] == null ? null : BitBucketServerPrdsl.fromJson(json["pr"]),
    );

    Map<String, dynamic> toJson() => {
        "activities": activities == null ? null : List<dynamic>.from(activities.map((x) => x.toJson())),
        "comments": comments == null ? null : List<dynamic>.from(comments.map((x) => x.toJson())),
        "commits": commits == null ? null : List<dynamic>.from(commits.map((x) => x.toJson())),
        "issues": issues == null ? null : List<dynamic>.from(issues.map((x) => x.toJson())),
        "metadata": metadata == null ? null : metadata.toJson(),
        "pr": pr == null ? null : pr.toJson(),
    };
}

class BitBucketServerPrComment {
    BitBucketServerPrComment({
        this.author,
        this.comments,
        this.createdDate,
        this.id,
        this.parent,
        this.permittedOperations,
        this.text,
        this.updatedDate,
        this.version,
    });

    final BitBucketServerUser author;
    final List<BitBucketServerPrActivity> comments;
    final double createdDate;
    final double id;
    final CommentParent parent;
    final PermittedOperations permittedOperations;
    final String text;
    final double updatedDate;
    final double version;

    factory BitBucketServerPrComment.fromRawJson(String str) => BitBucketServerPrComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketServerPrComment.fromJson(Map<String, dynamic> json) => BitBucketServerPrComment(
        author: json["author"] == null ? null : BitBucketServerUser.fromJson(json["author"]),
        comments: json["comments"] == null ? null : List<BitBucketServerPrActivity>.from(json["comments"].map((x) => BitBucketServerPrActivity.fromJson(x))),
        createdDate: json["createdDate"] == null ? null : json["createdDate"].toDouble(),
        id: json["id"] == null ? null : json["id"].toDouble(),
        parent: json["parent"] == null ? null : CommentParent.fromJson(json["parent"]),
        permittedOperations: json["permittedOperations"] == null ? null : PermittedOperations.fromJson(json["permittedOperations"]),
        text: json["text"] == null ? null : json["text"],
        updatedDate: json["updatedDate"] == null ? null : json["updatedDate"].toDouble(),
        version: json["version"] == null ? null : json["version"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "author": author == null ? null : author.toJson(),
        "comments": comments == null ? null : List<dynamic>.from(comments.map((x) => x.toJson())),
        "createdDate": createdDate == null ? null : createdDate,
        "id": id == null ? null : id,
        "parent": parent == null ? null : parent.toJson(),
        "permittedOperations": permittedOperations == null ? null : permittedOperations.toJson(),
        "text": text == null ? null : text,
        "updatedDate": updatedDate == null ? null : updatedDate,
        "version": version == null ? null : version,
    };
}

class BitBucketServerPrActivity {
    BitBucketServerPrActivity({
        this.action,
        this.comment,
        this.commentAction,
        this.commentAnchor,
        this.createdDate,
        this.id,
        this.user,
    });

    final Action action;
    final BitBucketServerPrComment comment;
    final CommentAction commentAction;
    final CommentAnchor commentAnchor;
    final double createdDate;
    final double id;
    final BitBucketServerUser user;

    factory BitBucketServerPrActivity.fromRawJson(String str) => BitBucketServerPrActivity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketServerPrActivity.fromJson(Map<String, dynamic> json) => BitBucketServerPrActivity(
        action: json["action"] == null ? null : actionValues.map[json["action"]],
        comment: json["comment"] == null ? null : BitBucketServerPrComment.fromJson(json["comment"]),
        commentAction: json["commentAction"] == null ? null : commentActionValues.map[json["commentAction"]],
        commentAnchor: json["commentAnchor"] == null ? null : CommentAnchor.fromJson(json["commentAnchor"]),
        createdDate: json["createdDate"] == null ? null : json["createdDate"].toDouble(),
        id: json["id"] == null ? null : json["id"].toDouble(),
        user: json["user"] == null ? null : BitBucketServerUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "action": action == null ? null : actionValues.reverse[action],
        "comment": comment == null ? null : comment.toJson(),
        "commentAction": commentAction == null ? null : commentActionValues.reverse[commentAction],
        "commentAnchor": commentAnchor == null ? null : commentAnchor.toJson(),
        "createdDate": createdDate == null ? null : createdDate,
        "id": id == null ? null : id,
        "user": user == null ? null : user.toJson(),
    };
}

/**
 * A BitBucketServer user account.
 */
class BitBucketServerUser {
    BitBucketServerUser({
        this.active,
        this.displayName,
        this.emailAddress,
        this.id,
        this.name,
        this.slug,
        this.type,
    });

    final bool active;
    final String displayName;
    final String emailAddress;
    final double id;
    final String name;
    final String slug;
    final PurpleType type;

    factory BitBucketServerUser.fromRawJson(String str) => BitBucketServerUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketServerUser.fromJson(Map<String, dynamic> json) => BitBucketServerUser(
        active: json["active"] == null ? null : json["active"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        emailAddress: json["emailAddress"] == null ? null : json["emailAddress"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        type: json["type"] == null ? null : purpleTypeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "active": active == null ? null : active,
        "displayName": displayName == null ? null : displayName,
        "emailAddress": emailAddress == null ? null : emailAddress,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "type": type == null ? null : purpleTypeValues.reverse[type],
    };
}

/**
 * The type of a user, "NORMAL" being a typical user3
 */
enum PurpleType { NORMAL, SERVICE }

final purpleTypeValues = EnumValues({
    "NORMAL": PurpleType.NORMAL,
    "SERVICE": PurpleType.SERVICE
});

class CommentParent {
    CommentParent({
        this.id,
    });

    final double id;

    factory CommentParent.fromRawJson(String str) => CommentParent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CommentParent.fromJson(Map<String, dynamic> json) => CommentParent(
        id: json["id"] == null ? null : json["id"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
    };
}

class PermittedOperations {
    PermittedOperations({
        this.deletable,
        this.editable,
    });

    final bool deletable;
    final bool editable;

    factory PermittedOperations.fromRawJson(String str) => PermittedOperations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PermittedOperations.fromJson(Map<String, dynamic> json) => PermittedOperations(
        deletable: json["deletable"] == null ? null : json["deletable"],
        editable: json["editable"] == null ? null : json["editable"],
    );

    Map<String, dynamic> toJson() => {
        "deletable": deletable == null ? null : deletable,
        "editable": editable == null ? null : editable,
    };
}

enum Action { COMMENTED, DECLINED, MERGED, OPENED, UPDATED }

final actionValues = EnumValues({
    "COMMENTED": Action.COMMENTED,
    "DECLINED": Action.DECLINED,
    "MERGED": Action.MERGED,
    "OPENED": Action.OPENED,
    "UPDATED": Action.UPDATED
});

enum CommentAction { ADDED, UPDATED }

final commentActionValues = EnumValues({
    "ADDED": CommentAction.ADDED,
    "UPDATED": CommentAction.UPDATED
});

class CommentAnchor {
    CommentAnchor({
        this.diffType,
        this.fileType,
        this.fromHash,
        this.line,
        this.lineType,
        this.path,
        this.srcPath,
        this.toHash,
    });

    final DiffType diffType;
    final FileType fileType;
    final String fromHash;
    final double line;
    final LineType lineType;
    final String path;
    final String srcPath;
    final String toHash;

    factory CommentAnchor.fromRawJson(String str) => CommentAnchor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CommentAnchor.fromJson(Map<String, dynamic> json) => CommentAnchor(
        diffType: json["diffType"] == null ? null : diffTypeValues.map[json["diffType"]],
        fileType: json["fileType"] == null ? null : fileTypeValues.map[json["fileType"]],
        fromHash: json["fromHash"] == null ? null : json["fromHash"],
        line: json["line"] == null ? null : json["line"].toDouble(),
        lineType: json["lineType"] == null ? null : lineTypeValues.map[json["lineType"]],
        path: json["path"] == null ? null : json["path"],
        srcPath: json["srcPath"] == null ? null : json["srcPath"],
        toHash: json["toHash"] == null ? null : json["toHash"],
    );

    Map<String, dynamic> toJson() => {
        "diffType": diffType == null ? null : diffTypeValues.reverse[diffType],
        "fileType": fileType == null ? null : fileTypeValues.reverse[fileType],
        "fromHash": fromHash == null ? null : fromHash,
        "line": line == null ? null : line,
        "lineType": lineType == null ? null : lineTypeValues.reverse[lineType],
        "path": path == null ? null : path,
        "srcPath": srcPath == null ? null : srcPath,
        "toHash": toHash == null ? null : toHash,
    };
}

enum DiffType { COMMIT, EFFECTIVE, RANGE, REQUIRED }

final diffTypeValues = EnumValues({
    "COMMIT": DiffType.COMMIT,
    "EFFECTIVE": DiffType.EFFECTIVE,
    "RANGE": DiffType.RANGE,
    "REQUIRED": DiffType.REQUIRED
});

enum FileType { FROM, TO }

final fileTypeValues = EnumValues({
    "FROM": FileType.FROM,
    "TO": FileType.TO
});

enum LineType { ADDED, CONTEXT, REMOVED }

final lineTypeValues = EnumValues({
    "ADDED": LineType.ADDED,
    "CONTEXT": LineType.CONTEXT,
    "REMOVED": LineType.REMOVED
});

/**
 * A BitBucketServer specific implementation of a git commit.
 */
class BitBucketServerCommit {
    BitBucketServerCommit({
        this.author,
        this.authorTimestamp,
        this.committer,
        this.committerTimestamp,
        this.displayId,
        this.id,
        this.message,
        this.parents,
    });

    final FluffyAuthor author;
    final double authorTimestamp;
    final Committer committer;
    final double committerTimestamp;
    final String displayId;
    final String id;
    final String message;
    final List<FluffyParent> parents;

    factory BitBucketServerCommit.fromRawJson(String str) => BitBucketServerCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketServerCommit.fromJson(Map<String, dynamic> json) => BitBucketServerCommit(
        author: json["author"] == null ? null : FluffyAuthor.fromJson(json["author"]),
        authorTimestamp: json["authorTimestamp"] == null ? null : json["authorTimestamp"].toDouble(),
        committer: json["committer"] == null ? null : Committer.fromJson(json["committer"]),
        committerTimestamp: json["committerTimestamp"] == null ? null : json["committerTimestamp"].toDouble(),
        displayId: json["displayId"] == null ? null : json["displayId"],
        id: json["id"] == null ? null : json["id"],
        message: json["message"] == null ? null : json["message"],
        parents: json["parents"] == null ? null : List<FluffyParent>.from(json["parents"].map((x) => FluffyParent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "author": author == null ? null : author.toJson(),
        "authorTimestamp": authorTimestamp == null ? null : authorTimestamp,
        "committer": committer == null ? null : committer.toJson(),
        "committerTimestamp": committerTimestamp == null ? null : committerTimestamp,
        "displayId": displayId == null ? null : displayId,
        "id": id == null ? null : id,
        "message": message == null ? null : message,
        "parents": parents == null ? null : List<dynamic>.from(parents.map((x) => x.toJson())),
    };
}

/**
 * The author of the commit, assumed to be the person who wrote the code.
 */
class FluffyAuthor {
    FluffyAuthor({
        this.displayName,
        this.emailAddress,
        this.name,
    });

    final String displayName;
    final String emailAddress;
    final String name;

    factory FluffyAuthor.fromRawJson(String str) => FluffyAuthor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FluffyAuthor.fromJson(Map<String, dynamic> json) => FluffyAuthor(
        displayName: json["displayName"] == null ? null : json["displayName"],
        emailAddress: json["emailAddress"] == null ? null : json["emailAddress"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "displayName": displayName == null ? null : displayName,
        "emailAddress": emailAddress == null ? null : emailAddress,
        "name": name == null ? null : name,
    };
}

/**
 * The author of the commit, assumed to be the person who committed/merged the code into a
 * project.
 */
class Committer {
    Committer({
        this.displayName,
        this.emailAddress,
        this.name,
    });

    final String displayName;
    final String emailAddress;
    final String name;

    factory Committer.fromRawJson(String str) => Committer.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Committer.fromJson(Map<String, dynamic> json) => Committer(
        displayName: json["displayName"] == null ? null : json["displayName"],
        emailAddress: json["emailAddress"] == null ? null : json["emailAddress"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "displayName": displayName == null ? null : displayName,
        "emailAddress": emailAddress == null ? null : emailAddress,
        "name": name == null ? null : name,
    };
}

class FluffyParent {
    FluffyParent({
        this.displayId,
        this.id,
    });

    final String displayId;
    final String id;

    factory FluffyParent.fromRawJson(String str) => FluffyParent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FluffyParent.fromJson(Map<String, dynamic> json) => FluffyParent(
        displayId: json["displayId"] == null ? null : json["displayId"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "displayId": displayId == null ? null : displayId,
        "id": id == null ? null : id,
    };
}

/**
 * This is `danger.bitbucket_server.issues` It refers to the issues that are linked to the
 * Pull Request.
 */
class JiraIssue {
    JiraIssue({
        this.key,
        this.url,
    });

    final String key;
    final String url;

    factory JiraIssue.fromRawJson(String str) => JiraIssue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JiraIssue.fromJson(Map<String, dynamic> json) => JiraIssue(
        key: json["key"] == null ? null : json["key"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "url": url == null ? null : url,
    };
}

/**
 * The PR metadata
 *
 * An exact copy of the PR's reference JSON. This interface has type'd the majority
 * of it for tooling's sake, but any extra metadata which BitBucket Server send
 * will still be inside the JS object.
 */
class BitBucketServerPrdsl {
    BitBucketServerPrdsl({
        this.author,
        this.closed,
        this.createdDate,
        this.description,
        this.fromRef,
        this.id,
        this.links,
        this.locked,
        this.open,
        this.participants,
        this.reviewers,
        this.state,
        this.title,
        this.toRef,
        this.updatedDate,
        this.version,
    });

    final PrAuthor author;
    final bool closed;
    final double createdDate;
    final String description;
    final BitBucketServerMergeRef fromRef;
    final double id;
    final Links links;
    final bool locked;
    final bool open;
    final List<ParticipantElement> participants;
    final List<ReviewerElement> reviewers;
    final PurpleState state;
    final String title;
    final BitBucketServerMergeRef toRef;
    final double updatedDate;
    final double version;

    factory BitBucketServerPrdsl.fromRawJson(String str) => BitBucketServerPrdsl.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketServerPrdsl.fromJson(Map<String, dynamic> json) => BitBucketServerPrdsl(
        author: json["author"] == null ? null : PrAuthor.fromJson(json["author"]),
        closed: json["closed"] == null ? null : json["closed"],
        createdDate: json["createdDate"] == null ? null : json["createdDate"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        fromRef: json["fromRef"] == null ? null : BitBucketServerMergeRef.fromJson(json["fromRef"]),
        id: json["id"] == null ? null : json["id"].toDouble(),
        links: json["links"] == null ? null : linksValues.map[json["links"]],
        locked: json["locked"] == null ? null : json["locked"],
        open: json["open"] == null ? null : json["open"],
        participants: json["participants"] == null ? null : List<ParticipantElement>.from(json["participants"].map((x) => ParticipantElement.fromJson(x))),
        reviewers: json["reviewers"] == null ? null : List<ReviewerElement>.from(json["reviewers"].map((x) => ReviewerElement.fromJson(x))),
        state: json["state"] == null ? null : purpleStateValues.map[json["state"]],
        title: json["title"] == null ? null : json["title"],
        toRef: json["toRef"] == null ? null : BitBucketServerMergeRef.fromJson(json["toRef"]),
        updatedDate: json["updatedDate"] == null ? null : json["updatedDate"].toDouble(),
        version: json["version"] == null ? null : json["version"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "author": author == null ? null : author.toJson(),
        "closed": closed == null ? null : closed,
        "createdDate": createdDate == null ? null : createdDate,
        "description": description == null ? null : description,
        "fromRef": fromRef == null ? null : fromRef.toJson(),
        "id": id == null ? null : id,
        "links": links == null ? null : linksValues.reverse[links],
        "locked": locked == null ? null : locked,
        "open": open == null ? null : open,
        "participants": participants == null ? null : List<dynamic>.from(participants.map((x) => x.toJson())),
        "reviewers": reviewers == null ? null : List<dynamic>.from(reviewers.map((x) => x.toJson())),
        "state": state == null ? null : purpleStateValues.reverse[state],
        "title": title == null ? null : title,
        "toRef": toRef == null ? null : toRef.toJson(),
        "updatedDate": updatedDate == null ? null : updatedDate,
        "version": version == null ? null : version,
    };
}

/**
 * The creator of the PR
 */
class PrAuthor {
    PrAuthor({
        this.approved,
        this.role,
        this.status,
        this.user,
    });

    final bool approved;
    final AuthorRole role;
    final AuthorStatus status;
    final BitBucketServerUser user;

    factory PrAuthor.fromRawJson(String str) => PrAuthor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PrAuthor.fromJson(Map<String, dynamic> json) => PrAuthor(
        approved: json["approved"] == null ? null : json["approved"],
        role: json["role"] == null ? null : authorRoleValues.map[json["role"]],
        status: json["status"] == null ? null : authorStatusValues.map[json["status"]],
        user: json["user"] == null ? null : BitBucketServerUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "approved": approved == null ? null : approved,
        "role": role == null ? null : authorRoleValues.reverse[role],
        "status": status == null ? null : authorStatusValues.reverse[status],
        "user": user == null ? null : user.toJson(),
    };
}

/**
 * How did they contribute
 */
enum AuthorRole { AUTHOR }

final authorRoleValues = EnumValues({
    "AUTHOR": AuthorRole.AUTHOR
});

/**
 * Their review feedback
 */
enum AuthorStatus { APPROVED, NEEDS_WORK, UNAPPROVED }

final authorStatusValues = EnumValues({
    "APPROVED": AuthorStatus.APPROVED,
    "NEEDS_WORK": AuthorStatus.NEEDS_WORK,
    "UNAPPROVED": AuthorStatus.UNAPPROVED
});

/**
 * The PR submitter's reference
 *
 * The repo Danger is running on
 */
class BitBucketServerMergeRef {
    BitBucketServerMergeRef({
        this.displayId,
        this.id,
        this.latestCommit,
        this.repository,
    });

    final String displayId;
    final String id;
    final String latestCommit;
    final BitBucketServerRepo repository;

    factory BitBucketServerMergeRef.fromRawJson(String str) => BitBucketServerMergeRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketServerMergeRef.fromJson(Map<String, dynamic> json) => BitBucketServerMergeRef(
        displayId: json["displayId"] == null ? null : json["displayId"],
        id: json["id"] == null ? null : json["id"],
        latestCommit: json["latestCommit"] == null ? null : json["latestCommit"],
        repository: json["repository"] == null ? null : BitBucketServerRepo.fromJson(json["repository"]),
    );

    Map<String, dynamic> toJson() => {
        "displayId": displayId == null ? null : displayId,
        "id": id == null ? null : id,
        "latestCommit": latestCommit == null ? null : latestCommit,
        "repository": repository == null ? null : repository.toJson(),
    };
}

/**
 * A BitBucket Server Repo
 */
class BitBucketServerRepo {
    BitBucketServerRepo({
        this.forkable,
        this.links,
        this.name,
        this.project,
        this.public,
        this.scmId,
        this.slug,
    });

    final bool forkable;
    final BitBucketServerLinks links;
    final String name;
    final Project project;
    final bool public;
    final String scmId;
    final String slug;

    factory BitBucketServerRepo.fromRawJson(String str) => BitBucketServerRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BitBucketServerRepo.fromJson(Map<String, dynamic> json) => BitBucketServerRepo(
        forkable: json["forkable"] == null ? null : json["forkable"],
        links: json["links"] == null ? null : bitBucketServerLinksValues.map[json["links"]],
        name: json["name"] == null ? null : json["name"],
        project: json["project"] == null ? null : Project.fromJson(json["project"]),
        public: json["public"] == null ? null : json["public"],
        scmId: json["scmId"] == null ? null : json["scmId"],
        slug: json["slug"] == null ? null : json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "forkable": forkable == null ? null : forkable,
        "links": links == null ? null : bitBucketServerLinksValues.reverse[links],
        "name": name == null ? null : name,
        "project": project == null ? null : project.toJson(),
        "public": public == null ? null : public,
        "scmId": scmId == null ? null : scmId,
        "slug": slug == null ? null : slug,
    };
}

/**
 * Links for the projects
 */
enum BitBucketServerLinks { CLONE, SELF }

final bitBucketServerLinksValues = EnumValues({
    "clone": BitBucketServerLinks.CLONE,
    "self": BitBucketServerLinks.SELF
});

/**
 * An abstraction for grouping repos
 */
class Project {
    Project({
        this.id,
        this.key,
        this.links,
        this.name,
        this.public,
        this.type,
    });

    final double id;
    final String key;
    final Links links;
    final String name;
    final bool public;
    final String type;

    factory Project.fromRawJson(String str) => Project.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"] == null ? null : json["id"].toDouble(),
        key: json["key"] == null ? null : json["key"],
        links: json["links"] == null ? null : linksValues.map[json["links"]],
        name: json["name"] == null ? null : json["name"],
        public: json["public"] == null ? null : json["public"],
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "key": key == null ? null : key,
        "links": links == null ? null : linksValues.reverse[links],
        "name": name == null ? null : name,
        "public": public == null ? null : public,
        "type": type == null ? null : type,
    };
}

/**
 * Hyperlinks for the project
 *
 * Misc links for hypermedia conformance
 */
enum Links { SELF }

final linksValues = EnumValues({
    "self": Links.SELF
});

class ParticipantElement {
    ParticipantElement({
        this.approved,
        this.role,
        this.status,
        this.user,
    });

    final bool approved;
    final FluffyRole role;
    final AuthorStatus status;
    final BitBucketServerUser user;

    factory ParticipantElement.fromRawJson(String str) => ParticipantElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ParticipantElement.fromJson(Map<String, dynamic> json) => ParticipantElement(
        approved: json["approved"] == null ? null : json["approved"],
        role: json["role"] == null ? null : fluffyRoleValues.map[json["role"]],
        status: json["status"] == null ? null : authorStatusValues.map[json["status"]],
        user: json["user"] == null ? null : BitBucketServerUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "approved": approved == null ? null : approved,
        "role": role == null ? null : fluffyRoleValues.reverse[role],
        "status": status == null ? null : authorStatusValues.reverse[status],
        "user": user == null ? null : user.toJson(),
    };
}

/**
 * How did they contribute
 */
enum FluffyRole { PARTICIPANT }

final fluffyRoleValues = EnumValues({
    "PARTICIPANT": FluffyRole.PARTICIPANT
});

class ReviewerElement {
    ReviewerElement({
        this.approved,
        this.role,
        this.status,
        this.user,
    });

    final bool approved;
    final ReviewerRole role;
    final AuthorStatus status;
    final BitBucketServerUser user;

    factory ReviewerElement.fromRawJson(String str) => ReviewerElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReviewerElement.fromJson(Map<String, dynamic> json) => ReviewerElement(
        approved: json["approved"] == null ? null : json["approved"],
        role: json["role"] == null ? null : reviewerRoleValues.map[json["role"]],
        status: json["status"] == null ? null : authorStatusValues.map[json["status"]],
        user: json["user"] == null ? null : BitBucketServerUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "approved": approved == null ? null : approved,
        "role": role == null ? null : reviewerRoleValues.reverse[role],
        "status": status == null ? null : authorStatusValues.reverse[status],
        "user": user == null ? null : user.toJson(),
    };
}

/**
 * How did they contribute
 */
enum ReviewerRole { REVIEWER }

final reviewerRoleValues = EnumValues({
    "REVIEWER": ReviewerRole.REVIEWER
});

/**
 * The data only version of Git DSL
 *
 * The Git Related Metadata which is available inside the Danger DSL JSON
 */
class GitJsondsl {
    GitJsondsl({
        this.commits,
        this.createdFiles,
        this.deletedFiles,
        this.modifiedFiles,
    });

    final List<GitCommit> commits;
    final List<String> createdFiles;
    final List<String> deletedFiles;
    final List<String> modifiedFiles;

    factory GitJsondsl.fromRawJson(String str) => GitJsondsl.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitJsondsl.fromJson(Map<String, dynamic> json) => GitJsondsl(
        commits: json["commits"] == null ? null : List<GitCommit>.from(json["commits"].map((x) => GitCommit.fromJson(x))),
        createdFiles: json["created_files"] == null ? null : List<String>.from(json["created_files"].map((x) => x)),
        deletedFiles: json["deleted_files"] == null ? null : List<String>.from(json["deleted_files"].map((x) => x)),
        modifiedFiles: json["modified_files"] == null ? null : List<String>.from(json["modified_files"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "commits": commits == null ? null : List<dynamic>.from(commits.map((x) => x.toJson())),
        "created_files": createdFiles == null ? null : List<dynamic>.from(createdFiles.map((x) => x)),
        "deleted_files": deletedFiles == null ? null : List<dynamic>.from(deletedFiles.map((x) => x)),
        "modified_files": modifiedFiles == null ? null : List<dynamic>.from(modifiedFiles.map((x) => x)),
    };
}

/**
 * A platform agnostic reference to a Git commit
 *
 * The raw commit metadata
 */
class GitCommit {
    GitCommit({
        this.author,
        this.committer,
        this.message,
        this.parents,
        this.sha,
        this.tree,
        this.url,
    });

    final GitCommitAuthor author;
    final GitCommitAuthor committer;
    final String message;
    final List<String> parents;
    final String sha;
    final dynamic tree;
    final String url;

    factory GitCommit.fromRawJson(String str) => GitCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitCommit.fromJson(Map<String, dynamic> json) => GitCommit(
        author: json["author"] == null ? null : GitCommitAuthor.fromJson(json["author"]),
        committer: json["committer"] == null ? null : GitCommitAuthor.fromJson(json["committer"]),
        message: json["message"] == null ? null : json["message"],
        parents: json["parents"] == null ? null : List<String>.from(json["parents"].map((x) => x)),
        sha: json["sha"] == null ? null : json["sha"],
        tree: json["tree"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "author": author == null ? null : author.toJson(),
        "committer": committer == null ? null : committer.toJson(),
        "message": message == null ? null : message,
        "parents": parents == null ? null : List<dynamic>.from(parents.map((x) => x)),
        "sha": sha == null ? null : sha,
        "tree": tree,
        "url": url == null ? null : url,
    };
}

/**
 * Who wrote the commit
 *
 * An author of a commit
 *
 * Who deployed the commit
 */
class GitCommitAuthor {
    GitCommitAuthor({
        this.date,
        this.email,
        this.name,
    });

    final String date;
    final String email;
    final String name;

    factory GitCommitAuthor.fromRawJson(String str) => GitCommitAuthor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitCommitAuthor.fromJson(Map<String, dynamic> json) => GitCommitAuthor(
        date: json["date"] == null ? null : json["date"],
        email: json["email"] == null ? null : json["email"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "date": date == null ? null : date,
        "email": email == null ? null : email,
        "name": name == null ? null : name,
    };
}

/**
 * The data only version of GitHub DSL
 *
 * The GitHub metadata for your PR
 */
class GitHubDsl {
    GitHubDsl({
        this.api,
        this.commits,
        this.issue,
        this.pr,
        this.requestedReviewers,
        this.reviews,
        this.thisPr,
        this.utils,
    });

    final Octokit api;
    final List<GitHubCommit> commits;
    final GitHubIssue issue;
    final GitHubPrdsl pr;
    final GitHubReviewers requestedReviewers;
    final List<GitHubReview> reviews;
    final GitHubApipr thisPr;
    final GitHubUtilsDsl utils;

    factory GitHubDsl.fromRawJson(String str) => GitHubDsl.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubDsl.fromJson(Map<String, dynamic> json) => GitHubDsl(
        api: json["api"] == null ? null : Octokit.fromJson(json["api"]),
        commits: json["commits"] == null ? null : List<GitHubCommit>.from(json["commits"].map((x) => GitHubCommit.fromJson(x))),
        issue: json["issue"] == null ? null : GitHubIssue.fromJson(json["issue"]),
        pr: json["pr"] == null ? null : GitHubPrdsl.fromJson(json["pr"]),
        requestedReviewers: json["requested_reviewers"] == null ? null : GitHubReviewers.fromJson(json["requested_reviewers"]),
        reviews: json["reviews"] == null ? null : List<GitHubReview>.from(json["reviews"].map((x) => GitHubReview.fromJson(x))),
        thisPr: json["thisPR"] == null ? null : GitHubApipr.fromJson(json["thisPR"]),
        utils: json["utils"] == null ? null : GitHubUtilsDsl.fromJson(json["utils"]),
    );

    Map<String, dynamic> toJson() => {
        "api": api == null ? null : api.toJson(),
        "commits": commits == null ? null : List<dynamic>.from(commits.map((x) => x.toJson())),
        "issue": issue == null ? null : issue.toJson(),
        "pr": pr == null ? null : pr.toJson(),
        "requested_reviewers": requestedReviewers == null ? null : requestedReviewers.toJson(),
        "reviews": reviews == null ? null : List<dynamic>.from(reviews.map((x) => x.toJson())),
        "thisPR": thisPr == null ? null : thisPr.toJson(),
        "utils": utils == null ? null : utils.toJson(),
    };
}

/**
 * An authenticated API so you can extend danger's behavior by using the [GitHub v3
 * API](https://developer.github.com/v3/).
 *
 * A set up instance of the "github" npm module. You can get the full [API
 * here](https://octokit.github.io/node-github/).
 */
class Octokit {
    Octokit({
        this.actions,
        this.activity,
        this.apps,
        this.checks,
        this.codesOfConduct,
        this.emojis,
        this.gists,
        this.git,
        this.gitignore,
        this.hook,
        this.interactions,
        this.issues,
        this.licenses,
        this.log,
        this.markdown,
        this.meta,
        this.migrations,
        this.oauthAuthorizations,
        this.orgs,
        this.paginate,
        this.projects,
        this.pulls,
        this.rateLimit,
        this.reactions,
        this.repos,
        this.request,
        this.search,
        this.teams,
        this.users,
    });

    final Actions actions;
    final ApiActivity activity;
    final Apps apps;
    final Checks checks;
    final CodesOfConduct codesOfConduct;
    final Emojis emojis;
    final Gists gists;
    final Git git;
    final Gitignore gitignore;
    final Map<String, dynamic> hook;
    final Interactions interactions;
    final ApiIssues issues;
    final Licenses licenses;
    final OctokitLog log;
    final Markdown markdown;
    final Meta meta;
    final Migrations migrations;
    final OauthAuthorizations oauthAuthorizations;
    final Orgs orgs;
    final OctokitPaginate paginate;
    final Projects projects;
    final Pulls pulls;
    final RateLimit rateLimit;
    final Reactions reactions;
    final ApiRepos repos;
    final OctokitRequest request;
    final Search search;
    final Teams teams;
    final ApiUsers users;

    factory Octokit.fromRawJson(String str) => Octokit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Octokit.fromJson(Map<String, dynamic> json) => Octokit(
        actions: json["actions"] == null ? null : Actions.fromJson(json["actions"]),
        activity: json["activity"] == null ? null : ApiActivity.fromJson(json["activity"]),
        apps: json["apps"] == null ? null : Apps.fromJson(json["apps"]),
        checks: json["checks"] == null ? null : Checks.fromJson(json["checks"]),
        codesOfConduct: json["codesOfConduct"] == null ? null : CodesOfConduct.fromJson(json["codesOfConduct"]),
        emojis: json["emojis"] == null ? null : Emojis.fromJson(json["emojis"]),
        gists: json["gists"] == null ? null : Gists.fromJson(json["gists"]),
        git: json["git"] == null ? null : Git.fromJson(json["git"]),
        gitignore: json["gitignore"] == null ? null : Gitignore.fromJson(json["gitignore"]),
        hook: json["hook"] == null ? null : Map.from(json["hook"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        interactions: json["interactions"] == null ? null : Interactions.fromJson(json["interactions"]),
        issues: json["issues"] == null ? null : ApiIssues.fromJson(json["issues"]),
        licenses: json["licenses"] == null ? null : Licenses.fromJson(json["licenses"]),
        log: json["log"] == null ? null : OctokitLog.fromJson(json["log"]),
        markdown: json["markdown"] == null ? null : Markdown.fromJson(json["markdown"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        migrations: json["migrations"] == null ? null : Migrations.fromJson(json["migrations"]),
        oauthAuthorizations: json["oauthAuthorizations"] == null ? null : OauthAuthorizations.fromJson(json["oauthAuthorizations"]),
        orgs: json["orgs"] == null ? null : Orgs.fromJson(json["orgs"]),
        paginate: json["paginate"] == null ? null : OctokitPaginate.fromJson(json["paginate"]),
        projects: json["projects"] == null ? null : Projects.fromJson(json["projects"]),
        pulls: json["pulls"] == null ? null : Pulls.fromJson(json["pulls"]),
        rateLimit: json["rateLimit"] == null ? null : RateLimit.fromJson(json["rateLimit"]),
        reactions: json["reactions"] == null ? null : Reactions.fromJson(json["reactions"]),
        repos: json["repos"] == null ? null : ApiRepos.fromJson(json["repos"]),
        request: json["request"] == null ? null : OctokitRequest.fromJson(json["request"]),
        search: json["search"] == null ? null : Search.fromJson(json["search"]),
        teams: json["teams"] == null ? null : Teams.fromJson(json["teams"]),
        users: json["users"] == null ? null : ApiUsers.fromJson(json["users"]),
    );

    Map<String, dynamic> toJson() => {
        "actions": actions == null ? null : actions.toJson(),
        "activity": activity == null ? null : activity.toJson(),
        "apps": apps == null ? null : apps.toJson(),
        "checks": checks == null ? null : checks.toJson(),
        "codesOfConduct": codesOfConduct == null ? null : codesOfConduct.toJson(),
        "emojis": emojis == null ? null : emojis.toJson(),
        "gists": gists == null ? null : gists.toJson(),
        "git": git == null ? null : git.toJson(),
        "gitignore": gitignore == null ? null : gitignore.toJson(),
        "hook": hook == null ? null : Map.from(hook).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "interactions": interactions == null ? null : interactions.toJson(),
        "issues": issues == null ? null : issues.toJson(),
        "licenses": licenses == null ? null : licenses.toJson(),
        "log": log == null ? null : log.toJson(),
        "markdown": markdown == null ? null : markdown.toJson(),
        "meta": meta == null ? null : meta.toJson(),
        "migrations": migrations == null ? null : migrations.toJson(),
        "oauthAuthorizations": oauthAuthorizations == null ? null : oauthAuthorizations.toJson(),
        "orgs": orgs == null ? null : orgs.toJson(),
        "paginate": paginate == null ? null : paginate.toJson(),
        "projects": projects == null ? null : projects.toJson(),
        "pulls": pulls == null ? null : pulls.toJson(),
        "rateLimit": rateLimit == null ? null : rateLimit.toJson(),
        "reactions": reactions == null ? null : reactions.toJson(),
        "repos": repos == null ? null : repos.toJson(),
        "request": request == null ? null : request.toJson(),
        "search": search == null ? null : search.toJson(),
        "teams": teams == null ? null : teams.toJson(),
        "users": users == null ? null : users.toJson(),
    };
}

class Actions {
    Actions({
        this.cancelWorkflowRun,
        this.createOrUpdateSecretForRepo,
        this.createRegistrationToken,
        this.createRemoveToken,
        this.deleteArtifact,
        this.deleteSecretFromRepo,
        this.downloadArtifact,
        this.getArtifact,
        this.getPublicKey,
        this.getSecret,
        this.getSelfHostedRunner,
        this.getWorkflow,
        this.getWorkflowJob,
        this.getWorkflowRun,
        this.listDownloadsForSelfHostedRunnerApplication,
        this.listJobsForWorkflowRun,
        this.listRepoWorkflowRuns,
        this.listRepoWorkflows,
        this.listSecretsForRepo,
        this.listSelfHostedRunnersForRepo,
        this.listWorkflowJobLogs,
        this.listWorkflowRunArtifacts,
        this.listWorkflowRunLogs,
        this.listWorkflowRuns,
        this.removeSelfHostedRunner,
        this.reRunWorkflow,
    });

    final CancelWorkflowRun cancelWorkflowRun;
    final CreateOrUpdateSecretForRepo createOrUpdateSecretForRepo;
    final CreateRegistrationToken createRegistrationToken;
    final CreateRemoveToken createRemoveToken;
    final DeleteArtifact deleteArtifact;
    final DeleteSecretFromRepo deleteSecretFromRepo;
    final DownloadArtifact downloadArtifact;
    final GetArtifact getArtifact;
    final ActionsGetPublicKey getPublicKey;
    final GetSecret getSecret;
    final GetSelfHostedRunner getSelfHostedRunner;
    final GetWorkflow getWorkflow;
    final GetWorkflowJob getWorkflowJob;
    final GetWorkflowRun getWorkflowRun;
    final ListDownloadsForSelfHostedRunnerApplication listDownloadsForSelfHostedRunnerApplication;
    final ListJobsForWorkflowRun listJobsForWorkflowRun;
    final ListRepoWorkflowRuns listRepoWorkflowRuns;
    final ListRepoWorkflows listRepoWorkflows;
    final ListSecretsForRepo listSecretsForRepo;
    final ListSelfHostedRunnersForRepo listSelfHostedRunnersForRepo;
    final ListWorkflowJobLogs listWorkflowJobLogs;
    final ListWorkflowRunArtifacts listWorkflowRunArtifacts;
    final ListWorkflowRunLogs listWorkflowRunLogs;
    final ListWorkflowRuns listWorkflowRuns;
    final RemoveSelfHostedRunner removeSelfHostedRunner;
    final ReRunWorkflow reRunWorkflow;

    factory Actions.fromRawJson(String str) => Actions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Actions.fromJson(Map<String, dynamic> json) => Actions(
        cancelWorkflowRun: json["cancelWorkflowRun"] == null ? null : CancelWorkflowRun.fromJson(json["cancelWorkflowRun"]),
        createOrUpdateSecretForRepo: json["createOrUpdateSecretForRepo"] == null ? null : CreateOrUpdateSecretForRepo.fromJson(json["createOrUpdateSecretForRepo"]),
        createRegistrationToken: json["createRegistrationToken"] == null ? null : CreateRegistrationToken.fromJson(json["createRegistrationToken"]),
        createRemoveToken: json["createRemoveToken"] == null ? null : CreateRemoveToken.fromJson(json["createRemoveToken"]),
        deleteArtifact: json["deleteArtifact"] == null ? null : DeleteArtifact.fromJson(json["deleteArtifact"]),
        deleteSecretFromRepo: json["deleteSecretFromRepo"] == null ? null : DeleteSecretFromRepo.fromJson(json["deleteSecretFromRepo"]),
        downloadArtifact: json["downloadArtifact"] == null ? null : DownloadArtifact.fromJson(json["downloadArtifact"]),
        getArtifact: json["getArtifact"] == null ? null : GetArtifact.fromJson(json["getArtifact"]),
        getPublicKey: json["getPublicKey"] == null ? null : ActionsGetPublicKey.fromJson(json["getPublicKey"]),
        getSecret: json["getSecret"] == null ? null : GetSecret.fromJson(json["getSecret"]),
        getSelfHostedRunner: json["getSelfHostedRunner"] == null ? null : GetSelfHostedRunner.fromJson(json["getSelfHostedRunner"]),
        getWorkflow: json["getWorkflow"] == null ? null : GetWorkflow.fromJson(json["getWorkflow"]),
        getWorkflowJob: json["getWorkflowJob"] == null ? null : GetWorkflowJob.fromJson(json["getWorkflowJob"]),
        getWorkflowRun: json["getWorkflowRun"] == null ? null : GetWorkflowRun.fromJson(json["getWorkflowRun"]),
        listDownloadsForSelfHostedRunnerApplication: json["listDownloadsForSelfHostedRunnerApplication"] == null ? null : ListDownloadsForSelfHostedRunnerApplication.fromJson(json["listDownloadsForSelfHostedRunnerApplication"]),
        listJobsForWorkflowRun: json["listJobsForWorkflowRun"] == null ? null : ListJobsForWorkflowRun.fromJson(json["listJobsForWorkflowRun"]),
        listRepoWorkflowRuns: json["listRepoWorkflowRuns"] == null ? null : ListRepoWorkflowRuns.fromJson(json["listRepoWorkflowRuns"]),
        listRepoWorkflows: json["listRepoWorkflows"] == null ? null : ListRepoWorkflows.fromJson(json["listRepoWorkflows"]),
        listSecretsForRepo: json["listSecretsForRepo"] == null ? null : ListSecretsForRepo.fromJson(json["listSecretsForRepo"]),
        listSelfHostedRunnersForRepo: json["listSelfHostedRunnersForRepo"] == null ? null : ListSelfHostedRunnersForRepo.fromJson(json["listSelfHostedRunnersForRepo"]),
        listWorkflowJobLogs: json["listWorkflowJobLogs"] == null ? null : ListWorkflowJobLogs.fromJson(json["listWorkflowJobLogs"]),
        listWorkflowRunArtifacts: json["listWorkflowRunArtifacts"] == null ? null : ListWorkflowRunArtifacts.fromJson(json["listWorkflowRunArtifacts"]),
        listWorkflowRunLogs: json["listWorkflowRunLogs"] == null ? null : ListWorkflowRunLogs.fromJson(json["listWorkflowRunLogs"]),
        listWorkflowRuns: json["listWorkflowRuns"] == null ? null : ListWorkflowRuns.fromJson(json["listWorkflowRuns"]),
        removeSelfHostedRunner: json["removeSelfHostedRunner"] == null ? null : RemoveSelfHostedRunner.fromJson(json["removeSelfHostedRunner"]),
        reRunWorkflow: json["reRunWorkflow"] == null ? null : ReRunWorkflow.fromJson(json["reRunWorkflow"]),
    );

    Map<String, dynamic> toJson() => {
        "cancelWorkflowRun": cancelWorkflowRun == null ? null : cancelWorkflowRun.toJson(),
        "createOrUpdateSecretForRepo": createOrUpdateSecretForRepo == null ? null : createOrUpdateSecretForRepo.toJson(),
        "createRegistrationToken": createRegistrationToken == null ? null : createRegistrationToken.toJson(),
        "createRemoveToken": createRemoveToken == null ? null : createRemoveToken.toJson(),
        "deleteArtifact": deleteArtifact == null ? null : deleteArtifact.toJson(),
        "deleteSecretFromRepo": deleteSecretFromRepo == null ? null : deleteSecretFromRepo.toJson(),
        "downloadArtifact": downloadArtifact == null ? null : downloadArtifact.toJson(),
        "getArtifact": getArtifact == null ? null : getArtifact.toJson(),
        "getPublicKey": getPublicKey == null ? null : getPublicKey.toJson(),
        "getSecret": getSecret == null ? null : getSecret.toJson(),
        "getSelfHostedRunner": getSelfHostedRunner == null ? null : getSelfHostedRunner.toJson(),
        "getWorkflow": getWorkflow == null ? null : getWorkflow.toJson(),
        "getWorkflowJob": getWorkflowJob == null ? null : getWorkflowJob.toJson(),
        "getWorkflowRun": getWorkflowRun == null ? null : getWorkflowRun.toJson(),
        "listDownloadsForSelfHostedRunnerApplication": listDownloadsForSelfHostedRunnerApplication == null ? null : listDownloadsForSelfHostedRunnerApplication.toJson(),
        "listJobsForWorkflowRun": listJobsForWorkflowRun == null ? null : listJobsForWorkflowRun.toJson(),
        "listRepoWorkflowRuns": listRepoWorkflowRuns == null ? null : listRepoWorkflowRuns.toJson(),
        "listRepoWorkflows": listRepoWorkflows == null ? null : listRepoWorkflows.toJson(),
        "listSecretsForRepo": listSecretsForRepo == null ? null : listSecretsForRepo.toJson(),
        "listSelfHostedRunnersForRepo": listSelfHostedRunnersForRepo == null ? null : listSelfHostedRunnersForRepo.toJson(),
        "listWorkflowJobLogs": listWorkflowJobLogs == null ? null : listWorkflowJobLogs.toJson(),
        "listWorkflowRunArtifacts": listWorkflowRunArtifacts == null ? null : listWorkflowRunArtifacts.toJson(),
        "listWorkflowRunLogs": listWorkflowRunLogs == null ? null : listWorkflowRunLogs.toJson(),
        "listWorkflowRuns": listWorkflowRuns == null ? null : listWorkflowRuns.toJson(),
        "removeSelfHostedRunner": removeSelfHostedRunner == null ? null : removeSelfHostedRunner.toJson(),
        "reRunWorkflow": reRunWorkflow == null ? null : reRunWorkflow.toJson(),
    };
}

/**
 * Cancels a workflow run using its `id`. Anyone with write access to the repository can use
 * this endpoint. GitHub Apps must have the `actions` permission to use this endpoint.
 */
class CancelWorkflowRun {
    CancelWorkflowRun({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CancelWorkflowRun.fromRawJson(String str) => CancelWorkflowRun.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CancelWorkflowRun.fromJson(Map<String, dynamic> json) => CancelWorkflowRun(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class OctokitEndpoint {
    OctokitEndpoint({
        this.defaults,
    });

    final OctokitEndpointOptions defaults;

    factory OctokitEndpoint.fromRawJson(String str) => OctokitEndpoint.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OctokitEndpoint.fromJson(Map<String, dynamic> json) => OctokitEndpoint(
        defaults: json["DEFAULTS"] == null ? null : OctokitEndpointOptions.fromJson(json["DEFAULTS"]),
    );

    Map<String, dynamic> toJson() => {
        "DEFAULTS": defaults == null ? null : defaults.toJson(),
    };
}

/**
 * Current default options
 */
class OctokitEndpointOptions {
    OctokitEndpointOptions({
        this.baseUrl,
        this.data,
        this.headers,
        this.method,
        this.request,
        this.url,
    });

    final String baseUrl;
    final dynamic data;
    final Map<String, dynamic> headers;
    final Method method;
    final Map<String, dynamic> request;
    final String url;

    factory OctokitEndpointOptions.fromRawJson(String str) => OctokitEndpointOptions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OctokitEndpointOptions.fromJson(Map<String, dynamic> json) => OctokitEndpointOptions(
        baseUrl: json["baseUrl"] == null ? null : json["baseUrl"],
        data: json["data"],
        headers: json["headers"] == null ? null : Map.from(json["headers"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        method: json["method"] == null ? null : methodValues.map[json["method"]],
        request: json["request"] == null ? null : Map.from(json["request"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "baseUrl": baseUrl == null ? null : baseUrl,
        "data": data,
        "headers": headers == null ? null : Map.from(headers).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "method": method == null ? null : methodValues.reverse[method],
        "request": request == null ? null : Map.from(request).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "url": url == null ? null : url,
    };
}

enum Method { DELETE, GET, HEAD, PATCH, POST, PUT }

final methodValues = EnumValues({
    "DELETE": Method.DELETE,
    "GET": Method.GET,
    "HEAD": Method.HEAD,
    "PATCH": Method.PATCH,
    "POST": Method.POST,
    "PUT": Method.PUT
});

/**
 * Creates or updates a secret with an encrypted value. Encrypt your secret using
 * [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). Anyone with
 * write access to the repository can use this endpoint. GitHub Apps must have the `secrets`
 * permission to use this endpoint.
 *
 * Encrypt your secret using the [tweetsodium](https://github.com/mastahyeti/tweetsodium)
 * library.
 *
 *
 *
 * Encrypt your secret using
 * [pynacl](https://pynacl.readthedocs.io/en/stable/public/#nacl-public-sealedbox) with
 * Python 3.
 *
 *
 *
 * Encrypt your secret using the [Sodium.Core](https://www.nuget.org/packages/Sodium.Core/)
 * package.
 *
 *
 *
 * Encrypt your secret using the [rbnacl](https://github.com/RubyCrypto/rbnacl) gem.
 */
class CreateOrUpdateSecretForRepo {
    CreateOrUpdateSecretForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateOrUpdateSecretForRepo.fromRawJson(String str) => CreateOrUpdateSecretForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateOrUpdateSecretForRepo.fromJson(Map<String, dynamic> json) => CreateOrUpdateSecretForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns a token that you can pass to the `config` script. The token expires after one
 * hour. Anyone with admin access to the repository can use this endpoint. GitHub Apps must
 * have the `administration` permission to use this endpoint.
 *
 * Configure your self-hosted runner, replacing TOKEN with the registration token provided
 * by this endpoint.
 */
class CreateRegistrationToken {
    CreateRegistrationToken({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateRegistrationToken.fromRawJson(String str) => CreateRegistrationToken.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateRegistrationToken.fromJson(Map<String, dynamic> json) => CreateRegistrationToken(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns a token that you can pass to remove a self-hosted runner from a repository. The
 * token expires after one hour. Anyone with admin access to the repository can use this
 * endpoint. GitHub Apps must have the `administration` permission to use this endpoint.
 *
 * Remove your self-hosted runner from a repository, replacing TOKEN with the remove token
 * provided by this endpoint.
 */
class CreateRemoveToken {
    CreateRemoveToken({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateRemoveToken.fromRawJson(String str) => CreateRemoveToken.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateRemoveToken.fromJson(Map<String, dynamic> json) => CreateRemoveToken(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Deletes an artifact for a workflow run. Anyone with write access to the repository can
 * use this endpoint. GitHub Apps must have the `actions` permission to use this endpoint.
 */
class DeleteArtifact {
    DeleteArtifact({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteArtifact.fromRawJson(String str) => DeleteArtifact.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteArtifact.fromJson(Map<String, dynamic> json) => DeleteArtifact(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Deletes a secret in a repository using the secret name. Anyone with write access to the
 * repository can use this endpoint. GitHub Apps must have the `secrets` permission to use
 * this endpoint.
 */
class DeleteSecretFromRepo {
    DeleteSecretFromRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteSecretFromRepo.fromRawJson(String str) => DeleteSecretFromRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteSecretFromRepo.fromJson(Map<String, dynamic> json) => DeleteSecretFromRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a redirect URL to download an archive for a repository. This URL expires after 1
 * minute. Look for `Location:` in the response header to find the URL for the download. The
 * `:archive_format` must be `zip`. Anyone with read access to the repository can use this
 * endpoint. GitHub Apps must have the `actions` permission to use this endpoint.
 *
 * Call this endpoint using the `-v` flag, which enables verbose output and allows you to
 * see the download URL in the header. To download the file into the current working
 * directory, specify the filename using the `-o` flag.
 */
class DownloadArtifact {
    DownloadArtifact({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DownloadArtifact.fromRawJson(String str) => DownloadArtifact.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DownloadArtifact.fromJson(Map<String, dynamic> json) => DownloadArtifact(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a specific artifact for a workflow run. Anyone with read access to the repository
 * can use this endpoint. GitHub Apps must have the `actions` permission to use this
 * endpoint.
 */
class GetArtifact {
    GetArtifact({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetArtifact.fromRawJson(String str) => GetArtifact.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetArtifact.fromJson(Map<String, dynamic> json) => GetArtifact(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets your public key, which you must store. You need your public key to use other secrets
 * endpoints. Use the returned `key` to encrypt your secrets. Anyone with read access to the
 * repository can use this endpoint. GitHub Apps must have the `secrets` permission to use
 * this endpoint.
 */
class ActionsGetPublicKey {
    ActionsGetPublicKey({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ActionsGetPublicKey.fromRawJson(String str) => ActionsGetPublicKey.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ActionsGetPublicKey.fromJson(Map<String, dynamic> json) => ActionsGetPublicKey(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a single secret without revealing its encrypted value. Anyone with write access to
 * the repository can use this endpoint. GitHub Apps must have the `secrets` permission to
 * use this endpoint.
 */
class GetSecret {
    GetSecret({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetSecret.fromRawJson(String str) => GetSecret.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetSecret.fromJson(Map<String, dynamic> json) => GetSecret(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a specific self-hosted runner. Anyone with admin access to the repository can use
 * this endpoint. GitHub Apps must have the `administration` permission to use this endpoint.
 */
class GetSelfHostedRunner {
    GetSelfHostedRunner({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetSelfHostedRunner.fromRawJson(String str) => GetSelfHostedRunner.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetSelfHostedRunner.fromJson(Map<String, dynamic> json) => GetSelfHostedRunner(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a specific workflow. You can also replace `:workflow_id` with `:workflow_file_name`.
 * For example, you could use `main.yml`. Anyone with read access to the repository can use
 * this endpoint. GitHub Apps must have the `actions` permission to use this endpoint.
 */
class GetWorkflow {
    GetWorkflow({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetWorkflow.fromRawJson(String str) => GetWorkflow.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetWorkflow.fromJson(Map<String, dynamic> json) => GetWorkflow(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a specific job in a workflow run. Anyone with read access to the repository can use
 * this endpoint. GitHub Apps must have the `actions` permission to use this endpoint.
 */
class GetWorkflowJob {
    GetWorkflowJob({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetWorkflowJob.fromRawJson(String str) => GetWorkflowJob.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetWorkflowJob.fromJson(Map<String, dynamic> json) => GetWorkflowJob(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a specific workflow run. Anyone with read access to the repository can use this
 * endpoint. GitHub Apps must have the `actions` permission to use this endpoint.
 */
class GetWorkflowRun {
    GetWorkflowRun({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetWorkflowRun.fromRawJson(String str) => GetWorkflowRun.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetWorkflowRun.fromJson(Map<String, dynamic> json) => GetWorkflowRun(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists binaries for the self-hosted runner application that you can download and run.
 * Anyone with admin access to the repository can use this endpoint. GitHub Apps must have
 * the `administration` permission to use this endpoint.
 */
class ListDownloadsForSelfHostedRunnerApplication {
    ListDownloadsForSelfHostedRunnerApplication({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDownloadsForSelfHostedRunnerApplication.fromRawJson(String str) => ListDownloadsForSelfHostedRunnerApplication.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDownloadsForSelfHostedRunnerApplication.fromJson(Map<String, dynamic> json) => ListDownloadsForSelfHostedRunnerApplication(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists jobs for a workflow run. Anyone with read access to the repository can use this
 * endpoint. GitHub Apps must have the `actions` permission to use this endpoint.
 */
class ListJobsForWorkflowRun {
    ListJobsForWorkflowRun({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListJobsForWorkflowRun.fromRawJson(String str) => ListJobsForWorkflowRun.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListJobsForWorkflowRun.fromJson(Map<String, dynamic> json) => ListJobsForWorkflowRun(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all workflow runs for a repository. You can use parameters to narrow the list of
 * results. For more information about using parameters, see
 * [Parameters](https://developer.github.com/v3/#parameters).
 *
 * Anyone with read access to the repository can use this endpoint. GitHub Apps must have
 * the `actions` permission to use this endpoint.
 */
class ListRepoWorkflowRuns {
    ListRepoWorkflowRuns({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListRepoWorkflowRuns.fromRawJson(String str) => ListRepoWorkflowRuns.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListRepoWorkflowRuns.fromJson(Map<String, dynamic> json) => ListRepoWorkflowRuns(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the workflows in a repository. Anyone with read access to the repository can use
 * this endpoint. GitHub Apps must have the `actions` permission to use this endpoint.
 */
class ListRepoWorkflows {
    ListRepoWorkflows({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListRepoWorkflows.fromRawJson(String str) => ListRepoWorkflows.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListRepoWorkflows.fromJson(Map<String, dynamic> json) => ListRepoWorkflows(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all secrets available in a repository without revealing their encrypted values.
 * Anyone with write access to the repository can use this endpoint. GitHub Apps must have
 * the `secrets` permission to use this endpoint.
 */
class ListSecretsForRepo {
    ListSecretsForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListSecretsForRepo.fromRawJson(String str) => ListSecretsForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListSecretsForRepo.fromJson(Map<String, dynamic> json) => ListSecretsForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all self-hosted runners for a repository. Anyone with admin access to the
 * repository can use this endpoint. GitHub Apps must have the `administration` permission
 * to use this endpoint.
 */
class ListSelfHostedRunnersForRepo {
    ListSelfHostedRunnersForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListSelfHostedRunnersForRepo.fromRawJson(String str) => ListSelfHostedRunnersForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListSelfHostedRunnersForRepo.fromJson(Map<String, dynamic> json) => ListSelfHostedRunnersForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a redirect URL to download a plain text file of logs for a workflow job. This link
 * expires after 1 minute. Look for `Location:` in the response header to find the URL for
 * the download. Anyone with read access to the repository can use this endpoint. GitHub
 * Apps must have the `actions` permission to use this endpoint.
 *
 * Call this endpoint using the `-v` flag, which enables verbose output and allows you to
 * see the download URL in the header. To download the file into the current working
 * directory, specify the filename using the `-o` flag.
 */
class ListWorkflowJobLogs {
    ListWorkflowJobLogs({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListWorkflowJobLogs.fromRawJson(String str) => ListWorkflowJobLogs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListWorkflowJobLogs.fromJson(Map<String, dynamic> json) => ListWorkflowJobLogs(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists artifacts for a workflow run. Anyone with read access to the repository can use
 * this endpoint. GitHub Apps must have the `actions` permission to use this endpoint.
 */
class ListWorkflowRunArtifacts {
    ListWorkflowRunArtifacts({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListWorkflowRunArtifacts.fromRawJson(String str) => ListWorkflowRunArtifacts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListWorkflowRunArtifacts.fromJson(Map<String, dynamic> json) => ListWorkflowRunArtifacts(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a redirect URL to download an archive of log files for a workflow run. This link
 * expires after 1 minute. Look for `Location:` in the response header to find the URL for
 * the download. Anyone with read access to the repository can use this endpoint. GitHub
 * Apps must have the `actions` permission to use this endpoint.
 *
 * Call this endpoint using the `-v` flag, which enables verbose output and allows you to
 * see the download URL in the header. To download the file into the current working
 * directory, specify the filename using the `-o` flag.
 */
class ListWorkflowRunLogs {
    ListWorkflowRunLogs({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListWorkflowRunLogs.fromRawJson(String str) => ListWorkflowRunLogs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListWorkflowRunLogs.fromJson(Map<String, dynamic> json) => ListWorkflowRunLogs(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all workflow runs for a workflow. You can also replace `:workflow_id` with
 * `:workflow_file_name`. For example, you could use `main.yml`. You can use parameters to
 * narrow the list of results. For more information about using parameters, see
 * [Parameters](https://developer.github.com/v3/#parameters).
 *
 * Anyone with read access to the repository can use this endpoint.
 */
class ListWorkflowRuns {
    ListWorkflowRuns({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListWorkflowRuns.fromRawJson(String str) => ListWorkflowRuns.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListWorkflowRuns.fromJson(Map<String, dynamic> json) => ListWorkflowRuns(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Re-runs your workflow run using its `id`. Anyone with write access to the repository can
 * use this endpoint. GitHub Apps must have the `actions` permission to use this endpoint.
 */
class ReRunWorkflow {
    ReRunWorkflow({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReRunWorkflow.fromRawJson(String str) => ReRunWorkflow.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReRunWorkflow.fromJson(Map<String, dynamic> json) => ReRunWorkflow(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Forces the removal of a self-hosted runner from a repository. You can use this endpoint
 * to completely remove the runner when the machine you were using no longer exists. Anyone
 * with admin access to the repository can use this endpoint. GitHub Apps must have the
 * `administration` permission to use this endpoint.
 */
class RemoveSelfHostedRunner {
    RemoveSelfHostedRunner({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveSelfHostedRunner.fromRawJson(String str) => RemoveSelfHostedRunner.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveSelfHostedRunner.fromJson(Map<String, dynamic> json) => RemoveSelfHostedRunner(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ApiActivity {
    ApiActivity({
        this.checkStarringRepo,
        this.checkWatchingRepoLegacy,
        this.deleteRepoSubscription,
        this.deleteThreadSubscription,
        this.getRepoSubscription,
        this.getThread,
        this.getThreadSubscription,
        this.listEventsForOrg,
        this.listEventsForUser,
        this.listFeeds,
        this.listNotifications,
        this.listNotificationsForRepo,
        this.listPublicEvents,
        this.listPublicEventsForOrg,
        this.listPublicEventsForRepoNetwork,
        this.listPublicEventsForUser,
        this.listReceivedEventsForUser,
        this.listReceivedPublicEventsForUser,
        this.listRepoEvents,
        this.listReposStarredByAuthenticatedUser,
        this.listReposStarredByUser,
        this.listReposWatchedByUser,
        this.listStargazersForRepo,
        this.listWatchedReposForAuthenticatedUser,
        this.listWatchersForRepo,
        this.markAsRead,
        this.markNotificationsAsReadForRepo,
        this.markThreadAsRead,
        this.setRepoSubscription,
        this.setThreadSubscription,
        this.starRepo,
        this.stopWatchingRepoLegacy,
        this.unstarRepo,
        this.watchRepoLegacy,
    });

    final CheckStarringRepo checkStarringRepo;
    final CheckWatchingRepoLegacy checkWatchingRepoLegacy;
    final DeleteRepoSubscription deleteRepoSubscription;
    final DeleteThreadSubscription deleteThreadSubscription;
    final GetRepoSubscription getRepoSubscription;
    final GetThread getThread;
    final GetThreadSubscription getThreadSubscription;
    final ListEventsForOrg listEventsForOrg;
    final ListEventsForUser listEventsForUser;
    final ListFeeds listFeeds;
    final ListNotifications listNotifications;
    final ListNotificationsForRepo listNotificationsForRepo;
    final ListPublicEvents listPublicEvents;
    final ListPublicEventsForOrg listPublicEventsForOrg;
    final ListPublicEventsForRepoNetwork listPublicEventsForRepoNetwork;
    final ListPublicEventsForUser listPublicEventsForUser;
    final ListReceivedEventsForUser listReceivedEventsForUser;
    final ListReceivedPublicEventsForUser listReceivedPublicEventsForUser;
    final ListRepoEvents listRepoEvents;
    final ListReposStarredByAuthenticatedUser listReposStarredByAuthenticatedUser;
    final ListReposStarredByUser listReposStarredByUser;
    final ListReposWatchedByUser listReposWatchedByUser;
    final ListStargazersForRepo listStargazersForRepo;
    final ListWatchedReposForAuthenticatedUser listWatchedReposForAuthenticatedUser;
    final ListWatchersForRepo listWatchersForRepo;
    final MarkAsRead markAsRead;
    final MarkNotificationsAsReadForRepo markNotificationsAsReadForRepo;
    final MarkThreadAsRead markThreadAsRead;
    final SetRepoSubscription setRepoSubscription;
    final SetThreadSubscription setThreadSubscription;
    final StarRepo starRepo;
    final StopWatchingRepoLegacy stopWatchingRepoLegacy;
    final UnstarRepo unstarRepo;
    final WatchRepoLegacy watchRepoLegacy;

    factory ApiActivity.fromRawJson(String str) => ApiActivity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ApiActivity.fromJson(Map<String, dynamic> json) => ApiActivity(
        checkStarringRepo: json["checkStarringRepo"] == null ? null : CheckStarringRepo.fromJson(json["checkStarringRepo"]),
        checkWatchingRepoLegacy: json["checkWatchingRepoLegacy"] == null ? null : CheckWatchingRepoLegacy.fromJson(json["checkWatchingRepoLegacy"]),
        deleteRepoSubscription: json["deleteRepoSubscription"] == null ? null : DeleteRepoSubscription.fromJson(json["deleteRepoSubscription"]),
        deleteThreadSubscription: json["deleteThreadSubscription"] == null ? null : DeleteThreadSubscription.fromJson(json["deleteThreadSubscription"]),
        getRepoSubscription: json["getRepoSubscription"] == null ? null : GetRepoSubscription.fromJson(json["getRepoSubscription"]),
        getThread: json["getThread"] == null ? null : GetThread.fromJson(json["getThread"]),
        getThreadSubscription: json["getThreadSubscription"] == null ? null : GetThreadSubscription.fromJson(json["getThreadSubscription"]),
        listEventsForOrg: json["listEventsForOrg"] == null ? null : ListEventsForOrg.fromJson(json["listEventsForOrg"]),
        listEventsForUser: json["listEventsForUser"] == null ? null : ListEventsForUser.fromJson(json["listEventsForUser"]),
        listFeeds: json["listFeeds"] == null ? null : ListFeeds.fromJson(json["listFeeds"]),
        listNotifications: json["listNotifications"] == null ? null : ListNotifications.fromJson(json["listNotifications"]),
        listNotificationsForRepo: json["listNotificationsForRepo"] == null ? null : ListNotificationsForRepo.fromJson(json["listNotificationsForRepo"]),
        listPublicEvents: json["listPublicEvents"] == null ? null : ListPublicEvents.fromJson(json["listPublicEvents"]),
        listPublicEventsForOrg: json["listPublicEventsForOrg"] == null ? null : ListPublicEventsForOrg.fromJson(json["listPublicEventsForOrg"]),
        listPublicEventsForRepoNetwork: json["listPublicEventsForRepoNetwork"] == null ? null : ListPublicEventsForRepoNetwork.fromJson(json["listPublicEventsForRepoNetwork"]),
        listPublicEventsForUser: json["listPublicEventsForUser"] == null ? null : ListPublicEventsForUser.fromJson(json["listPublicEventsForUser"]),
        listReceivedEventsForUser: json["listReceivedEventsForUser"] == null ? null : ListReceivedEventsForUser.fromJson(json["listReceivedEventsForUser"]),
        listReceivedPublicEventsForUser: json["listReceivedPublicEventsForUser"] == null ? null : ListReceivedPublicEventsForUser.fromJson(json["listReceivedPublicEventsForUser"]),
        listRepoEvents: json["listRepoEvents"] == null ? null : ListRepoEvents.fromJson(json["listRepoEvents"]),
        listReposStarredByAuthenticatedUser: json["listReposStarredByAuthenticatedUser"] == null ? null : ListReposStarredByAuthenticatedUser.fromJson(json["listReposStarredByAuthenticatedUser"]),
        listReposStarredByUser: json["listReposStarredByUser"] == null ? null : ListReposStarredByUser.fromJson(json["listReposStarredByUser"]),
        listReposWatchedByUser: json["listReposWatchedByUser"] == null ? null : ListReposWatchedByUser.fromJson(json["listReposWatchedByUser"]),
        listStargazersForRepo: json["listStargazersForRepo"] == null ? null : ListStargazersForRepo.fromJson(json["listStargazersForRepo"]),
        listWatchedReposForAuthenticatedUser: json["listWatchedReposForAuthenticatedUser"] == null ? null : ListWatchedReposForAuthenticatedUser.fromJson(json["listWatchedReposForAuthenticatedUser"]),
        listWatchersForRepo: json["listWatchersForRepo"] == null ? null : ListWatchersForRepo.fromJson(json["listWatchersForRepo"]),
        markAsRead: json["markAsRead"] == null ? null : MarkAsRead.fromJson(json["markAsRead"]),
        markNotificationsAsReadForRepo: json["markNotificationsAsReadForRepo"] == null ? null : MarkNotificationsAsReadForRepo.fromJson(json["markNotificationsAsReadForRepo"]),
        markThreadAsRead: json["markThreadAsRead"] == null ? null : MarkThreadAsRead.fromJson(json["markThreadAsRead"]),
        setRepoSubscription: json["setRepoSubscription"] == null ? null : SetRepoSubscription.fromJson(json["setRepoSubscription"]),
        setThreadSubscription: json["setThreadSubscription"] == null ? null : SetThreadSubscription.fromJson(json["setThreadSubscription"]),
        starRepo: json["starRepo"] == null ? null : StarRepo.fromJson(json["starRepo"]),
        stopWatchingRepoLegacy: json["stopWatchingRepoLegacy"] == null ? null : StopWatchingRepoLegacy.fromJson(json["stopWatchingRepoLegacy"]),
        unstarRepo: json["unstarRepo"] == null ? null : UnstarRepo.fromJson(json["unstarRepo"]),
        watchRepoLegacy: json["watchRepoLegacy"] == null ? null : WatchRepoLegacy.fromJson(json["watchRepoLegacy"]),
    );

    Map<String, dynamic> toJson() => {
        "checkStarringRepo": checkStarringRepo == null ? null : checkStarringRepo.toJson(),
        "checkWatchingRepoLegacy": checkWatchingRepoLegacy == null ? null : checkWatchingRepoLegacy.toJson(),
        "deleteRepoSubscription": deleteRepoSubscription == null ? null : deleteRepoSubscription.toJson(),
        "deleteThreadSubscription": deleteThreadSubscription == null ? null : deleteThreadSubscription.toJson(),
        "getRepoSubscription": getRepoSubscription == null ? null : getRepoSubscription.toJson(),
        "getThread": getThread == null ? null : getThread.toJson(),
        "getThreadSubscription": getThreadSubscription == null ? null : getThreadSubscription.toJson(),
        "listEventsForOrg": listEventsForOrg == null ? null : listEventsForOrg.toJson(),
        "listEventsForUser": listEventsForUser == null ? null : listEventsForUser.toJson(),
        "listFeeds": listFeeds == null ? null : listFeeds.toJson(),
        "listNotifications": listNotifications == null ? null : listNotifications.toJson(),
        "listNotificationsForRepo": listNotificationsForRepo == null ? null : listNotificationsForRepo.toJson(),
        "listPublicEvents": listPublicEvents == null ? null : listPublicEvents.toJson(),
        "listPublicEventsForOrg": listPublicEventsForOrg == null ? null : listPublicEventsForOrg.toJson(),
        "listPublicEventsForRepoNetwork": listPublicEventsForRepoNetwork == null ? null : listPublicEventsForRepoNetwork.toJson(),
        "listPublicEventsForUser": listPublicEventsForUser == null ? null : listPublicEventsForUser.toJson(),
        "listReceivedEventsForUser": listReceivedEventsForUser == null ? null : listReceivedEventsForUser.toJson(),
        "listReceivedPublicEventsForUser": listReceivedPublicEventsForUser == null ? null : listReceivedPublicEventsForUser.toJson(),
        "listRepoEvents": listRepoEvents == null ? null : listRepoEvents.toJson(),
        "listReposStarredByAuthenticatedUser": listReposStarredByAuthenticatedUser == null ? null : listReposStarredByAuthenticatedUser.toJson(),
        "listReposStarredByUser": listReposStarredByUser == null ? null : listReposStarredByUser.toJson(),
        "listReposWatchedByUser": listReposWatchedByUser == null ? null : listReposWatchedByUser.toJson(),
        "listStargazersForRepo": listStargazersForRepo == null ? null : listStargazersForRepo.toJson(),
        "listWatchedReposForAuthenticatedUser": listWatchedReposForAuthenticatedUser == null ? null : listWatchedReposForAuthenticatedUser.toJson(),
        "listWatchersForRepo": listWatchersForRepo == null ? null : listWatchersForRepo.toJson(),
        "markAsRead": markAsRead == null ? null : markAsRead.toJson(),
        "markNotificationsAsReadForRepo": markNotificationsAsReadForRepo == null ? null : markNotificationsAsReadForRepo.toJson(),
        "markThreadAsRead": markThreadAsRead == null ? null : markThreadAsRead.toJson(),
        "setRepoSubscription": setRepoSubscription == null ? null : setRepoSubscription.toJson(),
        "setThreadSubscription": setThreadSubscription == null ? null : setThreadSubscription.toJson(),
        "starRepo": starRepo == null ? null : starRepo.toJson(),
        "stopWatchingRepoLegacy": stopWatchingRepoLegacy == null ? null : stopWatchingRepoLegacy.toJson(),
        "unstarRepo": unstarRepo == null ? null : unstarRepo.toJson(),
        "watchRepoLegacy": watchRepoLegacy == null ? null : watchRepoLegacy.toJson(),
    };
}

/**
 * Requires for the user to be authenticated.
 */
class CheckStarringRepo {
    CheckStarringRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckStarringRepo.fromRawJson(String str) => CheckStarringRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckStarringRepo.fromJson(Map<String, dynamic> json) => CheckStarringRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Requires for the user to be authenticated.
 */
class CheckWatchingRepoLegacy {
    CheckWatchingRepoLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckWatchingRepoLegacy.fromRawJson(String str) => CheckWatchingRepoLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckWatchingRepoLegacy.fromJson(Map<String, dynamic> json) => CheckWatchingRepoLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This endpoint should only be used to stop watching a repository. To control whether or
 * not you wish to receive notifications from a repository, [set the repository's
 * subscription
 * manually](https://developer.github.com/v3/activity/watching/#set-a-repository-subscription).
 */
class DeleteRepoSubscription {
    DeleteRepoSubscription({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteRepoSubscription.fromRawJson(String str) => DeleteRepoSubscription.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteRepoSubscription.fromJson(Map<String, dynamic> json) => DeleteRepoSubscription(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Mutes all future notifications for a conversation until you comment on the thread or get
 * **@mention**ed.
 */
class DeleteThreadSubscription {
    DeleteThreadSubscription({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteThreadSubscription.fromRawJson(String str) => DeleteThreadSubscription.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteThreadSubscription.fromJson(Map<String, dynamic> json) => DeleteThreadSubscription(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetRepoSubscription {
    GetRepoSubscription({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetRepoSubscription.fromRawJson(String str) => GetRepoSubscription.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetRepoSubscription.fromJson(Map<String, dynamic> json) => GetRepoSubscription(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetThread {
    GetThread({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetThread.fromRawJson(String str) => GetThread.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetThread.fromJson(Map<String, dynamic> json) => GetThread(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This checks to see if the current user is subscribed to a thread. You can also [get a
 * repository
 * subscription](https://developer.github.com/v3/activity/watching/#get-a-repository-subscription).
 *
 * Note that subscriptions are only generated if a user is participating in a
 * conversation--for example, they've replied to the thread, were **@mentioned**, or
 * manually subscribe to a thread.
 */
class GetThreadSubscription {
    GetThreadSubscription({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetThreadSubscription.fromRawJson(String str) => GetThreadSubscription.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetThreadSubscription.fromJson(Map<String, dynamic> json) => GetThreadSubscription(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This is the user's organization dashboard. You must be authenticated as the user to view
 * this.
 */
class ListEventsForOrg {
    ListEventsForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListEventsForOrg.fromRawJson(String str) => ListEventsForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListEventsForOrg.fromJson(Map<String, dynamic> json) => ListEventsForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * If you are authenticated as the given user, you will see your private events. Otherwise,
 * you'll only see public events.
 */
class ListEventsForUser {
    ListEventsForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListEventsForUser.fromRawJson(String str) => ListEventsForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListEventsForUser.fromJson(Map<String, dynamic> json) => ListEventsForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * GitHub provides several timeline resources in
 * [Atom](http://en.wikipedia.org/wiki/Atom_(standard)) format. The Feeds API lists all the
 * feeds available to the authenticated user:
 *
 * *   **Timeline**: The GitHub global public timeline
 * *   **User**: The public timeline for any user, using [URI
 * template](https://developer.github.com/v3/#hypermedia)
 * *   **Current user public**: The public timeline for the authenticated user
 * *   **Current user**: The private timeline for the authenticated user
 * *   **Current user actor**: The private timeline for activity created by the
 * authenticated user
 * *   **Current user organizations**: The private timeline for the organizations the
 * authenticated user is a member of.
 * *   **Security advisories**: A collection of public announcements that provide
 * information about security-related vulnerabilities in software on GitHub.
 *
 * **Note**: Private feeds are only returned when [authenticating via Basic
 * Auth](https://developer.github.com/v3/#basic-authentication) since current feed URIs use
 * the older, non revocable auth tokens.
 */
class ListFeeds {
    ListFeeds({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListFeeds.fromRawJson(String str) => ListFeeds.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListFeeds.fromJson(Map<String, dynamic> json) => ListFeeds(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all notifications for the current user, sorted by most recently updated.
 *
 * The following example uses the `since` parameter to list notifications that have been
 * updated after the specified time.
 */
class ListNotifications {
    ListNotifications({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListNotifications.fromRawJson(String str) => ListNotifications.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListNotifications.fromJson(Map<String, dynamic> json) => ListNotifications(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all notifications for the current user.
 */
class ListNotificationsForRepo {
    ListNotificationsForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListNotificationsForRepo.fromRawJson(String str) => ListNotificationsForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListNotificationsForRepo.fromJson(Map<String, dynamic> json) => ListNotificationsForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * We delay the public events feed by five minutes, which means the most recent event
 * returned by the public events API actually occurred at least five minutes ago.
 */
class ListPublicEvents {
    ListPublicEvents({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPublicEvents.fromRawJson(String str) => ListPublicEvents.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPublicEvents.fromJson(Map<String, dynamic> json) => ListPublicEvents(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListPublicEventsForOrg {
    ListPublicEventsForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPublicEventsForOrg.fromRawJson(String str) => ListPublicEventsForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPublicEventsForOrg.fromJson(Map<String, dynamic> json) => ListPublicEventsForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListPublicEventsForRepoNetwork {
    ListPublicEventsForRepoNetwork({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPublicEventsForRepoNetwork.fromRawJson(String str) => ListPublicEventsForRepoNetwork.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPublicEventsForRepoNetwork.fromJson(Map<String, dynamic> json) => ListPublicEventsForRepoNetwork(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListPublicEventsForUser {
    ListPublicEventsForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPublicEventsForUser.fromRawJson(String str) => ListPublicEventsForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPublicEventsForUser.fromJson(Map<String, dynamic> json) => ListPublicEventsForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * These are events that you've received by watching repos and following users. If you are
 * authenticated as the given user, you will see private events. Otherwise, you'll only see
 * public events.
 */
class ListReceivedEventsForUser {
    ListReceivedEventsForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReceivedEventsForUser.fromRawJson(String str) => ListReceivedEventsForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReceivedEventsForUser.fromJson(Map<String, dynamic> json) => ListReceivedEventsForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListReceivedPublicEventsForUser {
    ListReceivedPublicEventsForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReceivedPublicEventsForUser.fromRawJson(String str) => ListReceivedPublicEventsForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReceivedPublicEventsForUser.fromJson(Map<String, dynamic> json) => ListReceivedPublicEventsForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListRepoEvents {
    ListRepoEvents({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListRepoEvents.fromRawJson(String str) => ListRepoEvents.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListRepoEvents.fromJson(Map<String, dynamic> json) => ListRepoEvents(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * You can also find out _when_ stars were created by passing the following custom [media
 * type](https://developer.github.com/v3/media/) via the `Accept` header:
 */
class ListReposStarredByAuthenticatedUser {
    ListReposStarredByAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReposStarredByAuthenticatedUser.fromRawJson(String str) => ListReposStarredByAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReposStarredByAuthenticatedUser.fromJson(Map<String, dynamic> json) => ListReposStarredByAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * You can also find out _when_ stars were created by passing the following custom [media
 * type](https://developer.github.com/v3/media/) via the `Accept` header:
 */
class ListReposStarredByUser {
    ListReposStarredByUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReposStarredByUser.fromRawJson(String str) => ListReposStarredByUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReposStarredByUser.fromJson(Map<String, dynamic> json) => ListReposStarredByUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListReposWatchedByUser {
    ListReposWatchedByUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReposWatchedByUser.fromRawJson(String str) => ListReposWatchedByUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReposWatchedByUser.fromJson(Map<String, dynamic> json) => ListReposWatchedByUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * You can also find out _when_ stars were created by passing the following custom [media
 * type](https://developer.github.com/v3/media/) via the `Accept` header:
 */
class ListStargazersForRepo {
    ListStargazersForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListStargazersForRepo.fromRawJson(String str) => ListStargazersForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListStargazersForRepo.fromJson(Map<String, dynamic> json) => ListStargazersForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListWatchedReposForAuthenticatedUser {
    ListWatchedReposForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListWatchedReposForAuthenticatedUser.fromRawJson(String str) => ListWatchedReposForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListWatchedReposForAuthenticatedUser.fromJson(Map<String, dynamic> json) => ListWatchedReposForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListWatchersForRepo {
    ListWatchersForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListWatchersForRepo.fromRawJson(String str) => ListWatchersForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListWatchersForRepo.fromJson(Map<String, dynamic> json) => ListWatchersForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Marks a notification as "read" removes it from the [default view on
 * GitHub](https://github.com/notifications). If the number of notifications is too large to
 * complete in one request, you will receive a `202 Accepted` status and GitHub will run an
 * asynchronous process to mark notifications as "read." To check whether any "unread"
 * notifications remain, you can use the [List your
 * notifications](https://developer.github.com/v3/activity/notifications/#list-your-notifications)
 * endpoint and pass the query parameter `all=false`.
 */
class MarkAsRead {
    MarkAsRead({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory MarkAsRead.fromRawJson(String str) => MarkAsRead.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MarkAsRead.fromJson(Map<String, dynamic> json) => MarkAsRead(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Marks all notifications in a repository as "read" removes them from the [default view on
 * GitHub](https://github.com/notifications). If the number of notifications is too large to
 * complete in one request, you will receive a `202 Accepted` status and GitHub will run an
 * asynchronous process to mark notifications as "read." To check whether any "unread"
 * notifications remain, you can use the [List your notifications in a
 * repository](https://developer.github.com/v3/activity/notifications/#list-your-notifications-in-a-repository)
 * endpoint and pass the query parameter `all=false`.
 */
class MarkNotificationsAsReadForRepo {
    MarkNotificationsAsReadForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory MarkNotificationsAsReadForRepo.fromRawJson(String str) => MarkNotificationsAsReadForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MarkNotificationsAsReadForRepo.fromJson(Map<String, dynamic> json) => MarkNotificationsAsReadForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class MarkThreadAsRead {
    MarkThreadAsRead({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory MarkThreadAsRead.fromRawJson(String str) => MarkThreadAsRead.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MarkThreadAsRead.fromJson(Map<String, dynamic> json) => MarkThreadAsRead(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * If you would like to watch a repository, set `subscribed` to `true`. If you would like to
 * ignore notifications made within a repository, set `ignored` to `true`. If you would like
 * to stop watching a repository, [delete the repository's
 * subscription](https://developer.github.com/v3/activity/watching/#delete-a-repository-subscription)
 * completely.
 */
class SetRepoSubscription {
    SetRepoSubscription({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory SetRepoSubscription.fromRawJson(String str) => SetRepoSubscription.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SetRepoSubscription.fromJson(Map<String, dynamic> json) => SetRepoSubscription(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This lets you subscribe or unsubscribe from a conversation.
 */
class SetThreadSubscription {
    SetThreadSubscription({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory SetThreadSubscription.fromRawJson(String str) => SetThreadSubscription.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SetThreadSubscription.fromJson(Map<String, dynamic> json) => SetThreadSubscription(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Requires for the user to be authenticated.
 *
 * Note that you'll need to set `Content-Length` to zero when calling out to this endpoint.
 * For more information, see "[HTTP verbs](https://developer.github.com/v3/#http-verbs)."
 */
class StarRepo {
    StarRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory StarRepo.fromRawJson(String str) => StarRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StarRepo.fromJson(Map<String, dynamic> json) => StarRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Requires for the user to be authenticated.
 */
class StopWatchingRepoLegacy {
    StopWatchingRepoLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory StopWatchingRepoLegacy.fromRawJson(String str) => StopWatchingRepoLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StopWatchingRepoLegacy.fromJson(Map<String, dynamic> json) => StopWatchingRepoLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Requires for the user to be authenticated.
 */
class UnstarRepo {
    UnstarRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UnstarRepo.fromRawJson(String str) => UnstarRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UnstarRepo.fromJson(Map<String, dynamic> json) => UnstarRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Requires the user to be authenticated.
 *
 * Note that you'll need to set `Content-Length` to zero when calling out to this endpoint.
 * For more information, see "[HTTP verbs](https://developer.github.com/v3/#http-verbs)."
 */
class WatchRepoLegacy {
    WatchRepoLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory WatchRepoLegacy.fromRawJson(String str) => WatchRepoLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WatchRepoLegacy.fromJson(Map<String, dynamic> json) => WatchRepoLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Apps {
    Apps({
        this.addRepoToInstallation,
        this.checkAccountIsAssociatedWithAny,
        this.checkAccountIsAssociatedWithAnyStubbed,
        this.checkAuthorization,
        this.checkToken,
        this.createContentAttachment,
        this.createFromManifest,
        this.createInstallationToken,
        this.deleteAuthorization,
        this.deleteInstallation,
        this.deleteToken,
        this.findOrgInstallation,
        this.findRepoInstallation,
        this.findUserInstallation,
        this.getAuthenticated,
        this.getBySlug,
        this.getInstallation,
        this.getOrgInstallation,
        this.getRepoInstallation,
        this.getUserInstallation,
        this.listAccountsUserOrOrgOnPlan,
        this.listAccountsUserOrOrgOnPlanStubbed,
        this.listInstallationReposForAuthenticatedUser,
        this.listInstallations,
        this.listInstallationsForAuthenticatedUser,
        this.listMarketplacePurchasesForAuthenticatedUser,
        this.listMarketplacePurchasesForAuthenticatedUserStubbed,
        this.listPlans,
        this.listPlansStubbed,
        this.listRepos,
        this.removeRepoFromInstallation,
        this.resetAuthorization,
        this.resetToken,
        this.revokeAuthorizationForApplication,
        this.revokeGrantForApplication,
        this.revokeInstallationToken,
    });

    final AddRepoToInstallation addRepoToInstallation;
    final CheckAccountIsAssociatedWithAny checkAccountIsAssociatedWithAny;
    final CheckAccountIsAssociatedWithAnyStubbed checkAccountIsAssociatedWithAnyStubbed;
    final AppsCheckAuthorization checkAuthorization;
    final CheckToken checkToken;
    final CreateContentAttachment createContentAttachment;
    final CreateFromManifest createFromManifest;
    final CreateInstallationToken createInstallationToken;
    final AppsDeleteAuthorization deleteAuthorization;
    final DeleteInstallation deleteInstallation;
    final DeleteToken deleteToken;
    final FindOrgInstallation findOrgInstallation;
    final FindRepoInstallation findRepoInstallation;
    final FindUserInstallation findUserInstallation;
    final AppsGetAuthenticated getAuthenticated;
    final GetBySlug getBySlug;
    final GetInstallation getInstallation;
    final GetOrgInstallation getOrgInstallation;
    final GetRepoInstallation getRepoInstallation;
    final GetUserInstallation getUserInstallation;
    final ListAccountsUserOrOrgOnPlan listAccountsUserOrOrgOnPlan;
    final ListAccountsUserOrOrgOnPlanStubbed listAccountsUserOrOrgOnPlanStubbed;
    final ListInstallationReposForAuthenticatedUser listInstallationReposForAuthenticatedUser;
    final AppsListInstallations listInstallations;
    final ListInstallationsForAuthenticatedUser listInstallationsForAuthenticatedUser;
    final ListMarketplacePurchasesForAuthenticatedUser listMarketplacePurchasesForAuthenticatedUser;
    final ListMarketplacePurchasesForAuthenticatedUserStubbed listMarketplacePurchasesForAuthenticatedUserStubbed;
    final ListPlans listPlans;
    final ListPlansStubbed listPlansStubbed;
    final AppsListRepos listRepos;
    final RemoveRepoFromInstallation removeRepoFromInstallation;
    final AppsResetAuthorization resetAuthorization;
    final ResetToken resetToken;
    final AppsRevokeAuthorizationForApplication revokeAuthorizationForApplication;
    final AppsRevokeGrantForApplication revokeGrantForApplication;
    final RevokeInstallationToken revokeInstallationToken;

    factory Apps.fromRawJson(String str) => Apps.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Apps.fromJson(Map<String, dynamic> json) => Apps(
        addRepoToInstallation: json["addRepoToInstallation"] == null ? null : AddRepoToInstallation.fromJson(json["addRepoToInstallation"]),
        checkAccountIsAssociatedWithAny: json["checkAccountIsAssociatedWithAny"] == null ? null : CheckAccountIsAssociatedWithAny.fromJson(json["checkAccountIsAssociatedWithAny"]),
        checkAccountIsAssociatedWithAnyStubbed: json["checkAccountIsAssociatedWithAnyStubbed"] == null ? null : CheckAccountIsAssociatedWithAnyStubbed.fromJson(json["checkAccountIsAssociatedWithAnyStubbed"]),
        checkAuthorization: json["checkAuthorization"] == null ? null : AppsCheckAuthorization.fromJson(json["checkAuthorization"]),
        checkToken: json["checkToken"] == null ? null : CheckToken.fromJson(json["checkToken"]),
        createContentAttachment: json["createContentAttachment"] == null ? null : CreateContentAttachment.fromJson(json["createContentAttachment"]),
        createFromManifest: json["createFromManifest"] == null ? null : CreateFromManifest.fromJson(json["createFromManifest"]),
        createInstallationToken: json["createInstallationToken"] == null ? null : CreateInstallationToken.fromJson(json["createInstallationToken"]),
        deleteAuthorization: json["deleteAuthorization"] == null ? null : AppsDeleteAuthorization.fromJson(json["deleteAuthorization"]),
        deleteInstallation: json["deleteInstallation"] == null ? null : DeleteInstallation.fromJson(json["deleteInstallation"]),
        deleteToken: json["deleteToken"] == null ? null : DeleteToken.fromJson(json["deleteToken"]),
        findOrgInstallation: json["findOrgInstallation"] == null ? null : FindOrgInstallation.fromJson(json["findOrgInstallation"]),
        findRepoInstallation: json["findRepoInstallation"] == null ? null : FindRepoInstallation.fromJson(json["findRepoInstallation"]),
        findUserInstallation: json["findUserInstallation"] == null ? null : FindUserInstallation.fromJson(json["findUserInstallation"]),
        getAuthenticated: json["getAuthenticated"] == null ? null : AppsGetAuthenticated.fromJson(json["getAuthenticated"]),
        getBySlug: json["getBySlug"] == null ? null : GetBySlug.fromJson(json["getBySlug"]),
        getInstallation: json["getInstallation"] == null ? null : GetInstallation.fromJson(json["getInstallation"]),
        getOrgInstallation: json["getOrgInstallation"] == null ? null : GetOrgInstallation.fromJson(json["getOrgInstallation"]),
        getRepoInstallation: json["getRepoInstallation"] == null ? null : GetRepoInstallation.fromJson(json["getRepoInstallation"]),
        getUserInstallation: json["getUserInstallation"] == null ? null : GetUserInstallation.fromJson(json["getUserInstallation"]),
        listAccountsUserOrOrgOnPlan: json["listAccountsUserOrOrgOnPlan"] == null ? null : ListAccountsUserOrOrgOnPlan.fromJson(json["listAccountsUserOrOrgOnPlan"]),
        listAccountsUserOrOrgOnPlanStubbed: json["listAccountsUserOrOrgOnPlanStubbed"] == null ? null : ListAccountsUserOrOrgOnPlanStubbed.fromJson(json["listAccountsUserOrOrgOnPlanStubbed"]),
        listInstallationReposForAuthenticatedUser: json["listInstallationReposForAuthenticatedUser"] == null ? null : ListInstallationReposForAuthenticatedUser.fromJson(json["listInstallationReposForAuthenticatedUser"]),
        listInstallations: json["listInstallations"] == null ? null : AppsListInstallations.fromJson(json["listInstallations"]),
        listInstallationsForAuthenticatedUser: json["listInstallationsForAuthenticatedUser"] == null ? null : ListInstallationsForAuthenticatedUser.fromJson(json["listInstallationsForAuthenticatedUser"]),
        listMarketplacePurchasesForAuthenticatedUser: json["listMarketplacePurchasesForAuthenticatedUser"] == null ? null : ListMarketplacePurchasesForAuthenticatedUser.fromJson(json["listMarketplacePurchasesForAuthenticatedUser"]),
        listMarketplacePurchasesForAuthenticatedUserStubbed: json["listMarketplacePurchasesForAuthenticatedUserStubbed"] == null ? null : ListMarketplacePurchasesForAuthenticatedUserStubbed.fromJson(json["listMarketplacePurchasesForAuthenticatedUserStubbed"]),
        listPlans: json["listPlans"] == null ? null : ListPlans.fromJson(json["listPlans"]),
        listPlansStubbed: json["listPlansStubbed"] == null ? null : ListPlansStubbed.fromJson(json["listPlansStubbed"]),
        listRepos: json["listRepos"] == null ? null : AppsListRepos.fromJson(json["listRepos"]),
        removeRepoFromInstallation: json["removeRepoFromInstallation"] == null ? null : RemoveRepoFromInstallation.fromJson(json["removeRepoFromInstallation"]),
        resetAuthorization: json["resetAuthorization"] == null ? null : AppsResetAuthorization.fromJson(json["resetAuthorization"]),
        resetToken: json["resetToken"] == null ? null : ResetToken.fromJson(json["resetToken"]),
        revokeAuthorizationForApplication: json["revokeAuthorizationForApplication"] == null ? null : AppsRevokeAuthorizationForApplication.fromJson(json["revokeAuthorizationForApplication"]),
        revokeGrantForApplication: json["revokeGrantForApplication"] == null ? null : AppsRevokeGrantForApplication.fromJson(json["revokeGrantForApplication"]),
        revokeInstallationToken: json["revokeInstallationToken"] == null ? null : RevokeInstallationToken.fromJson(json["revokeInstallationToken"]),
    );

    Map<String, dynamic> toJson() => {
        "addRepoToInstallation": addRepoToInstallation == null ? null : addRepoToInstallation.toJson(),
        "checkAccountIsAssociatedWithAny": checkAccountIsAssociatedWithAny == null ? null : checkAccountIsAssociatedWithAny.toJson(),
        "checkAccountIsAssociatedWithAnyStubbed": checkAccountIsAssociatedWithAnyStubbed == null ? null : checkAccountIsAssociatedWithAnyStubbed.toJson(),
        "checkAuthorization": checkAuthorization == null ? null : checkAuthorization.toJson(),
        "checkToken": checkToken == null ? null : checkToken.toJson(),
        "createContentAttachment": createContentAttachment == null ? null : createContentAttachment.toJson(),
        "createFromManifest": createFromManifest == null ? null : createFromManifest.toJson(),
        "createInstallationToken": createInstallationToken == null ? null : createInstallationToken.toJson(),
        "deleteAuthorization": deleteAuthorization == null ? null : deleteAuthorization.toJson(),
        "deleteInstallation": deleteInstallation == null ? null : deleteInstallation.toJson(),
        "deleteToken": deleteToken == null ? null : deleteToken.toJson(),
        "findOrgInstallation": findOrgInstallation == null ? null : findOrgInstallation.toJson(),
        "findRepoInstallation": findRepoInstallation == null ? null : findRepoInstallation.toJson(),
        "findUserInstallation": findUserInstallation == null ? null : findUserInstallation.toJson(),
        "getAuthenticated": getAuthenticated == null ? null : getAuthenticated.toJson(),
        "getBySlug": getBySlug == null ? null : getBySlug.toJson(),
        "getInstallation": getInstallation == null ? null : getInstallation.toJson(),
        "getOrgInstallation": getOrgInstallation == null ? null : getOrgInstallation.toJson(),
        "getRepoInstallation": getRepoInstallation == null ? null : getRepoInstallation.toJson(),
        "getUserInstallation": getUserInstallation == null ? null : getUserInstallation.toJson(),
        "listAccountsUserOrOrgOnPlan": listAccountsUserOrOrgOnPlan == null ? null : listAccountsUserOrOrgOnPlan.toJson(),
        "listAccountsUserOrOrgOnPlanStubbed": listAccountsUserOrOrgOnPlanStubbed == null ? null : listAccountsUserOrOrgOnPlanStubbed.toJson(),
        "listInstallationReposForAuthenticatedUser": listInstallationReposForAuthenticatedUser == null ? null : listInstallationReposForAuthenticatedUser.toJson(),
        "listInstallations": listInstallations == null ? null : listInstallations.toJson(),
        "listInstallationsForAuthenticatedUser": listInstallationsForAuthenticatedUser == null ? null : listInstallationsForAuthenticatedUser.toJson(),
        "listMarketplacePurchasesForAuthenticatedUser": listMarketplacePurchasesForAuthenticatedUser == null ? null : listMarketplacePurchasesForAuthenticatedUser.toJson(),
        "listMarketplacePurchasesForAuthenticatedUserStubbed": listMarketplacePurchasesForAuthenticatedUserStubbed == null ? null : listMarketplacePurchasesForAuthenticatedUserStubbed.toJson(),
        "listPlans": listPlans == null ? null : listPlans.toJson(),
        "listPlansStubbed": listPlansStubbed == null ? null : listPlansStubbed.toJson(),
        "listRepos": listRepos == null ? null : listRepos.toJson(),
        "removeRepoFromInstallation": removeRepoFromInstallation == null ? null : removeRepoFromInstallation.toJson(),
        "resetAuthorization": resetAuthorization == null ? null : resetAuthorization.toJson(),
        "resetToken": resetToken == null ? null : resetToken.toJson(),
        "revokeAuthorizationForApplication": revokeAuthorizationForApplication == null ? null : revokeAuthorizationForApplication.toJson(),
        "revokeGrantForApplication": revokeGrantForApplication == null ? null : revokeGrantForApplication.toJson(),
        "revokeInstallationToken": revokeInstallationToken == null ? null : revokeInstallationToken.toJson(),
    };
}

/**
 * Add a single repository to an installation. The authenticated user must have admin access
 * to the repository.
 *
 * You must use a personal access token (which you can create via the [command
 * line](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)
 * or the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization))
 * or [Basic Authentication](https://developer.github.com/v3/auth/#basic-authentication) to
 * access this endpoint.
 */
class AddRepoToInstallation {
    AddRepoToInstallation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddRepoToInstallation.fromRawJson(String str) => AddRepoToInstallation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddRepoToInstallation.fromJson(Map<String, dynamic> json) => AddRepoToInstallation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Shows whether the user or organization account actively subscribes to a plan listed by
 * the authenticated GitHub App. When someone submits a plan change that won't be processed
 * until the end of their billing cycle, you will also see the upcoming pending change.
 *
 * GitHub Apps must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint. OAuth Apps must use [basic
 * authentication](https://developer.github.com/v3/auth/#basic-authentication) with their
 * client ID and client secret to access this endpoint.
 */
class CheckAccountIsAssociatedWithAny {
    CheckAccountIsAssociatedWithAny({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckAccountIsAssociatedWithAny.fromRawJson(String str) => CheckAccountIsAssociatedWithAny.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckAccountIsAssociatedWithAny.fromJson(Map<String, dynamic> json) => CheckAccountIsAssociatedWithAny(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Shows whether the user or organization account actively subscribes to a plan listed by
 * the authenticated GitHub App. When someone submits a plan change that won't be processed
 * until the end of their billing cycle, you will also see the upcoming pending change.
 *
 * GitHub Apps must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint. OAuth Apps must use [basic
 * authentication](https://developer.github.com/v3/auth/#basic-authentication) with their
 * client ID and client secret to access this endpoint.
 */
class CheckAccountIsAssociatedWithAnyStubbed {
    CheckAccountIsAssociatedWithAnyStubbed({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckAccountIsAssociatedWithAnyStubbed.fromRawJson(String str) => CheckAccountIsAssociatedWithAnyStubbed.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckAccountIsAssociatedWithAnyStubbed.fromJson(Map<String, dynamic> json) => CheckAccountIsAssociatedWithAnyStubbed(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will replace and discontinue OAuth endpoints containing
 * `access_token` in the path parameter. We are introducing new endpoints that allow you to
 * securely manage tokens for OAuth Apps by using `access_token` as an input parameter. For
 * more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * OAuth applications can use a special API method for checking OAuth token validity without
 * exceeding the normal rate limits for failed login attempts. Authentication works
 * differently with this particular endpoint. You must use [Basic
 * Authentication](https://developer.github.com/v3/auth#basic-authentication) when accessing
 * this endpoint, using the OAuth application's `client_id` and `client_secret` as the
 * username and password. Invalid tokens will return `404 NOT FOUND`.
 */
class AppsCheckAuthorization {
    AppsCheckAuthorization({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AppsCheckAuthorization.fromRawJson(String str) => AppsCheckAuthorization.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AppsCheckAuthorization.fromJson(Map<String, dynamic> json) => AppsCheckAuthorization(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * OAuth applications can use a special API method for checking OAuth token validity without
 * exceeding the normal rate limits for failed login attempts. Authentication works
 * differently with this particular endpoint. You must use [Basic
 * Authentication](https://developer.github.com/v3/auth#basic-authentication) to use this
 * endpoint, where the username is the OAuth application `client_id` and the password is its
 * `client_secret`. Invalid tokens will return `404 NOT FOUND`.
 */
class CheckToken {
    CheckToken({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckToken.fromRawJson(String str) => CheckToken.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckToken.fromJson(Map<String, dynamic> json) => CheckToken(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates an attachment under a content reference URL in the body or comment of an issue or
 * pull request. Use the `id` of the content reference from the [`content_reference`
 * event](https://developer.github.com/v3/activity/events/types/#contentreferenceevent) to
 * create an attachment.
 *
 * The app must create a content attachment within six hours of the content reference URL
 * being posted. See "[Using content
 * attachments](https://developer.github.com/apps/using-content-attachments/)" for details
 * about content attachments.
 *
 * You must use an [installation access
 * token](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-an-installation)
 * to access this endpoint.
 *
 * This example creates a content attachment for the domain `https://errors.ai/`.
 */
class CreateContentAttachment {
    CreateContentAttachment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateContentAttachment.fromRawJson(String str) => CreateContentAttachment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateContentAttachment.fromJson(Map<String, dynamic> json) => CreateContentAttachment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Use this endpoint to complete the handshake necessary when implementing the [GitHub App
 * Manifest
 * flow](https://developer.github.com/apps/building-github-apps/creating-github-apps-from-a-manifest/).
 * When you create a GitHub App with the manifest flow, you receive a temporary `code` used
 * to retrieve the GitHub App's `id`, `pem` (private key), and `webhook_secret`.
 */
class CreateFromManifest {
    CreateFromManifest({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateFromManifest.fromRawJson(String str) => CreateFromManifest.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateFromManifest.fromJson(Map<String, dynamic> json) => CreateFromManifest(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates an installation access token that enables a GitHub App to make authenticated API
 * requests for the app's installation on an organization or individual account.
 * Installation tokens expire one hour from the time you create them. Using an expired token
 * produces a status code of `401 - Unauthorized`, and requires creating a new installation
 * token. By default the installation token has access to all repositories that the
 * installation can access. To restrict the access to specific repositories, you can provide
 * the `repository_ids` when creating the token. When you omit `repository_ids`, the
 * response does not contain the `repositories` key.
 *
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 *
 * This example grants the token "Read and write" permission to `issues` and "Read"
 * permission to `contents`, and restricts the token's access to the repository with an `id`
 * of 1296269.
 */
class CreateInstallationToken {
    CreateInstallationToken({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateInstallationToken.fromRawJson(String str) => CreateInstallationToken.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateInstallationToken.fromJson(Map<String, dynamic> json) => CreateInstallationToken(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * OAuth application owners can revoke a grant for their OAuth application and a specific
 * user. You must use [Basic
 * Authentication](https://developer.github.com/v3/auth#basic-authentication) when accessing
 * this endpoint, using the OAuth application's `client_id` and `client_secret` as the
 * username and password. You must also provide a valid OAuth `access_token` as an input
 * parameter and the grant for the token's owner will be deleted.
 *
 * Deleting an OAuth application's grant will also delete all OAuth tokens associated with
 * the application for the user. Once deleted, the application will have no access to the
 * user's account and will no longer be listed on [the application authorizations settings
 * screen within GitHub](https://github.com/settings/applications#authorized).
 */
class AppsDeleteAuthorization {
    AppsDeleteAuthorization({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AppsDeleteAuthorization.fromRawJson(String str) => AppsDeleteAuthorization.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AppsDeleteAuthorization.fromJson(Map<String, dynamic> json) => AppsDeleteAuthorization(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Uninstalls a GitHub App on a user, organization, or business account.
 *
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 */
class DeleteInstallation {
    DeleteInstallation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteInstallation.fromRawJson(String str) => DeleteInstallation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteInstallation.fromJson(Map<String, dynamic> json) => DeleteInstallation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * OAuth application owners can revoke a single token for an OAuth application. You must use
 * [Basic Authentication](https://developer.github.com/v3/auth#basic-authentication) when
 * accessing this endpoint, using the OAuth application's `client_id` and `client_secret` as
 * the username and password.
 */
class DeleteToken {
    DeleteToken({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteToken.fromRawJson(String str) => DeleteToken.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteToken.fromJson(Map<String, dynamic> json) => DeleteToken(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Enables an authenticated GitHub App to find the organization's installation information.
 *
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 */
class FindOrgInstallation {
    FindOrgInstallation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory FindOrgInstallation.fromRawJson(String str) => FindOrgInstallation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FindOrgInstallation.fromJson(Map<String, dynamic> json) => FindOrgInstallation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Enables an authenticated GitHub App to find the repository's installation information.
 * The installation's account type will be either an organization or a user account,
 * depending which account the repository belongs to.
 *
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 */
class FindRepoInstallation {
    FindRepoInstallation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory FindRepoInstallation.fromRawJson(String str) => FindRepoInstallation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FindRepoInstallation.fromJson(Map<String, dynamic> json) => FindRepoInstallation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Enables an authenticated GitHub App to find the user’s installation information.
 *
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 */
class FindUserInstallation {
    FindUserInstallation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory FindUserInstallation.fromRawJson(String str) => FindUserInstallation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FindUserInstallation.fromJson(Map<String, dynamic> json) => FindUserInstallation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns the GitHub App associated with the authentication credentials used. To see how
 * many app installations are associated with this GitHub App, see the `installations_count`
 * in the response. For more details about your app's installations, see the "[List
 * installations](https://developer.github.com/v3/apps/#list-installations)" endpoint.
 *
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 */
class AppsGetAuthenticated {
    AppsGetAuthenticated({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AppsGetAuthenticated.fromRawJson(String str) => AppsGetAuthenticated.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AppsGetAuthenticated.fromJson(Map<String, dynamic> json) => AppsGetAuthenticated(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note**: The `:app_slug` is just the URL-friendly name of your GitHub App. You can find
 * this on the settings page for your GitHub App (e.g.,
 * `https://github.com/settings/apps/:app_slug`).
 *
 * If the GitHub App you specify is public, you can access this endpoint without
 * authenticating. If the GitHub App you specify is private, you must authenticate with a
 * [personal access
 * token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)
 * or an [installation access
 * token](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-an-installation)
 * to access this endpoint.
 */
class GetBySlug {
    GetBySlug({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetBySlug.fromRawJson(String str) => GetBySlug.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetBySlug.fromJson(Map<String, dynamic> json) => GetBySlug(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 */
class GetInstallation {
    GetInstallation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetInstallation.fromRawJson(String str) => GetInstallation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetInstallation.fromJson(Map<String, dynamic> json) => GetInstallation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Enables an authenticated GitHub App to find the organization's installation information.
 *
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 */
class GetOrgInstallation {
    GetOrgInstallation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetOrgInstallation.fromRawJson(String str) => GetOrgInstallation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetOrgInstallation.fromJson(Map<String, dynamic> json) => GetOrgInstallation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Enables an authenticated GitHub App to find the repository's installation information.
 * The installation's account type will be either an organization or a user account,
 * depending which account the repository belongs to.
 *
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 */
class GetRepoInstallation {
    GetRepoInstallation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetRepoInstallation.fromRawJson(String str) => GetRepoInstallation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetRepoInstallation.fromJson(Map<String, dynamic> json) => GetRepoInstallation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Enables an authenticated GitHub App to find the user’s installation information.
 *
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 */
class GetUserInstallation {
    GetUserInstallation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetUserInstallation.fromRawJson(String str) => GetUserInstallation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetUserInstallation.fromJson(Map<String, dynamic> json) => GetUserInstallation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns any accounts associated with a plan, including free plans. For per-seat pricing,
 * you see the list of accounts that have purchased the plan, including the number of seats
 * purchased. When someone submits a plan change that won't be processed until the end of
 * their billing cycle, you will also see the upcoming pending change.
 *
 * GitHub Apps must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint. OAuth Apps must use [basic
 * authentication](https://developer.github.com/v3/auth/#basic-authentication) with their
 * client ID and client secret to access this endpoint.
 */
class ListAccountsUserOrOrgOnPlan {
    ListAccountsUserOrOrgOnPlan({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListAccountsUserOrOrgOnPlan.fromRawJson(String str) => ListAccountsUserOrOrgOnPlan.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListAccountsUserOrOrgOnPlan.fromJson(Map<String, dynamic> json) => ListAccountsUserOrOrgOnPlan(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns any accounts associated with a plan, including free plans. For per-seat pricing,
 * you see the list of accounts that have purchased the plan, including the number of seats
 * purchased. When someone submits a plan change that won't be processed until the end of
 * their billing cycle, you will also see the upcoming pending change.
 *
 * GitHub Apps must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint. OAuth Apps must use [basic
 * authentication](https://developer.github.com/v3/auth/#basic-authentication) with their
 * client ID and client secret to access this endpoint.
 */
class ListAccountsUserOrOrgOnPlanStubbed {
    ListAccountsUserOrOrgOnPlanStubbed({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListAccountsUserOrOrgOnPlanStubbed.fromRawJson(String str) => ListAccountsUserOrOrgOnPlanStubbed.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListAccountsUserOrOrgOnPlanStubbed.fromJson(Map<String, dynamic> json) => ListAccountsUserOrOrgOnPlanStubbed(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List repositories that the authenticated user has explicit permission (`:read`, `:write`,
 * or `:admin`) to access for an installation.
 *
 * The authenticated user has explicit permission to access repositories they own,
 * repositories where they are a collaborator, and repositories that they can access through
 * an organization membership.
 *
 * You must use a [user-to-server OAuth access
 * token](https://developer.github.com/apps/building-github-apps/identifying-and-authorizing-users-for-github-apps/#identifying-users-on-your-site),
 * created for a user who has authorized your GitHub App, to access this endpoint.
 *
 * The access the user has to each repository is included in the hash under the
 * `permissions` key.
 */
class ListInstallationReposForAuthenticatedUser {
    ListInstallationReposForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListInstallationReposForAuthenticatedUser.fromRawJson(String str) => ListInstallationReposForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListInstallationReposForAuthenticatedUser.fromJson(Map<String, dynamic> json) => ListInstallationReposForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * You must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint.
 *
 * The permissions the installation has are included under the `permissions` key.
 */
class AppsListInstallations {
    AppsListInstallations({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AppsListInstallations.fromRawJson(String str) => AppsListInstallations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AppsListInstallations.fromJson(Map<String, dynamic> json) => AppsListInstallations(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists installations of your GitHub App that the authenticated user has explicit
 * permission (`:read`, `:write`, or `:admin`) to access.
 *
 * You must use a [user-to-server OAuth access
 * token](https://developer.github.com/apps/building-github-apps/identifying-and-authorizing-users-for-github-apps/#identifying-users-on-your-site),
 * created for a user who has authorized your GitHub App, to access this endpoint.
 *
 * The authenticated user has explicit permission to access repositories they own,
 * repositories where they are a collaborator, and repositories that they can access through
 * an organization membership.
 *
 * You can find the permissions for the installation under the `permissions` key.
 */
class ListInstallationsForAuthenticatedUser {
    ListInstallationsForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListInstallationsForAuthenticatedUser.fromRawJson(String str) => ListInstallationsForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListInstallationsForAuthenticatedUser.fromJson(Map<String, dynamic> json) => ListInstallationsForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns only active subscriptions. You must use a [user-to-server OAuth access
 * token](https://developer.github.com/apps/building-github-apps/identifying-and-authorizing-users-for-github-apps/#identifying-users-on-your-site),
 * created for a user who has authorized your GitHub App, to access this endpoint. . OAuth
 * Apps must authenticate using an [OAuth
 * token](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/).
 */
class ListMarketplacePurchasesForAuthenticatedUser {
    ListMarketplacePurchasesForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListMarketplacePurchasesForAuthenticatedUser.fromRawJson(String str) => ListMarketplacePurchasesForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListMarketplacePurchasesForAuthenticatedUser.fromJson(Map<String, dynamic> json) => ListMarketplacePurchasesForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns only active subscriptions. You must use a [user-to-server OAuth access
 * token](https://developer.github.com/apps/building-github-apps/identifying-and-authorizing-users-for-github-apps/#identifying-users-on-your-site),
 * created for a user who has authorized your GitHub App, to access this endpoint. . OAuth
 * Apps must authenticate using an [OAuth
 * token](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/).
 */
class ListMarketplacePurchasesForAuthenticatedUserStubbed {
    ListMarketplacePurchasesForAuthenticatedUserStubbed({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListMarketplacePurchasesForAuthenticatedUserStubbed.fromRawJson(String str) => ListMarketplacePurchasesForAuthenticatedUserStubbed.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListMarketplacePurchasesForAuthenticatedUserStubbed.fromJson(Map<String, dynamic> json) => ListMarketplacePurchasesForAuthenticatedUserStubbed(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * GitHub Apps must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint. OAuth Apps must use [basic
 * authentication](https://developer.github.com/v3/auth/#basic-authentication) with their
 * client ID and client secret to access this endpoint.
 */
class ListPlans {
    ListPlans({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPlans.fromRawJson(String str) => ListPlans.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPlans.fromJson(Map<String, dynamic> json) => ListPlans(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * GitHub Apps must use a
 * [JWT](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
 * to access this endpoint. OAuth Apps must use [basic
 * authentication](https://developer.github.com/v3/auth/#basic-authentication) with their
 * client ID and client secret to access this endpoint.
 */
class ListPlansStubbed {
    ListPlansStubbed({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPlansStubbed.fromRawJson(String str) => ListPlansStubbed.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPlansStubbed.fromJson(Map<String, dynamic> json) => ListPlansStubbed(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List repositories that an installation can access.
 *
 * You must use an [installation access
 * token](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-an-installation)
 * to access this endpoint.
 */
class AppsListRepos {
    AppsListRepos({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AppsListRepos.fromRawJson(String str) => AppsListRepos.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AppsListRepos.fromJson(Map<String, dynamic> json) => AppsListRepos(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Remove a single repository from an installation. The authenticated user must have admin
 * access to the repository.
 *
 * You must use a personal access token (which you can create via the [command
 * line](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)
 * or the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization))
 * or [Basic Authentication](https://developer.github.com/v3/auth/#basic-authentication) to
 * access this endpoint.
 */
class RemoveRepoFromInstallation {
    RemoveRepoFromInstallation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveRepoFromInstallation.fromRawJson(String str) => RemoveRepoFromInstallation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveRepoFromInstallation.fromJson(Map<String, dynamic> json) => RemoveRepoFromInstallation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will replace and discontinue OAuth endpoints containing
 * `access_token` in the path parameter. We are introducing new endpoints that allow you to
 * securely manage tokens for OAuth Apps by using `access_token` as an input parameter. For
 * more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * OAuth applications can use this API method to reset a valid OAuth token without end-user
 * involvement. Applications must save the "token" property in the response because changes
 * take effect immediately. You must use [Basic
 * Authentication](https://developer.github.com/v3/auth#basic-authentication) when accessing
 * this endpoint, using the OAuth application's `client_id` and `client_secret` as the
 * username and password. Invalid tokens will return `404 NOT FOUND`.
 */
class AppsResetAuthorization {
    AppsResetAuthorization({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AppsResetAuthorization.fromRawJson(String str) => AppsResetAuthorization.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AppsResetAuthorization.fromJson(Map<String, dynamic> json) => AppsResetAuthorization(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * OAuth applications can use this API method to reset a valid OAuth token without end-user
 * involvement. Applications must save the "token" property in the response because changes
 * take effect immediately. You must use [Basic
 * Authentication](https://developer.github.com/v3/auth#basic-authentication) when accessing
 * this endpoint, using the OAuth application's `client_id` and `client_secret` as the
 * username and password. Invalid tokens will return `404 NOT FOUND`.
 */
class ResetToken {
    ResetToken({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ResetToken.fromRawJson(String str) => ResetToken.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResetToken.fromJson(Map<String, dynamic> json) => ResetToken(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will replace and discontinue OAuth endpoints containing
 * `access_token` in the path parameter. We are introducing new endpoints that allow you to
 * securely manage tokens for OAuth Apps by using `access_token` as an input parameter. For
 * more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * OAuth application owners can revoke a single token for an OAuth application. You must use
 * [Basic Authentication](https://developer.github.com/v3/auth#basic-authentication) when
 * accessing this endpoint, using the OAuth application's `client_id` and `client_secret` as
 * the username and password.
 */
class AppsRevokeAuthorizationForApplication {
    AppsRevokeAuthorizationForApplication({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AppsRevokeAuthorizationForApplication.fromRawJson(String str) => AppsRevokeAuthorizationForApplication.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AppsRevokeAuthorizationForApplication.fromJson(Map<String, dynamic> json) => AppsRevokeAuthorizationForApplication(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will replace and discontinue OAuth endpoints containing
 * `access_token` in the path parameter. We are introducing new endpoints that allow you to
 * securely manage tokens for OAuth Apps by using `access_token` as an input parameter. For
 * more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * OAuth application owners can revoke a grant for their OAuth application and a specific
 * user. You must use [Basic
 * Authentication](https://developer.github.com/v3/auth#basic-authentication) when accessing
 * this endpoint, using the OAuth application's `client_id` and `client_secret` as the
 * username and password. You must also provide a valid token as `:access_token` and the
 * grant for the token's owner will be deleted.
 *
 * Deleting an OAuth application's grant will also delete all OAuth tokens associated with
 * the application for the user. Once deleted, the application will have no access to the
 * user's account and will no longer be listed on [the Applications settings page under
 * "Authorized OAuth Apps" on GitHub](https://github.com/settings/applications#authorized).
 */
class AppsRevokeGrantForApplication {
    AppsRevokeGrantForApplication({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AppsRevokeGrantForApplication.fromRawJson(String str) => AppsRevokeGrantForApplication.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AppsRevokeGrantForApplication.fromJson(Map<String, dynamic> json) => AppsRevokeGrantForApplication(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Revokes the installation token you're using to authenticate as an installation and access
 * this endpoint.
 *
 * Once an installation token is revoked, the token is invalidated and cannot be used. Other
 * endpoints that require the revoked installation token must have a new installation token
 * to work. You can create a new token using the "[Create a new installation
 * token](https://developer.github.com/v3/apps/#create-a-new-installation-token)" endpoint.
 *
 * You must use an [installation access
 * token](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-an-installation)
 * to access this endpoint.
 */
class RevokeInstallationToken {
    RevokeInstallationToken({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RevokeInstallationToken.fromRawJson(String str) => RevokeInstallationToken.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RevokeInstallationToken.fromJson(Map<String, dynamic> json) => RevokeInstallationToken(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Checks {
    Checks({
        this.create,
        this.createSuite,
        this.checksGet,
        this.getSuite,
        this.listAnnotations,
        this.listForRef,
        this.listForSuite,
        this.listSuitesForRef,
        this.rerequestSuite,
        this.setSuitesPreferences,
        this.update,
    });

    final ChecksCreate create;
    final CreateSuite createSuite;
    final ChecksGet checksGet;
    final GetSuite getSuite;
    final ListAnnotations listAnnotations;
    final ListForRef listForRef;
    final ListForSuite listForSuite;
    final ListSuitesForRef listSuitesForRef;
    final RerequestSuite rerequestSuite;
    final SetSuitesPreferences setSuitesPreferences;
    final ChecksUpdate update;

    factory Checks.fromRawJson(String str) => Checks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Checks.fromJson(Map<String, dynamic> json) => Checks(
        create: json["create"] == null ? null : ChecksCreate.fromJson(json["create"]),
        createSuite: json["createSuite"] == null ? null : CreateSuite.fromJson(json["createSuite"]),
        checksGet: json["get"] == null ? null : ChecksGet.fromJson(json["get"]),
        getSuite: json["getSuite"] == null ? null : GetSuite.fromJson(json["getSuite"]),
        listAnnotations: json["listAnnotations"] == null ? null : ListAnnotations.fromJson(json["listAnnotations"]),
        listForRef: json["listForRef"] == null ? null : ListForRef.fromJson(json["listForRef"]),
        listForSuite: json["listForSuite"] == null ? null : ListForSuite.fromJson(json["listForSuite"]),
        listSuitesForRef: json["listSuitesForRef"] == null ? null : ListSuitesForRef.fromJson(json["listSuitesForRef"]),
        rerequestSuite: json["rerequestSuite"] == null ? null : RerequestSuite.fromJson(json["rerequestSuite"]),
        setSuitesPreferences: json["setSuitesPreferences"] == null ? null : SetSuitesPreferences.fromJson(json["setSuitesPreferences"]),
        update: json["update"] == null ? null : ChecksUpdate.fromJson(json["update"]),
    );

    Map<String, dynamic> toJson() => {
        "create": create == null ? null : create.toJson(),
        "createSuite": createSuite == null ? null : createSuite.toJson(),
        "get": checksGet == null ? null : checksGet.toJson(),
        "getSuite": getSuite == null ? null : getSuite.toJson(),
        "listAnnotations": listAnnotations == null ? null : listAnnotations.toJson(),
        "listForRef": listForRef == null ? null : listForRef.toJson(),
        "listForSuite": listForSuite == null ? null : listForSuite.toJson(),
        "listSuitesForRef": listSuitesForRef == null ? null : listSuitesForRef.toJson(),
        "rerequestSuite": rerequestSuite == null ? null : rerequestSuite.toJson(),
        "setSuitesPreferences": setSuitesPreferences == null ? null : setSuitesPreferences.toJson(),
        "update": update == null ? null : update.toJson(),
    };
}

/**
 * **Note:** The Checks API only looks for pushes in the repository where the check suite or
 * check run were created. Pushes to a branch in a forked repository are not detected and
 * return an empty `pull_requests` array.
 *
 * Gets a single check run using its `id`. GitHub Apps must have the `checks:read`
 * permission on a private repository or pull access to a public repository to get check
 * runs. OAuth Apps and authenticated users must have the `repo` scope to get check runs in
 * a private repository.
 */
class ChecksGet {
    ChecksGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ChecksGet.fromRawJson(String str) => ChecksGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChecksGet.fromJson(Map<String, dynamic> json) => ChecksGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** The Checks API only looks for pushes in the repository where the check suite or
 * check run were created. Pushes to a branch in a forked repository are not detected and
 * return an empty `pull_requests` array.
 *
 * Creates a new check run for a specific commit in a repository. Your GitHub App must have
 * the `checks:write` permission to create check runs.
 */
class ChecksCreate {
    ChecksCreate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ChecksCreate.fromRawJson(String str) => ChecksCreate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChecksCreate.fromJson(Map<String, dynamic> json) => ChecksCreate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** The Checks API only looks for pushes in the repository where the check suite or
 * check run were created. Pushes to a branch in a forked repository are not detected and
 * return an empty `pull_requests` array and a `null` value for `head_branch`.
 *
 * By default, check suites are automatically created when you create a [check
 * run](https://developer.github.com/v3/checks/runs/). You only need to use this endpoint
 * for manually creating check suites when you've disabled automatic creation using "[Set
 * preferences for check suites on a
 * repository](https://developer.github.com/v3/checks/suites/#set-preferences-for-check-suites-on-a-repository)".
 * Your GitHub App must have the `checks:write` permission to create check suites.
 */
class CreateSuite {
    CreateSuite({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateSuite.fromRawJson(String str) => CreateSuite.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateSuite.fromJson(Map<String, dynamic> json) => CreateSuite(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** The Checks API only looks for pushes in the repository where the check suite or
 * check run were created. Pushes to a branch in a forked repository are not detected and
 * return an empty `pull_requests` array and a `null` value for `head_branch`.
 *
 * Gets a single check suite using its `id`. GitHub Apps must have the `checks:read`
 * permission on a private repository or pull access to a public repository to get check
 * suites. OAuth Apps and authenticated users must have the `repo` scope to get check suites
 * in a private repository.
 */
class GetSuite {
    GetSuite({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetSuite.fromRawJson(String str) => GetSuite.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetSuite.fromJson(Map<String, dynamic> json) => GetSuite(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists annotations for a check run using the annotation `id`. GitHub Apps must have the
 * `checks:read` permission on a private repository or pull access to a public repository to
 * get annotations for a check run. OAuth Apps and authenticated users must have the `repo`
 * scope to get annotations for a check run in a private repository.
 */
class ListAnnotations {
    ListAnnotations({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListAnnotations.fromRawJson(String str) => ListAnnotations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListAnnotations.fromJson(Map<String, dynamic> json) => ListAnnotations(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** The Checks API only looks for pushes in the repository where the check suite or
 * check run were created. Pushes to a branch in a forked repository are not detected and
 * return an empty `pull_requests` array.
 *
 * Lists check runs for a commit ref. The `ref` can be a SHA, branch name, or a tag name.
 * GitHub Apps must have the `checks:read` permission on a private repository or pull access
 * to a public repository to get check runs. OAuth Apps and authenticated users must have
 * the `repo` scope to get check runs in a private repository.
 */
class ListForRef {
    ListForRef({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForRef.fromRawJson(String str) => ListForRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForRef.fromJson(Map<String, dynamic> json) => ListForRef(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** The Checks API only looks for pushes in the repository where the check suite or
 * check run were created. Pushes to a branch in a forked repository are not detected and
 * return an empty `pull_requests` array.
 *
 * Lists check runs for a check suite using its `id`. GitHub Apps must have the
 * `checks:read` permission on a private repository or pull access to a public repository to
 * get check runs. OAuth Apps and authenticated users must have the `repo` scope to get
 * check runs in a private repository.
 */
class ListForSuite {
    ListForSuite({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForSuite.fromRawJson(String str) => ListForSuite.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForSuite.fromJson(Map<String, dynamic> json) => ListForSuite(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** The Checks API only looks for pushes in the repository where the check suite or
 * check run were created. Pushes to a branch in a forked repository are not detected and
 * return an empty `pull_requests` array and a `null` value for `head_branch`.
 *
 * Lists check suites for a commit `ref`. The `ref` can be a SHA, branch name, or a tag
 * name. GitHub Apps must have the `checks:read` permission on a private repository or pull
 * access to a public repository to list check suites. OAuth Apps and authenticated users
 * must have the `repo` scope to get check suites in a private repository.
 */
class ListSuitesForRef {
    ListSuitesForRef({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListSuitesForRef.fromRawJson(String str) => ListSuitesForRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListSuitesForRef.fromJson(Map<String, dynamic> json) => ListSuitesForRef(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Triggers GitHub to rerequest an existing check suite, without pushing new code to a
 * repository. This endpoint will trigger the [`check_suite`
 * webhook](https://developer.github.com/v3/activity/events/types/#checksuiteevent) event
 * with the action `rerequested`. When a check suite is `rerequested`, its `status` is reset
 * to `queued` and the `conclusion` is cleared.
 *
 * To rerequest a check suite, your GitHub App must have the `checks:read` permission on a
 * private repository or pull access to a public repository.
 */
class RerequestSuite {
    RerequestSuite({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RerequestSuite.fromRawJson(String str) => RerequestSuite.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RerequestSuite.fromJson(Map<String, dynamic> json) => RerequestSuite(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Changes the default automatic flow when creating check suites. By default, the
 * CheckSuiteEvent is automatically created each time code is pushed to a repository. When
 * you disable the automatic creation of check suites, you can manually [Create a check
 * suite](https://developer.github.com/v3/checks/suites/#create-a-check-suite). You must
 * have admin permissions in the repository to set preferences for check suites.
 */
class SetSuitesPreferences {
    SetSuitesPreferences({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory SetSuitesPreferences.fromRawJson(String str) => SetSuitesPreferences.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SetSuitesPreferences.fromJson(Map<String, dynamic> json) => SetSuitesPreferences(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** The Checks API only looks for pushes in the repository where the check suite or
 * check run were created. Pushes to a branch in a forked repository are not detected and
 * return an empty `pull_requests` array.
 *
 * Updates a check run for a specific commit in a repository. Your GitHub App must have the
 * `checks:write` permission to edit check runs.
 */
class ChecksUpdate {
    ChecksUpdate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ChecksUpdate.fromRawJson(String str) => ChecksUpdate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChecksUpdate.fromJson(Map<String, dynamic> json) => ChecksUpdate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class CodesOfConduct {
    CodesOfConduct({
        this.getConductCode,
        this.getForRepo,
        this.listConductCodes,
    });

    final GetConductCode getConductCode;
    final CodesOfConductGetForRepo getForRepo;
    final ListConductCodes listConductCodes;

    factory CodesOfConduct.fromRawJson(String str) => CodesOfConduct.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CodesOfConduct.fromJson(Map<String, dynamic> json) => CodesOfConduct(
        getConductCode: json["getConductCode"] == null ? null : GetConductCode.fromJson(json["getConductCode"]),
        getForRepo: json["getForRepo"] == null ? null : CodesOfConductGetForRepo.fromJson(json["getForRepo"]),
        listConductCodes: json["listConductCodes"] == null ? null : ListConductCodes.fromJson(json["listConductCodes"]),
    );

    Map<String, dynamic> toJson() => {
        "getConductCode": getConductCode == null ? null : getConductCode.toJson(),
        "getForRepo": getForRepo == null ? null : getForRepo.toJson(),
        "listConductCodes": listConductCodes == null ? null : listConductCodes.toJson(),
    };
}

class GetConductCode {
    GetConductCode({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetConductCode.fromRawJson(String str) => GetConductCode.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetConductCode.fromJson(Map<String, dynamic> json) => GetConductCode(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This method returns the contents of the repository's code of conduct file, if one is
 * detected.
 */
class CodesOfConductGetForRepo {
    CodesOfConductGetForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CodesOfConductGetForRepo.fromRawJson(String str) => CodesOfConductGetForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CodesOfConductGetForRepo.fromJson(Map<String, dynamic> json) => CodesOfConductGetForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListConductCodes {
    ListConductCodes({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListConductCodes.fromRawJson(String str) => ListConductCodes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListConductCodes.fromJson(Map<String, dynamic> json) => ListConductCodes(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Emojis {
    Emojis({
        this.emojisGet,
    });

    final EmojisGet emojisGet;

    factory Emojis.fromRawJson(String str) => Emojis.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Emojis.fromJson(Map<String, dynamic> json) => Emojis(
        emojisGet: json["get"] == null ? null : EmojisGet.fromJson(json["get"]),
    );

    Map<String, dynamic> toJson() => {
        "get": emojisGet == null ? null : emojisGet.toJson(),
    };
}

/**
 * Lists all the emojis available to use on GitHub.
 */
class EmojisGet {
    EmojisGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory EmojisGet.fromRawJson(String str) => EmojisGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EmojisGet.fromJson(Map<String, dynamic> json) => EmojisGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Gists {
    Gists({
        this.checkIsStarred,
        this.create,
        this.createComment,
        this.delete,
        this.deleteComment,
        this.fork,
        this.gistsGet,
        this.getComment,
        this.getRevision,
        this.list,
        this.listComments,
        this.listCommits,
        this.listForks,
        this.listPublic,
        this.listPublicForUser,
        this.listStarred,
        this.star,
        this.unstar,
        this.update,
        this.updateComment,
    });

    final CheckIsStarred checkIsStarred;
    final GistsCreate create;
    final GistsCreateComment createComment;
    final GistsDelete delete;
    final GistsDeleteComment deleteComment;
    final Fork fork;
    final GistsGet gistsGet;
    final GistsGetComment getComment;
    final GetRevision getRevision;
    final GistsList list;
    final GistsListComments listComments;
    final GistsListCommits listCommits;
    final GistsListForks listForks;
    final GistsListPublic listPublic;
    final ListPublicForUser listPublicForUser;
    final ListStarred listStarred;
    final Star star;
    final Unstar unstar;
    final GistsUpdate update;
    final GistsUpdateComment updateComment;

    factory Gists.fromRawJson(String str) => Gists.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Gists.fromJson(Map<String, dynamic> json) => Gists(
        checkIsStarred: json["checkIsStarred"] == null ? null : CheckIsStarred.fromJson(json["checkIsStarred"]),
        create: json["create"] == null ? null : GistsCreate.fromJson(json["create"]),
        createComment: json["createComment"] == null ? null : GistsCreateComment.fromJson(json["createComment"]),
        delete: json["delete"] == null ? null : GistsDelete.fromJson(json["delete"]),
        deleteComment: json["deleteComment"] == null ? null : GistsDeleteComment.fromJson(json["deleteComment"]),
        fork: json["fork"] == null ? null : Fork.fromJson(json["fork"]),
        gistsGet: json["get"] == null ? null : GistsGet.fromJson(json["get"]),
        getComment: json["getComment"] == null ? null : GistsGetComment.fromJson(json["getComment"]),
        getRevision: json["getRevision"] == null ? null : GetRevision.fromJson(json["getRevision"]),
        list: json["list"] == null ? null : GistsList.fromJson(json["list"]),
        listComments: json["listComments"] == null ? null : GistsListComments.fromJson(json["listComments"]),
        listCommits: json["listCommits"] == null ? null : GistsListCommits.fromJson(json["listCommits"]),
        listForks: json["listForks"] == null ? null : GistsListForks.fromJson(json["listForks"]),
        listPublic: json["listPublic"] == null ? null : GistsListPublic.fromJson(json["listPublic"]),
        listPublicForUser: json["listPublicForUser"] == null ? null : ListPublicForUser.fromJson(json["listPublicForUser"]),
        listStarred: json["listStarred"] == null ? null : ListStarred.fromJson(json["listStarred"]),
        star: json["star"] == null ? null : Star.fromJson(json["star"]),
        unstar: json["unstar"] == null ? null : Unstar.fromJson(json["unstar"]),
        update: json["update"] == null ? null : GistsUpdate.fromJson(json["update"]),
        updateComment: json["updateComment"] == null ? null : GistsUpdateComment.fromJson(json["updateComment"]),
    );

    Map<String, dynamic> toJson() => {
        "checkIsStarred": checkIsStarred == null ? null : checkIsStarred.toJson(),
        "create": create == null ? null : create.toJson(),
        "createComment": createComment == null ? null : createComment.toJson(),
        "delete": delete == null ? null : delete.toJson(),
        "deleteComment": deleteComment == null ? null : deleteComment.toJson(),
        "fork": fork == null ? null : fork.toJson(),
        "get": gistsGet == null ? null : gistsGet.toJson(),
        "getComment": getComment == null ? null : getComment.toJson(),
        "getRevision": getRevision == null ? null : getRevision.toJson(),
        "list": list == null ? null : list.toJson(),
        "listComments": listComments == null ? null : listComments.toJson(),
        "listCommits": listCommits == null ? null : listCommits.toJson(),
        "listForks": listForks == null ? null : listForks.toJson(),
        "listPublic": listPublic == null ? null : listPublic.toJson(),
        "listPublicForUser": listPublicForUser == null ? null : listPublicForUser.toJson(),
        "listStarred": listStarred == null ? null : listStarred.toJson(),
        "star": star == null ? null : star.toJson(),
        "unstar": unstar == null ? null : unstar.toJson(),
        "update": update == null ? null : update.toJson(),
        "updateComment": updateComment == null ? null : updateComment.toJson(),
    };
}

class CheckIsStarred {
    CheckIsStarred({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckIsStarred.fromRawJson(String str) => CheckIsStarred.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckIsStarred.fromJson(Map<String, dynamic> json) => CheckIsStarred(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Allows you to add a new gist with one or more files.
 *
 * **Note:** Don't name your files "gistfile" with a numerical suffix. This is the format of
 * the automatic naming scheme that Gist uses internally.
 */
class GistsCreate {
    GistsCreate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsCreate.fromRawJson(String str) => GistsCreate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsCreate.fromJson(Map<String, dynamic> json) => GistsCreate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GistsCreateComment {
    GistsCreateComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsCreateComment.fromRawJson(String str) => GistsCreateComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsCreateComment.fromJson(Map<String, dynamic> json) => GistsCreateComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GistsDelete {
    GistsDelete({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsDelete.fromRawJson(String str) => GistsDelete.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsDelete.fromJson(Map<String, dynamic> json) => GistsDelete(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GistsDeleteComment {
    GistsDeleteComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsDeleteComment.fromRawJson(String str) => GistsDeleteComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsDeleteComment.fromJson(Map<String, dynamic> json) => GistsDeleteComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note**: This was previously `/gists/:gist_id/fork`.
 */
class Fork {
    Fork({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Fork.fromRawJson(String str) => Fork.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Fork.fromJson(Map<String, dynamic> json) => Fork(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GistsGetComment {
    GistsGetComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsGetComment.fromRawJson(String str) => GistsGetComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsGetComment.fromJson(Map<String, dynamic> json) => GistsGetComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetRevision {
    GetRevision({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetRevision.fromRawJson(String str) => GetRevision.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetRevision.fromJson(Map<String, dynamic> json) => GetRevision(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GistsGet {
    GistsGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsGet.fromRawJson(String str) => GistsGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsGet.fromJson(Map<String, dynamic> json) => GistsGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GistsList {
    GistsList({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsList.fromRawJson(String str) => GistsList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsList.fromJson(Map<String, dynamic> json) => GistsList(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GistsListComments {
    GistsListComments({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsListComments.fromRawJson(String str) => GistsListComments.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsListComments.fromJson(Map<String, dynamic> json) => GistsListComments(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GistsListCommits {
    GistsListCommits({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsListCommits.fromRawJson(String str) => GistsListCommits.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsListCommits.fromJson(Map<String, dynamic> json) => GistsListCommits(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GistsListForks {
    GistsListForks({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsListForks.fromRawJson(String str) => GistsListForks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsListForks.fromJson(Map<String, dynamic> json) => GistsListForks(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all public gists sorted by most recently updated to least recently updated.
 *
 * Note: With [pagination](https://developer.github.com/v3/#pagination), you can fetch up to
 * 3000 gists. For example, you can fetch 100 pages with 30 gists per page or 30 pages with
 * 100 gists per page.
 */
class GistsListPublic {
    GistsListPublic({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsListPublic.fromRawJson(String str) => GistsListPublic.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsListPublic.fromJson(Map<String, dynamic> json) => GistsListPublic(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListPublicForUser {
    ListPublicForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPublicForUser.fromRawJson(String str) => ListPublicForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPublicForUser.fromJson(Map<String, dynamic> json) => ListPublicForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List the authenticated user's starred gists:
 */
class ListStarred {
    ListStarred({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListStarred.fromRawJson(String str) => ListStarred.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListStarred.fromJson(Map<String, dynamic> json) => ListStarred(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Note that you'll need to set `Content-Length` to zero when calling out to this endpoint.
 * For more information, see "[HTTP verbs](https://developer.github.com/v3/#http-verbs)."
 */
class Star {
    Star({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Star.fromRawJson(String str) => Star.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Star.fromJson(Map<String, dynamic> json) => Star(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Unstar {
    Unstar({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Unstar.fromRawJson(String str) => Unstar.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Unstar.fromJson(Map<String, dynamic> json) => Unstar(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Allows you to update or delete a gist file and rename gist files. Files from the previous
 * version of the gist that aren't explicitly changed during an edit are unchanged.
 */
class GistsUpdate {
    GistsUpdate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsUpdate.fromRawJson(String str) => GistsUpdate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsUpdate.fromJson(Map<String, dynamic> json) => GistsUpdate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GistsUpdateComment {
    GistsUpdateComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GistsUpdateComment.fromRawJson(String str) => GistsUpdateComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GistsUpdateComment.fromJson(Map<String, dynamic> json) => GistsUpdateComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Git {
    Git({
        this.createBlob,
        this.createCommit,
        this.createRef,
        this.createTag,
        this.createTree,
        this.deleteRef,
        this.getBlob,
        this.getCommit,
        this.getRef,
        this.getTag,
        this.getTree,
        this.listMatchingRefs,
        this.listRefs,
        this.updateRef,
    });

    final CreateBlob createBlob;
    final CreateCommit createCommit;
    final CreateRef createRef;
    final CreateTag createTag;
    final CreateTree createTree;
    final DeleteRef deleteRef;
    final GetBlob getBlob;
    final GitGetCommit getCommit;
    final GetRef getRef;
    final GetTag getTag;
    final GetTree getTree;
    final ListMatchingRefs listMatchingRefs;
    final ListRefs listRefs;
    final UpdateRef updateRef;

    factory Git.fromRawJson(String str) => Git.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Git.fromJson(Map<String, dynamic> json) => Git(
        createBlob: json["createBlob"] == null ? null : CreateBlob.fromJson(json["createBlob"]),
        createCommit: json["createCommit"] == null ? null : CreateCommit.fromJson(json["createCommit"]),
        createRef: json["createRef"] == null ? null : CreateRef.fromJson(json["createRef"]),
        createTag: json["createTag"] == null ? null : CreateTag.fromJson(json["createTag"]),
        createTree: json["createTree"] == null ? null : CreateTree.fromJson(json["createTree"]),
        deleteRef: json["deleteRef"] == null ? null : DeleteRef.fromJson(json["deleteRef"]),
        getBlob: json["getBlob"] == null ? null : GetBlob.fromJson(json["getBlob"]),
        getCommit: json["getCommit"] == null ? null : GitGetCommit.fromJson(json["getCommit"]),
        getRef: json["getRef"] == null ? null : GetRef.fromJson(json["getRef"]),
        getTag: json["getTag"] == null ? null : GetTag.fromJson(json["getTag"]),
        getTree: json["getTree"] == null ? null : GetTree.fromJson(json["getTree"]),
        listMatchingRefs: json["listMatchingRefs"] == null ? null : ListMatchingRefs.fromJson(json["listMatchingRefs"]),
        listRefs: json["listRefs"] == null ? null : ListRefs.fromJson(json["listRefs"]),
        updateRef: json["updateRef"] == null ? null : UpdateRef.fromJson(json["updateRef"]),
    );

    Map<String, dynamic> toJson() => {
        "createBlob": createBlob == null ? null : createBlob.toJson(),
        "createCommit": createCommit == null ? null : createCommit.toJson(),
        "createRef": createRef == null ? null : createRef.toJson(),
        "createTag": createTag == null ? null : createTag.toJson(),
        "createTree": createTree == null ? null : createTree.toJson(),
        "deleteRef": deleteRef == null ? null : deleteRef.toJson(),
        "getBlob": getBlob == null ? null : getBlob.toJson(),
        "getCommit": getCommit == null ? null : getCommit.toJson(),
        "getRef": getRef == null ? null : getRef.toJson(),
        "getTag": getTag == null ? null : getTag.toJson(),
        "getTree": getTree == null ? null : getTree.toJson(),
        "listMatchingRefs": listMatchingRefs == null ? null : listMatchingRefs.toJson(),
        "listRefs": listRefs == null ? null : listRefs.toJson(),
        "updateRef": updateRef == null ? null : updateRef.toJson(),
    };
}

class CreateBlob {
    CreateBlob({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateBlob.fromRawJson(String str) => CreateBlob.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateBlob.fromJson(Map<String, dynamic> json) => CreateBlob(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a new Git [commit
 * object](https://git-scm.com/book/en/v1/Git-Internals-Git-Objects#Commit-Objects).
 *
 * In this example, the payload of the signature would be:
 *
 *
 *
 * **Signature verification object**
 *
 * The response will include a `verification` object that describes the result of verifying
 * the commit's signature. The following fields are included in the `verification` object:
 *
 * These are the possible values for `reason` in the `verification` object:
 *
 * | Value                    |
 * Description
 * |
 * | ------------------------ |
 * ---------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `expired_key`            | The key that made the signature is
 * expired.
 * |
 * | `not_signing_key`        | The "signing" flag is not among the usage flags in the GPG
 * key that made the signature.                                           |
 * | `gpgverify_error`        | There was an error communicating with the signature
 * verification service.                                                         |
 * | `gpgverify_unavailable`  | The signature verification service is currently
 * unavailable.                                                                      |
 * | `unsigned`               | The object does not include a
 * signature.
 * |
 * | `unknown_signature_type` | A non-PGP signature was found in the
 * commit.
 * |
 * | `no_user`                | No user was associated with the `committer` email address in
 * the commit.                                                          |
 * | `unverified_email`       | The `committer` email address in the commit was associated
 * with a user, but the email address is not verified on her/his account. |
 * | `bad_email`              | The `committer` email address in the commit is not included
 * in the identities of the PGP key that made the signature.             |
 * | `unknown_key`            | The key that made the signature has not been registered with
 * any user's account.                                                  |
 * | `malformed_signature`    | There was an error parsing the
 * signature.
 * |
 * | `invalid`                | The signature could not be cryptographically verified using
 * the key whose key-id was found in the signature.                      |
 * | `valid`                  | None of the above errors applied, so the signature is
 * considered to be verified.                                                  |
 */
class CreateCommit {
    CreateCommit({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateCommit.fromRawJson(String str) => CreateCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateCommit.fromJson(Map<String, dynamic> json) => CreateCommit(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a reference for your repository. You are unable to create new references for
 * empty repositories, even if the commit SHA-1 hash used exists. Empty repositories are
 * repositories without branches.
 */
class CreateRef {
    CreateRef({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateRef.fromRawJson(String str) => CreateRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateRef.fromJson(Map<String, dynamic> json) => CreateRef(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Note that creating a tag object does not create the reference that makes a tag in Git. If
 * you want to create an annotated tag in Git, you have to do this call to create the tag
 * object, and then [create](https://developer.github.com/v3/git/refs/#create-a-reference)
 * the `refs/tags/[tag]` reference. If you want to create a lightweight tag, you only have
 * to [create](https://developer.github.com/v3/git/refs/#create-a-reference) the tag
 * reference - this call would be unnecessary.
 *
 * **Signature verification object**
 *
 * The response will include a `verification` object that describes the result of verifying
 * the commit's signature. The following fields are included in the `verification` object:
 *
 * These are the possible values for `reason` in the `verification` object:
 *
 * | Value                    |
 * Description
 * |
 * | ------------------------ |
 * ---------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `expired_key`            | The key that made the signature is
 * expired.
 * |
 * | `not_signing_key`        | The "signing" flag is not among the usage flags in the GPG
 * key that made the signature.                                           |
 * | `gpgverify_error`        | There was an error communicating with the signature
 * verification service.                                                         |
 * | `gpgverify_unavailable`  | The signature verification service is currently
 * unavailable.                                                                      |
 * | `unsigned`               | The object does not include a
 * signature.
 * |
 * | `unknown_signature_type` | A non-PGP signature was found in the
 * commit.
 * |
 * | `no_user`                | No user was associated with the `committer` email address in
 * the commit.                                                          |
 * | `unverified_email`       | The `committer` email address in the commit was associated
 * with a user, but the email address is not verified on her/his account. |
 * | `bad_email`              | The `committer` email address in the commit is not included
 * in the identities of the PGP key that made the signature.             |
 * | `unknown_key`            | The key that made the signature has not been registered with
 * any user's account.                                                  |
 * | `malformed_signature`    | There was an error parsing the
 * signature.
 * |
 * | `invalid`                | The signature could not be cryptographically verified using
 * the key whose key-id was found in the signature.                      |
 * | `valid`                  | None of the above errors applied, so the signature is
 * considered to be verified.                                                  |
 */
class CreateTag {
    CreateTag({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateTag.fromRawJson(String str) => CreateTag.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateTag.fromJson(Map<String, dynamic> json) => CreateTag(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The tree creation API accepts nested entries. If you specify both a tree and a nested
 * path modifying that tree, this endpoint will overwrite the contents of the tree with the
 * new path contents, and create a new tree structure.
 *
 * If you use this endpoint to add, delete, or modify the file contents in a tree, you will
 * need to commit the tree and then update a branch to point to the commit. For more
 * information see "[Create a
 * commit](https://developer.github.com/v3/git/commits/#create-a-commit)" and "[Update a
 * reference](https://developer.github.com/v3/git/refs/#update-a-reference)."
 */
class CreateTree {
    CreateTree({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateTree.fromRawJson(String str) => CreateTree.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateTree.fromJson(Map<String, dynamic> json) => CreateTree(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * ```
 * * DELETE /repos/octocat/Hello-World/git/refs/heads/feature-a
 * * ```
 *
 * ```
 * * DELETE /repos/octocat/Hello-World/git/refs/tags/v1.0
 * * ```
 */
class DeleteRef {
    DeleteRef({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteRef.fromRawJson(String str) => DeleteRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteRef.fromJson(Map<String, dynamic> json) => DeleteRef(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The `content` in the response will always be Base64 encoded.
 *
 * _Note_: This API supports blobs up to 100 megabytes in size.
 */
class GetBlob {
    GetBlob({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetBlob.fromRawJson(String str) => GetBlob.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetBlob.fromJson(Map<String, dynamic> json) => GetBlob(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a Git [commit
 * object](https://git-scm.com/book/en/v1/Git-Internals-Git-Objects#Commit-Objects).
 *
 * **Signature verification object**
 *
 * The response will include a `verification` object that describes the result of verifying
 * the commit's signature. The following fields are included in the `verification` object:
 *
 * These are the possible values for `reason` in the `verification` object:
 *
 * | Value                    |
 * Description
 * |
 * | ------------------------ |
 * ---------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `expired_key`            | The key that made the signature is
 * expired.
 * |
 * | `not_signing_key`        | The "signing" flag is not among the usage flags in the GPG
 * key that made the signature.                                           |
 * | `gpgverify_error`        | There was an error communicating with the signature
 * verification service.                                                         |
 * | `gpgverify_unavailable`  | The signature verification service is currently
 * unavailable.                                                                      |
 * | `unsigned`               | The object does not include a
 * signature.
 * |
 * | `unknown_signature_type` | A non-PGP signature was found in the
 * commit.
 * |
 * | `no_user`                | No user was associated with the `committer` email address in
 * the commit.                                                          |
 * | `unverified_email`       | The `committer` email address in the commit was associated
 * with a user, but the email address is not verified on her/his account. |
 * | `bad_email`              | The `committer` email address in the commit is not included
 * in the identities of the PGP key that made the signature.             |
 * | `unknown_key`            | The key that made the signature has not been registered with
 * any user's account.                                                  |
 * | `malformed_signature`    | There was an error parsing the
 * signature.
 * |
 * | `invalid`                | The signature could not be cryptographically verified using
 * the key whose key-id was found in the signature.                      |
 * | `valid`                  | None of the above errors applied, so the signature is
 * considered to be verified.                                                  |
 */
class GitGetCommit {
    GitGetCommit({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GitGetCommit.fromRawJson(String str) => GitGetCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitGetCommit.fromJson(Map<String, dynamic> json) => GitGetCommit(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns a single reference from your Git database. The `:ref` in the URL must be
 * formatted as `heads/<branch name>` for branches and `tags/<tag name>` for tags. If the
 * `:ref` doesn't match an existing ref, a `404` is returned.
 *
 * **Note:** You need to explicitly [request a pull
 * request](https://developer.github.com/v3/pulls/#get-a-single-pull-request) to trigger a
 * test merge commit, which checks the mergeability of pull requests. For more information,
 * see "[Checking mergeability of pull
 * requests](https://developer.github.com/v3/git/#checking-mergeability-of-pull-requests)".
 *
 * To get the reference for a branch named `skunkworkz/featureA`, the endpoint route is:
 */
class GetRef {
    GetRef({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetRef.fromRawJson(String str) => GetRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetRef.fromJson(Map<String, dynamic> json) => GetRef(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Signature verification object**
 *
 * The response will include a `verification` object that describes the result of verifying
 * the commit's signature. The following fields are included in the `verification` object:
 *
 * These are the possible values for `reason` in the `verification` object:
 *
 * | Value                    |
 * Description
 * |
 * | ------------------------ |
 * ---------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `expired_key`            | The key that made the signature is
 * expired.
 * |
 * | `not_signing_key`        | The "signing" flag is not among the usage flags in the GPG
 * key that made the signature.                                           |
 * | `gpgverify_error`        | There was an error communicating with the signature
 * verification service.                                                         |
 * | `gpgverify_unavailable`  | The signature verification service is currently
 * unavailable.                                                                      |
 * | `unsigned`               | The object does not include a
 * signature.
 * |
 * | `unknown_signature_type` | A non-PGP signature was found in the
 * commit.
 * |
 * | `no_user`                | No user was associated with the `committer` email address in
 * the commit.                                                          |
 * | `unverified_email`       | The `committer` email address in the commit was associated
 * with a user, but the email address is not verified on her/his account. |
 * | `bad_email`              | The `committer` email address in the commit is not included
 * in the identities of the PGP key that made the signature.             |
 * | `unknown_key`            | The key that made the signature has not been registered with
 * any user's account.                                                  |
 * | `malformed_signature`    | There was an error parsing the
 * signature.
 * |
 * | `invalid`                | The signature could not be cryptographically verified using
 * the key whose key-id was found in the signature.                      |
 * | `valid`                  | None of the above errors applied, so the signature is
 * considered to be verified.                                                  |
 */
class GetTag {
    GetTag({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetTag.fromRawJson(String str) => GetTag.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetTag.fromJson(Map<String, dynamic> json) => GetTag(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns a single tree using the SHA1 value for that tree.
 *
 * If `truncated` is `true` in the response then the number of items in the `tree` array
 * exceeded our maximum limit. If you need to fetch more items, you can clone the repository
 * and iterate over the Git data locally.
 */
class GetTree {
    GetTree({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetTree.fromRawJson(String str) => GetTree.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetTree.fromJson(Map<String, dynamic> json) => GetTree(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns an array of references from your Git database that match the supplied name. The
 * `:ref` in the URL must be formatted as `heads/<branch name>` for branches and `tags/<tag
 * name>` for tags. If the `:ref` doesn't exist in the repository, but existing refs start
 * with `:ref`, they will be returned as an array.
 *
 * When you use this endpoint without providing a `:ref`, it will return an array of all the
 * references from your Git database, including notes and stashes if they exist on the
 * server. Anything in the namespace is returned, not just `heads` and `tags`.
 *
 * **Note:** You need to explicitly [request a pull
 * request](https://developer.github.com/v3/pulls/#get-a-single-pull-request) to trigger a
 * test merge commit, which checks the mergeability of pull requests. For more information,
 * see "[Checking mergeability of pull
 * requests](https://developer.github.com/v3/git/#checking-mergeability-of-pull-requests)".
 *
 * If you request matching references for a branch named `feature` but the branch `feature`
 * doesn't exist, the response can still include other matching head refs that start with
 * the word `feature`, such as `featureA` and `featureB`.
 */
class ListMatchingRefs {
    ListMatchingRefs({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListMatchingRefs.fromRawJson(String str) => ListMatchingRefs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListMatchingRefs.fromJson(Map<String, dynamic> json) => ListMatchingRefs(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns an array of all the references from your Git database, including notes and
 * stashes if they exist on the server. Anything in the namespace is returned, not just
 * `heads` and `tags`. If there are no references to list, a `404` is returned.
 */
class ListRefs {
    ListRefs({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListRefs.fromRawJson(String str) => ListRefs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListRefs.fromJson(Map<String, dynamic> json) => ListRefs(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class UpdateRef {
    UpdateRef({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateRef.fromRawJson(String str) => UpdateRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateRef.fromJson(Map<String, dynamic> json) => UpdateRef(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Gitignore {
    Gitignore({
        this.getTemplate,
        this.listTemplates,
    });

    final GetTemplate getTemplate;
    final ListTemplates listTemplates;

    factory Gitignore.fromRawJson(String str) => Gitignore.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Gitignore.fromJson(Map<String, dynamic> json) => Gitignore(
        getTemplate: json["getTemplate"] == null ? null : GetTemplate.fromJson(json["getTemplate"]),
        listTemplates: json["listTemplates"] == null ? null : ListTemplates.fromJson(json["listTemplates"]),
    );

    Map<String, dynamic> toJson() => {
        "getTemplate": getTemplate == null ? null : getTemplate.toJson(),
        "listTemplates": listTemplates == null ? null : listTemplates.toJson(),
    };
}

/**
 * The API also allows fetching the source of a single template.
 *
 * Use the raw [media type](https://developer.github.com/v3/media/) to get the raw contents.
 */
class GetTemplate {
    GetTemplate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetTemplate.fromRawJson(String str) => GetTemplate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetTemplate.fromJson(Map<String, dynamic> json) => GetTemplate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all templates available to pass as an option when [creating a
 * repository](https://developer.github.com/v3/repos/#create).
 */
class ListTemplates {
    ListTemplates({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListTemplates.fromRawJson(String str) => ListTemplates.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListTemplates.fromJson(Map<String, dynamic> json) => ListTemplates(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Interactions {
    Interactions({
        this.addOrUpdateRestrictionsForOrg,
        this.addOrUpdateRestrictionsForRepo,
        this.getRestrictionsForOrg,
        this.getRestrictionsForRepo,
        this.removeRestrictionsForOrg,
        this.removeRestrictionsForRepo,
    });

    final AddOrUpdateRestrictionsForOrg addOrUpdateRestrictionsForOrg;
    final AddOrUpdateRestrictionsForRepo addOrUpdateRestrictionsForRepo;
    final GetRestrictionsForOrg getRestrictionsForOrg;
    final GetRestrictionsForRepo getRestrictionsForRepo;
    final RemoveRestrictionsForOrg removeRestrictionsForOrg;
    final RemoveRestrictionsForRepo removeRestrictionsForRepo;

    factory Interactions.fromRawJson(String str) => Interactions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Interactions.fromJson(Map<String, dynamic> json) => Interactions(
        addOrUpdateRestrictionsForOrg: json["addOrUpdateRestrictionsForOrg"] == null ? null : AddOrUpdateRestrictionsForOrg.fromJson(json["addOrUpdateRestrictionsForOrg"]),
        addOrUpdateRestrictionsForRepo: json["addOrUpdateRestrictionsForRepo"] == null ? null : AddOrUpdateRestrictionsForRepo.fromJson(json["addOrUpdateRestrictionsForRepo"]),
        getRestrictionsForOrg: json["getRestrictionsForOrg"] == null ? null : GetRestrictionsForOrg.fromJson(json["getRestrictionsForOrg"]),
        getRestrictionsForRepo: json["getRestrictionsForRepo"] == null ? null : GetRestrictionsForRepo.fromJson(json["getRestrictionsForRepo"]),
        removeRestrictionsForOrg: json["removeRestrictionsForOrg"] == null ? null : RemoveRestrictionsForOrg.fromJson(json["removeRestrictionsForOrg"]),
        removeRestrictionsForRepo: json["removeRestrictionsForRepo"] == null ? null : RemoveRestrictionsForRepo.fromJson(json["removeRestrictionsForRepo"]),
    );

    Map<String, dynamic> toJson() => {
        "addOrUpdateRestrictionsForOrg": addOrUpdateRestrictionsForOrg == null ? null : addOrUpdateRestrictionsForOrg.toJson(),
        "addOrUpdateRestrictionsForRepo": addOrUpdateRestrictionsForRepo == null ? null : addOrUpdateRestrictionsForRepo.toJson(),
        "getRestrictionsForOrg": getRestrictionsForOrg == null ? null : getRestrictionsForOrg.toJson(),
        "getRestrictionsForRepo": getRestrictionsForRepo == null ? null : getRestrictionsForRepo.toJson(),
        "removeRestrictionsForOrg": removeRestrictionsForOrg == null ? null : removeRestrictionsForOrg.toJson(),
        "removeRestrictionsForRepo": removeRestrictionsForRepo == null ? null : removeRestrictionsForRepo.toJson(),
    };
}

/**
 * Temporarily restricts interactions to certain GitHub users in any public repository in
 * the given organization. You must be an organization owner to set these restrictions.
 */
class AddOrUpdateRestrictionsForOrg {
    AddOrUpdateRestrictionsForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddOrUpdateRestrictionsForOrg.fromRawJson(String str) => AddOrUpdateRestrictionsForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddOrUpdateRestrictionsForOrg.fromJson(Map<String, dynamic> json) => AddOrUpdateRestrictionsForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Temporarily restricts interactions to certain GitHub users within the given repository.
 * You must have owner or admin access to set restrictions.
 */
class AddOrUpdateRestrictionsForRepo {
    AddOrUpdateRestrictionsForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddOrUpdateRestrictionsForRepo.fromRawJson(String str) => AddOrUpdateRestrictionsForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddOrUpdateRestrictionsForRepo.fromJson(Map<String, dynamic> json) => AddOrUpdateRestrictionsForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Shows which group of GitHub users can interact with this organization and when the
 * restriction expires. If there are no restrictions, you will see an empty response.
 */
class GetRestrictionsForOrg {
    GetRestrictionsForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetRestrictionsForOrg.fromRawJson(String str) => GetRestrictionsForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetRestrictionsForOrg.fromJson(Map<String, dynamic> json) => GetRestrictionsForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Shows which group of GitHub users can interact with this repository and when the
 * restriction expires. If there are no restrictions, you will see an empty response.
 */
class GetRestrictionsForRepo {
    GetRestrictionsForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetRestrictionsForRepo.fromRawJson(String str) => GetRestrictionsForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetRestrictionsForRepo.fromJson(Map<String, dynamic> json) => GetRestrictionsForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Removes all interaction restrictions from public repositories in the given organization.
 * You must be an organization owner to remove restrictions.
 */
class RemoveRestrictionsForOrg {
    RemoveRestrictionsForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveRestrictionsForOrg.fromRawJson(String str) => RemoveRestrictionsForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveRestrictionsForOrg.fromJson(Map<String, dynamic> json) => RemoveRestrictionsForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Removes all interaction restrictions from the given repository. You must have owner or
 * admin access to remove restrictions.
 */
class RemoveRestrictionsForRepo {
    RemoveRestrictionsForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveRestrictionsForRepo.fromRawJson(String str) => RemoveRestrictionsForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveRestrictionsForRepo.fromJson(Map<String, dynamic> json) => RemoveRestrictionsForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ApiIssues {
    ApiIssues({
        this.addAssignees,
        this.addLabels,
        this.checkAssignee,
        this.create,
        this.createComment,
        this.createLabel,
        this.createMilestone,
        this.deleteComment,
        this.deleteLabel,
        this.deleteMilestone,
        this.issuesGet,
        this.getComment,
        this.getEvent,
        this.getLabel,
        this.getMilestone,
        this.list,
        this.listAssignees,
        this.listComments,
        this.listCommentsForRepo,
        this.listEvents,
        this.listEventsForRepo,
        this.listEventsForTimeline,
        this.listForAuthenticatedUser,
        this.listForOrg,
        this.listForRepo,
        this.listLabelsForMilestone,
        this.listLabelsForRepo,
        this.listLabelsOnIssue,
        this.listMilestonesForRepo,
        this.lock,
        this.removeAssignees,
        this.removeLabel,
        this.removeLabels,
        this.replaceLabels,
        this.unlock,
        this.update,
        this.updateComment,
        this.updateLabel,
        this.updateMilestone,
    });

    final AddAssignees addAssignees;
    final AddLabels addLabels;
    final CheckAssignee checkAssignee;
    final IssuesCreate create;
    final IssuesCreateComment createComment;
    final CreateLabel createLabel;
    final CreateMilestone createMilestone;
    final IssuesDeleteComment deleteComment;
    final DeleteLabel deleteLabel;
    final DeleteMilestone deleteMilestone;
    final IssuesGet issuesGet;
    final IssuesGetComment getComment;
    final GetEvent getEvent;
    final GetLabel getLabel;
    final GetMilestone getMilestone;
    final IssuesList list;
    final ListAssignees listAssignees;
    final IssuesListComments listComments;
    final IssuesListCommentsForRepo listCommentsForRepo;
    final ListEvents listEvents;
    final ListEventsForRepo listEventsForRepo;
    final ListEventsForTimeline listEventsForTimeline;
    final IssuesListForAuthenticatedUser listForAuthenticatedUser;
    final IssuesListForOrg listForOrg;
    final IssuesListForRepo listForRepo;
    final ListLabelsForMilestone listLabelsForMilestone;
    final ListLabelsForRepo listLabelsForRepo;
    final ListLabelsOnIssue listLabelsOnIssue;
    final ListMilestonesForRepo listMilestonesForRepo;
    final Lock lock;
    final RemoveAssignees removeAssignees;
    final RemoveLabel removeLabel;
    final RemoveLabels removeLabels;
    final ReplaceLabels replaceLabels;
    final Unlock unlock;
    final IssuesUpdate update;
    final IssuesUpdateComment updateComment;
    final UpdateLabel updateLabel;
    final UpdateMilestone updateMilestone;

    factory ApiIssues.fromRawJson(String str) => ApiIssues.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ApiIssues.fromJson(Map<String, dynamic> json) => ApiIssues(
        addAssignees: json["addAssignees"] == null ? null : AddAssignees.fromJson(json["addAssignees"]),
        addLabels: json["addLabels"] == null ? null : AddLabels.fromJson(json["addLabels"]),
        checkAssignee: json["checkAssignee"] == null ? null : CheckAssignee.fromJson(json["checkAssignee"]),
        create: json["create"] == null ? null : IssuesCreate.fromJson(json["create"]),
        createComment: json["createComment"] == null ? null : IssuesCreateComment.fromJson(json["createComment"]),
        createLabel: json["createLabel"] == null ? null : CreateLabel.fromJson(json["createLabel"]),
        createMilestone: json["createMilestone"] == null ? null : CreateMilestone.fromJson(json["createMilestone"]),
        deleteComment: json["deleteComment"] == null ? null : IssuesDeleteComment.fromJson(json["deleteComment"]),
        deleteLabel: json["deleteLabel"] == null ? null : DeleteLabel.fromJson(json["deleteLabel"]),
        deleteMilestone: json["deleteMilestone"] == null ? null : DeleteMilestone.fromJson(json["deleteMilestone"]),
        issuesGet: json["get"] == null ? null : IssuesGet.fromJson(json["get"]),
        getComment: json["getComment"] == null ? null : IssuesGetComment.fromJson(json["getComment"]),
        getEvent: json["getEvent"] == null ? null : GetEvent.fromJson(json["getEvent"]),
        getLabel: json["getLabel"] == null ? null : GetLabel.fromJson(json["getLabel"]),
        getMilestone: json["getMilestone"] == null ? null : GetMilestone.fromJson(json["getMilestone"]),
        list: json["list"] == null ? null : IssuesList.fromJson(json["list"]),
        listAssignees: json["listAssignees"] == null ? null : ListAssignees.fromJson(json["listAssignees"]),
        listComments: json["listComments"] == null ? null : IssuesListComments.fromJson(json["listComments"]),
        listCommentsForRepo: json["listCommentsForRepo"] == null ? null : IssuesListCommentsForRepo.fromJson(json["listCommentsForRepo"]),
        listEvents: json["listEvents"] == null ? null : ListEvents.fromJson(json["listEvents"]),
        listEventsForRepo: json["listEventsForRepo"] == null ? null : ListEventsForRepo.fromJson(json["listEventsForRepo"]),
        listEventsForTimeline: json["listEventsForTimeline"] == null ? null : ListEventsForTimeline.fromJson(json["listEventsForTimeline"]),
        listForAuthenticatedUser: json["listForAuthenticatedUser"] == null ? null : IssuesListForAuthenticatedUser.fromJson(json["listForAuthenticatedUser"]),
        listForOrg: json["listForOrg"] == null ? null : IssuesListForOrg.fromJson(json["listForOrg"]),
        listForRepo: json["listForRepo"] == null ? null : IssuesListForRepo.fromJson(json["listForRepo"]),
        listLabelsForMilestone: json["listLabelsForMilestone"] == null ? null : ListLabelsForMilestone.fromJson(json["listLabelsForMilestone"]),
        listLabelsForRepo: json["listLabelsForRepo"] == null ? null : ListLabelsForRepo.fromJson(json["listLabelsForRepo"]),
        listLabelsOnIssue: json["listLabelsOnIssue"] == null ? null : ListLabelsOnIssue.fromJson(json["listLabelsOnIssue"]),
        listMilestonesForRepo: json["listMilestonesForRepo"] == null ? null : ListMilestonesForRepo.fromJson(json["listMilestonesForRepo"]),
        lock: json["lock"] == null ? null : Lock.fromJson(json["lock"]),
        removeAssignees: json["removeAssignees"] == null ? null : RemoveAssignees.fromJson(json["removeAssignees"]),
        removeLabel: json["removeLabel"] == null ? null : RemoveLabel.fromJson(json["removeLabel"]),
        removeLabels: json["removeLabels"] == null ? null : RemoveLabels.fromJson(json["removeLabels"]),
        replaceLabels: json["replaceLabels"] == null ? null : ReplaceLabels.fromJson(json["replaceLabels"]),
        unlock: json["unlock"] == null ? null : Unlock.fromJson(json["unlock"]),
        update: json["update"] == null ? null : IssuesUpdate.fromJson(json["update"]),
        updateComment: json["updateComment"] == null ? null : IssuesUpdateComment.fromJson(json["updateComment"]),
        updateLabel: json["updateLabel"] == null ? null : UpdateLabel.fromJson(json["updateLabel"]),
        updateMilestone: json["updateMilestone"] == null ? null : UpdateMilestone.fromJson(json["updateMilestone"]),
    );

    Map<String, dynamic> toJson() => {
        "addAssignees": addAssignees == null ? null : addAssignees.toJson(),
        "addLabels": addLabels == null ? null : addLabels.toJson(),
        "checkAssignee": checkAssignee == null ? null : checkAssignee.toJson(),
        "create": create == null ? null : create.toJson(),
        "createComment": createComment == null ? null : createComment.toJson(),
        "createLabel": createLabel == null ? null : createLabel.toJson(),
        "createMilestone": createMilestone == null ? null : createMilestone.toJson(),
        "deleteComment": deleteComment == null ? null : deleteComment.toJson(),
        "deleteLabel": deleteLabel == null ? null : deleteLabel.toJson(),
        "deleteMilestone": deleteMilestone == null ? null : deleteMilestone.toJson(),
        "get": issuesGet == null ? null : issuesGet.toJson(),
        "getComment": getComment == null ? null : getComment.toJson(),
        "getEvent": getEvent == null ? null : getEvent.toJson(),
        "getLabel": getLabel == null ? null : getLabel.toJson(),
        "getMilestone": getMilestone == null ? null : getMilestone.toJson(),
        "list": list == null ? null : list.toJson(),
        "listAssignees": listAssignees == null ? null : listAssignees.toJson(),
        "listComments": listComments == null ? null : listComments.toJson(),
        "listCommentsForRepo": listCommentsForRepo == null ? null : listCommentsForRepo.toJson(),
        "listEvents": listEvents == null ? null : listEvents.toJson(),
        "listEventsForRepo": listEventsForRepo == null ? null : listEventsForRepo.toJson(),
        "listEventsForTimeline": listEventsForTimeline == null ? null : listEventsForTimeline.toJson(),
        "listForAuthenticatedUser": listForAuthenticatedUser == null ? null : listForAuthenticatedUser.toJson(),
        "listForOrg": listForOrg == null ? null : listForOrg.toJson(),
        "listForRepo": listForRepo == null ? null : listForRepo.toJson(),
        "listLabelsForMilestone": listLabelsForMilestone == null ? null : listLabelsForMilestone.toJson(),
        "listLabelsForRepo": listLabelsForRepo == null ? null : listLabelsForRepo.toJson(),
        "listLabelsOnIssue": listLabelsOnIssue == null ? null : listLabelsOnIssue.toJson(),
        "listMilestonesForRepo": listMilestonesForRepo == null ? null : listMilestonesForRepo.toJson(),
        "lock": lock == null ? null : lock.toJson(),
        "removeAssignees": removeAssignees == null ? null : removeAssignees.toJson(),
        "removeLabel": removeLabel == null ? null : removeLabel.toJson(),
        "removeLabels": removeLabels == null ? null : removeLabels.toJson(),
        "replaceLabels": replaceLabels == null ? null : replaceLabels.toJson(),
        "unlock": unlock == null ? null : unlock.toJson(),
        "update": update == null ? null : update.toJson(),
        "updateComment": updateComment == null ? null : updateComment.toJson(),
        "updateLabel": updateLabel == null ? null : updateLabel.toJson(),
        "updateMilestone": updateMilestone == null ? null : updateMilestone.toJson(),
    };
}

/**
 * Adds up to 10 assignees to an issue. Users already assigned to an issue are not
 * replaced.
 *
 * This example adds two assignees to the existing `octocat` assignee.
 */
class AddAssignees {
    AddAssignees({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddAssignees.fromRawJson(String str) => AddAssignees.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddAssignees.fromJson(Map<String, dynamic> json) => AddAssignees(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class AddLabels {
    AddLabels({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddLabels.fromRawJson(String str) => AddLabels.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddLabels.fromJson(Map<String, dynamic> json) => AddLabels(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Checks if a user has permission to be assigned to an issue in this repository.
 *
 * If the `assignee` can be assigned to issues in the repository, a `204` header with no
 * content is returned.
 *
 * Otherwise a `404` status code is returned.
 */
class CheckAssignee {
    CheckAssignee({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckAssignee.fromRawJson(String str) => CheckAssignee.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckAssignee.fromJson(Map<String, dynamic> json) => CheckAssignee(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Any user with pull access to a repository can create an issue. If [issues are disabled in
 * the repository](https://help.github.com/articles/disabling-issues/), the API returns a
 * `410 Gone` status.
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class IssuesCreate {
    IssuesCreate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesCreate.fromRawJson(String str) => IssuesCreate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesCreate.fromJson(Map<String, dynamic> json) => IssuesCreate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class IssuesCreateComment {
    IssuesCreateComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesCreateComment.fromRawJson(String str) => IssuesCreateComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesCreateComment.fromJson(Map<String, dynamic> json) => IssuesCreateComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class CreateLabel {
    CreateLabel({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateLabel.fromRawJson(String str) => CreateLabel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateLabel.fromJson(Map<String, dynamic> json) => CreateLabel(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class CreateMilestone {
    CreateMilestone({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateMilestone.fromRawJson(String str) => CreateMilestone.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateMilestone.fromJson(Map<String, dynamic> json) => CreateMilestone(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class IssuesDeleteComment {
    IssuesDeleteComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesDeleteComment.fromRawJson(String str) => IssuesDeleteComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesDeleteComment.fromJson(Map<String, dynamic> json) => IssuesDeleteComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeleteLabel {
    DeleteLabel({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteLabel.fromRawJson(String str) => DeleteLabel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteLabel.fromJson(Map<String, dynamic> json) => DeleteLabel(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeleteMilestone {
    DeleteMilestone({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteMilestone.fromRawJson(String str) => DeleteMilestone.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteMilestone.fromJson(Map<String, dynamic> json) => DeleteMilestone(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class IssuesGetComment {
    IssuesGetComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesGetComment.fromRawJson(String str) => IssuesGetComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesGetComment.fromJson(Map<String, dynamic> json) => IssuesGetComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetEvent {
    GetEvent({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetEvent.fromRawJson(String str) => GetEvent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetEvent.fromJson(Map<String, dynamic> json) => GetEvent(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetLabel {
    GetLabel({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetLabel.fromRawJson(String str) => GetLabel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetLabel.fromJson(Map<String, dynamic> json) => GetLabel(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetMilestone {
    GetMilestone({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetMilestone.fromRawJson(String str) => GetMilestone.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetMilestone.fromJson(Map<String, dynamic> json) => GetMilestone(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The API returns a [`301 Moved Permanently`
 * status](https://developer.github.com/v3/#http-redirects) if the issue was
 * [transferred](https://help.github.com/articles/transferring-an-issue-to-another-repository/)
 * to another repository. If the issue was transferred to or deleted from a repository where
 * the authenticated user lacks read access, the API returns a `404 Not Found` status. If
 * the issue was deleted from a repository where the authenticated user has read access, the
 * API returns a `410 Gone` status. To receive webhook events for transferred and deleted
 * issues, subscribe to the
 * [`issues`](https://developer.github.com/v3/activity/events/types/#issuesevent) webhook.
 *
 * **Note**: GitHub's REST API v3 considers every pull request an issue, but not every issue
 * is a pull request. For this reason, "Issues" endpoints may return both issues and pull
 * requests in the response. You can identify pull requests by the `pull_request` key.
 *
 * Be aware that the `id` of a pull request returned from "Issues" endpoints will be an
 * _issue id_. To find out the pull request id, use the "[List pull
 * requests](https://developer.github.com/v3/pulls/#list-pull-requests)" endpoint.
 */
class IssuesGet {
    IssuesGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesGet.fromRawJson(String str) => IssuesGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesGet.fromJson(Map<String, dynamic> json) => IssuesGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note**: GitHub's REST API v3 considers every pull request an issue, but not every issue
 * is a pull request. For this reason, "Issues" endpoints may return both issues and pull
 * requests in the response. You can identify pull requests by the `pull_request` key.
 *
 * Be aware that the `id` of a pull request returned from "Issues" endpoints will be an
 * _issue id_. To find out the pull request id, use the "[List pull
 * requests](https://developer.github.com/v3/pulls/#list-pull-requests)" endpoint.
 */
class IssuesList {
    IssuesList({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesList.fromRawJson(String str) => IssuesList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesList.fromJson(Map<String, dynamic> json) => IssuesList(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the [available
 * assignees](https://help.github.com/articles/assigning-issues-and-pull-requests-to-other-github-users/)
 * for issues in a repository.
 */
class ListAssignees {
    ListAssignees({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListAssignees.fromRawJson(String str) => ListAssignees.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListAssignees.fromJson(Map<String, dynamic> json) => ListAssignees(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Issue Comments are ordered by ascending ID.
 */
class IssuesListComments {
    IssuesListComments({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesListComments.fromRawJson(String str) => IssuesListComments.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesListComments.fromJson(Map<String, dynamic> json) => IssuesListComments(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * By default, Issue Comments are ordered by ascending ID.
 */
class IssuesListCommentsForRepo {
    IssuesListCommentsForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesListCommentsForRepo.fromRawJson(String str) => IssuesListCommentsForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesListCommentsForRepo.fromJson(Map<String, dynamic> json) => IssuesListCommentsForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListEvents {
    ListEvents({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListEvents.fromRawJson(String str) => ListEvents.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListEvents.fromJson(Map<String, dynamic> json) => ListEvents(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListEventsForRepo {
    ListEventsForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListEventsForRepo.fromRawJson(String str) => ListEventsForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListEventsForRepo.fromJson(Map<String, dynamic> json) => ListEventsForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListEventsForTimeline {
    ListEventsForTimeline({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListEventsForTimeline.fromRawJson(String str) => ListEventsForTimeline.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListEventsForTimeline.fromJson(Map<String, dynamic> json) => ListEventsForTimeline(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note**: GitHub's REST API v3 considers every pull request an issue, but not every issue
 * is a pull request. For this reason, "Issues" endpoints may return both issues and pull
 * requests in the response. You can identify pull requests by the `pull_request` key.
 *
 * Be aware that the `id` of a pull request returned from "Issues" endpoints will be an
 * _issue id_. To find out the pull request id, use the "[List pull
 * requests](https://developer.github.com/v3/pulls/#list-pull-requests)" endpoint.
 */
class IssuesListForAuthenticatedUser {
    IssuesListForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesListForAuthenticatedUser.fromRawJson(String str) => IssuesListForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesListForAuthenticatedUser.fromJson(Map<String, dynamic> json) => IssuesListForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note**: GitHub's REST API v3 considers every pull request an issue, but not every issue
 * is a pull request. For this reason, "Issues" endpoints may return both issues and pull
 * requests in the response. You can identify pull requests by the `pull_request` key.
 *
 * Be aware that the `id` of a pull request returned from "Issues" endpoints will be an
 * _issue id_. To find out the pull request id, use the "[List pull
 * requests](https://developer.github.com/v3/pulls/#list-pull-requests)" endpoint.
 */
class IssuesListForOrg {
    IssuesListForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesListForOrg.fromRawJson(String str) => IssuesListForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesListForOrg.fromJson(Map<String, dynamic> json) => IssuesListForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note**: GitHub's REST API v3 considers every pull request an issue, but not every issue
 * is a pull request. For this reason, "Issues" endpoints may return both issues and pull
 * requests in the response. You can identify pull requests by the `pull_request` key.
 *
 * Be aware that the `id` of a pull request returned from "Issues" endpoints will be an
 * _issue id_. To find out the pull request id, use the "[List pull
 * requests](https://developer.github.com/v3/pulls/#list-pull-requests)" endpoint.
 */
class IssuesListForRepo {
    IssuesListForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesListForRepo.fromRawJson(String str) => IssuesListForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesListForRepo.fromJson(Map<String, dynamic> json) => IssuesListForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListLabelsForMilestone {
    ListLabelsForMilestone({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListLabelsForMilestone.fromRawJson(String str) => ListLabelsForMilestone.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListLabelsForMilestone.fromJson(Map<String, dynamic> json) => ListLabelsForMilestone(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListLabelsForRepo {
    ListLabelsForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListLabelsForRepo.fromRawJson(String str) => ListLabelsForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListLabelsForRepo.fromJson(Map<String, dynamic> json) => ListLabelsForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListLabelsOnIssue {
    ListLabelsOnIssue({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListLabelsOnIssue.fromRawJson(String str) => ListLabelsOnIssue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListLabelsOnIssue.fromJson(Map<String, dynamic> json) => ListLabelsOnIssue(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListMilestonesForRepo {
    ListMilestonesForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListMilestonesForRepo.fromRawJson(String str) => ListMilestonesForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListMilestonesForRepo.fromJson(Map<String, dynamic> json) => ListMilestonesForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with push access can lock an issue or pull request's conversation.
 *
 * Note that, if you choose not to pass any parameters, you'll need to set `Content-Length`
 * to zero when calling out to this endpoint. For more information, see "[HTTP
 * verbs](https://developer.github.com/v3/#http-verbs)."
 */
class Lock {
    Lock({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Lock.fromRawJson(String str) => Lock.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Lock.fromJson(Map<String, dynamic> json) => Lock(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Removes one or more assignees from an issue.
 *
 * This example removes two of three assignees, leaving the `octocat` assignee.
 */
class RemoveAssignees {
    RemoveAssignees({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveAssignees.fromRawJson(String str) => RemoveAssignees.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveAssignees.fromJson(Map<String, dynamic> json) => RemoveAssignees(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Removes the specified label from the issue, and returns the remaining labels on the
 * issue. This endpoint returns a `404 Not Found` status if the label does not exist.
 */
class RemoveLabel {
    RemoveLabel({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveLabel.fromRawJson(String str) => RemoveLabel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveLabel.fromJson(Map<String, dynamic> json) => RemoveLabel(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class RemoveLabels {
    RemoveLabels({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveLabels.fromRawJson(String str) => RemoveLabels.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveLabels.fromJson(Map<String, dynamic> json) => RemoveLabels(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ReplaceLabels {
    ReplaceLabels({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReplaceLabels.fromRawJson(String str) => ReplaceLabels.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReplaceLabels.fromJson(Map<String, dynamic> json) => ReplaceLabels(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with push access can unlock an issue's conversation.
 */
class Unlock {
    Unlock({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Unlock.fromRawJson(String str) => Unlock.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Unlock.fromJson(Map<String, dynamic> json) => Unlock(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Issue owners and users with push access can edit an issue.
 */
class IssuesUpdate {
    IssuesUpdate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesUpdate.fromRawJson(String str) => IssuesUpdate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesUpdate.fromJson(Map<String, dynamic> json) => IssuesUpdate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class IssuesUpdateComment {
    IssuesUpdateComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesUpdateComment.fromRawJson(String str) => IssuesUpdateComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesUpdateComment.fromJson(Map<String, dynamic> json) => IssuesUpdateComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class UpdateLabel {
    UpdateLabel({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateLabel.fromRawJson(String str) => UpdateLabel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateLabel.fromJson(Map<String, dynamic> json) => UpdateLabel(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class UpdateMilestone {
    UpdateMilestone({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateMilestone.fromRawJson(String str) => UpdateMilestone.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateMilestone.fromJson(Map<String, dynamic> json) => UpdateMilestone(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Licenses {
    Licenses({
        this.licensesGet,
        this.getForRepo,
        this.list,
        this.listCommonlyUsed,
    });

    final LicensesGet licensesGet;
    final LicensesGetForRepo getForRepo;
    final LicensesList list;
    final ListCommonlyUsed listCommonlyUsed;

    factory Licenses.fromRawJson(String str) => Licenses.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Licenses.fromJson(Map<String, dynamic> json) => Licenses(
        licensesGet: json["get"] == null ? null : LicensesGet.fromJson(json["get"]),
        getForRepo: json["getForRepo"] == null ? null : LicensesGetForRepo.fromJson(json["getForRepo"]),
        list: json["list"] == null ? null : LicensesList.fromJson(json["list"]),
        listCommonlyUsed: json["listCommonlyUsed"] == null ? null : ListCommonlyUsed.fromJson(json["listCommonlyUsed"]),
    );

    Map<String, dynamic> toJson() => {
        "get": licensesGet == null ? null : licensesGet.toJson(),
        "getForRepo": getForRepo == null ? null : getForRepo.toJson(),
        "list": list == null ? null : list.toJson(),
        "listCommonlyUsed": listCommonlyUsed == null ? null : listCommonlyUsed.toJson(),
    };
}

/**
 * This method returns the contents of the repository's license file, if one is detected.
 *
 * Similar to [the repository contents
 * API](https://developer.github.com/v3/repos/contents/#get-contents), this method also
 * supports [custom media
 * types](https://developer.github.com/v3/repos/contents/#custom-media-types) for retrieving
 * the raw license content or rendered license HTML.
 */
class LicensesGetForRepo {
    LicensesGetForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory LicensesGetForRepo.fromRawJson(String str) => LicensesGetForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LicensesGetForRepo.fromJson(Map<String, dynamic> json) => LicensesGetForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class LicensesGet {
    LicensesGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory LicensesGet.fromRawJson(String str) => LicensesGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LicensesGet.fromJson(Map<String, dynamic> json) => LicensesGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class LicensesList {
    LicensesList({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory LicensesList.fromRawJson(String str) => LicensesList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LicensesList.fromJson(Map<String, dynamic> json) => LicensesList(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListCommonlyUsed {
    ListCommonlyUsed({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListCommonlyUsed.fromRawJson(String str) => ListCommonlyUsed.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListCommonlyUsed.fromJson(Map<String, dynamic> json) => ListCommonlyUsed(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class OctokitLog {
    OctokitLog({
        this.debug,
        this.error,
        this.info,
        this.warn,
    });

    final Map<String, dynamic> debug;
    final Map<String, dynamic> error;
    final Map<String, dynamic> info;
    final Map<String, dynamic> warn;

    factory OctokitLog.fromRawJson(String str) => OctokitLog.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OctokitLog.fromJson(Map<String, dynamic> json) => OctokitLog(
        debug: json["debug"] == null ? null : Map.from(json["debug"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        error: json["error"] == null ? null : Map.from(json["error"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        info: json["info"] == null ? null : Map.from(json["info"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        warn: json["warn"] == null ? null : Map.from(json["warn"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "debug": debug == null ? null : Map.from(debug).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "error": error == null ? null : Map.from(error).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "info": info == null ? null : Map.from(info).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "warn": warn == null ? null : Map.from(warn).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Markdown {
    Markdown({
        this.render,
        this.renderRaw,
    });

    final Render render;
    final RenderRaw renderRaw;

    factory Markdown.fromRawJson(String str) => Markdown.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Markdown.fromJson(Map<String, dynamic> json) => Markdown(
        render: json["render"] == null ? null : Render.fromJson(json["render"]),
        renderRaw: json["renderRaw"] == null ? null : RenderRaw.fromJson(json["renderRaw"]),
    );

    Map<String, dynamic> toJson() => {
        "render": render == null ? null : render.toJson(),
        "renderRaw": renderRaw == null ? null : renderRaw.toJson(),
    };
}

class Render {
    Render({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Render.fromRawJson(String str) => Render.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Render.fromJson(Map<String, dynamic> json) => Render(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * You must send Markdown as plain text (using a `Content-Type` header of `text/plain` or
 * `text/x-markdown`) to this endpoint, rather than using JSON format. In raw mode, [GitHub
 * Flavored Markdown](https://github.github.com/gfm/) is not supported and Markdown will be
 * rendered in plain format like a README.md file. Markdown content must be 400 KB or less.
 */
class RenderRaw {
    RenderRaw({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RenderRaw.fromRawJson(String str) => RenderRaw.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RenderRaw.fromJson(Map<String, dynamic> json) => RenderRaw(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Meta {
    Meta({
        this.metaGet,
    });

    final MetaGet metaGet;

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        metaGet: json["get"] == null ? null : MetaGet.fromJson(json["get"]),
    );

    Map<String, dynamic> toJson() => {
        "get": metaGet == null ? null : metaGet.toJson(),
    };
}

/**
 * This endpoint provides a list of GitHub's IP addresses. For more information, see "[About
 * GitHub's IP addresses](https://help.github.com/articles/about-github-s-ip-addresses/)."
 */
class MetaGet {
    MetaGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory MetaGet.fromRawJson(String str) => MetaGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MetaGet.fromJson(Map<String, dynamic> json) => MetaGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Migrations {
    Migrations({
        this.cancelImport,
        this.deleteArchiveForAuthenticatedUser,
        this.deleteArchiveForOrg,
        this.downloadArchiveForOrg,
        this.getArchiveForAuthenticatedUser,
        this.getArchiveForOrg,
        this.getCommitAuthors,
        this.getImportProgress,
        this.getLargeFiles,
        this.getStatusForAuthenticatedUser,
        this.getStatusForOrg,
        this.listForAuthenticatedUser,
        this.listForOrg,
        this.listReposForOrg,
        this.listReposForUser,
        this.mapCommitAuthor,
        this.setLfsPreference,
        this.startForAuthenticatedUser,
        this.startForOrg,
        this.startImport,
        this.unlockRepoForAuthenticatedUser,
        this.unlockRepoForOrg,
        this.updateImport,
    });

    final CancelImport cancelImport;
    final DeleteArchiveForAuthenticatedUser deleteArchiveForAuthenticatedUser;
    final DeleteArchiveForOrg deleteArchiveForOrg;
    final DownloadArchiveForOrg downloadArchiveForOrg;
    final GetArchiveForAuthenticatedUser getArchiveForAuthenticatedUser;
    final GetArchiveForOrg getArchiveForOrg;
    final GetCommitAuthors getCommitAuthors;
    final GetImportProgress getImportProgress;
    final GetLargeFiles getLargeFiles;
    final GetStatusForAuthenticatedUser getStatusForAuthenticatedUser;
    final GetStatusForOrg getStatusForOrg;
    final MigrationsListForAuthenticatedUser listForAuthenticatedUser;
    final MigrationsListForOrg listForOrg;
    final ListReposForOrg listReposForOrg;
    final ListReposForUser listReposForUser;
    final MapCommitAuthor mapCommitAuthor;
    final SetLfsPreference setLfsPreference;
    final StartForAuthenticatedUser startForAuthenticatedUser;
    final StartForOrg startForOrg;
    final StartImport startImport;
    final UnlockRepoForAuthenticatedUser unlockRepoForAuthenticatedUser;
    final UnlockRepoForOrg unlockRepoForOrg;
    final UpdateImport updateImport;

    factory Migrations.fromRawJson(String str) => Migrations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Migrations.fromJson(Map<String, dynamic> json) => Migrations(
        cancelImport: json["cancelImport"] == null ? null : CancelImport.fromJson(json["cancelImport"]),
        deleteArchiveForAuthenticatedUser: json["deleteArchiveForAuthenticatedUser"] == null ? null : DeleteArchiveForAuthenticatedUser.fromJson(json["deleteArchiveForAuthenticatedUser"]),
        deleteArchiveForOrg: json["deleteArchiveForOrg"] == null ? null : DeleteArchiveForOrg.fromJson(json["deleteArchiveForOrg"]),
        downloadArchiveForOrg: json["downloadArchiveForOrg"] == null ? null : DownloadArchiveForOrg.fromJson(json["downloadArchiveForOrg"]),
        getArchiveForAuthenticatedUser: json["getArchiveForAuthenticatedUser"] == null ? null : GetArchiveForAuthenticatedUser.fromJson(json["getArchiveForAuthenticatedUser"]),
        getArchiveForOrg: json["getArchiveForOrg"] == null ? null : GetArchiveForOrg.fromJson(json["getArchiveForOrg"]),
        getCommitAuthors: json["getCommitAuthors"] == null ? null : GetCommitAuthors.fromJson(json["getCommitAuthors"]),
        getImportProgress: json["getImportProgress"] == null ? null : GetImportProgress.fromJson(json["getImportProgress"]),
        getLargeFiles: json["getLargeFiles"] == null ? null : GetLargeFiles.fromJson(json["getLargeFiles"]),
        getStatusForAuthenticatedUser: json["getStatusForAuthenticatedUser"] == null ? null : GetStatusForAuthenticatedUser.fromJson(json["getStatusForAuthenticatedUser"]),
        getStatusForOrg: json["getStatusForOrg"] == null ? null : GetStatusForOrg.fromJson(json["getStatusForOrg"]),
        listForAuthenticatedUser: json["listForAuthenticatedUser"] == null ? null : MigrationsListForAuthenticatedUser.fromJson(json["listForAuthenticatedUser"]),
        listForOrg: json["listForOrg"] == null ? null : MigrationsListForOrg.fromJson(json["listForOrg"]),
        listReposForOrg: json["listReposForOrg"] == null ? null : ListReposForOrg.fromJson(json["listReposForOrg"]),
        listReposForUser: json["listReposForUser"] == null ? null : ListReposForUser.fromJson(json["listReposForUser"]),
        mapCommitAuthor: json["mapCommitAuthor"] == null ? null : MapCommitAuthor.fromJson(json["mapCommitAuthor"]),
        setLfsPreference: json["setLfsPreference"] == null ? null : SetLfsPreference.fromJson(json["setLfsPreference"]),
        startForAuthenticatedUser: json["startForAuthenticatedUser"] == null ? null : StartForAuthenticatedUser.fromJson(json["startForAuthenticatedUser"]),
        startForOrg: json["startForOrg"] == null ? null : StartForOrg.fromJson(json["startForOrg"]),
        startImport: json["startImport"] == null ? null : StartImport.fromJson(json["startImport"]),
        unlockRepoForAuthenticatedUser: json["unlockRepoForAuthenticatedUser"] == null ? null : UnlockRepoForAuthenticatedUser.fromJson(json["unlockRepoForAuthenticatedUser"]),
        unlockRepoForOrg: json["unlockRepoForOrg"] == null ? null : UnlockRepoForOrg.fromJson(json["unlockRepoForOrg"]),
        updateImport: json["updateImport"] == null ? null : UpdateImport.fromJson(json["updateImport"]),
    );

    Map<String, dynamic> toJson() => {
        "cancelImport": cancelImport == null ? null : cancelImport.toJson(),
        "deleteArchiveForAuthenticatedUser": deleteArchiveForAuthenticatedUser == null ? null : deleteArchiveForAuthenticatedUser.toJson(),
        "deleteArchiveForOrg": deleteArchiveForOrg == null ? null : deleteArchiveForOrg.toJson(),
        "downloadArchiveForOrg": downloadArchiveForOrg == null ? null : downloadArchiveForOrg.toJson(),
        "getArchiveForAuthenticatedUser": getArchiveForAuthenticatedUser == null ? null : getArchiveForAuthenticatedUser.toJson(),
        "getArchiveForOrg": getArchiveForOrg == null ? null : getArchiveForOrg.toJson(),
        "getCommitAuthors": getCommitAuthors == null ? null : getCommitAuthors.toJson(),
        "getImportProgress": getImportProgress == null ? null : getImportProgress.toJson(),
        "getLargeFiles": getLargeFiles == null ? null : getLargeFiles.toJson(),
        "getStatusForAuthenticatedUser": getStatusForAuthenticatedUser == null ? null : getStatusForAuthenticatedUser.toJson(),
        "getStatusForOrg": getStatusForOrg == null ? null : getStatusForOrg.toJson(),
        "listForAuthenticatedUser": listForAuthenticatedUser == null ? null : listForAuthenticatedUser.toJson(),
        "listForOrg": listForOrg == null ? null : listForOrg.toJson(),
        "listReposForOrg": listReposForOrg == null ? null : listReposForOrg.toJson(),
        "listReposForUser": listReposForUser == null ? null : listReposForUser.toJson(),
        "mapCommitAuthor": mapCommitAuthor == null ? null : mapCommitAuthor.toJson(),
        "setLfsPreference": setLfsPreference == null ? null : setLfsPreference.toJson(),
        "startForAuthenticatedUser": startForAuthenticatedUser == null ? null : startForAuthenticatedUser.toJson(),
        "startForOrg": startForOrg == null ? null : startForOrg.toJson(),
        "startImport": startImport == null ? null : startImport.toJson(),
        "unlockRepoForAuthenticatedUser": unlockRepoForAuthenticatedUser == null ? null : unlockRepoForAuthenticatedUser.toJson(),
        "unlockRepoForOrg": unlockRepoForOrg == null ? null : unlockRepoForOrg.toJson(),
        "updateImport": updateImport == null ? null : updateImport.toJson(),
    };
}

/**
 * Stop an import for a repository.
 */
class CancelImport {
    CancelImport({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CancelImport.fromRawJson(String str) => CancelImport.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CancelImport.fromJson(Map<String, dynamic> json) => CancelImport(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Deletes a previous migration archive. Downloadable migration archives are automatically
 * deleted after seven days. Migration metadata, which is returned in the [List user
 * migrations](https://developer.github.com/v3/migrations/users/#list-user-migrations) and
 * [Get the status of a user
 * migration](https://developer.github.com/v3/migrations/users/#get-the-status-of-a-user-migration)
 * endpoints, will continue to be available even after an archive is deleted.
 */
class DeleteArchiveForAuthenticatedUser {
    DeleteArchiveForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteArchiveForAuthenticatedUser.fromRawJson(String str) => DeleteArchiveForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteArchiveForAuthenticatedUser.fromJson(Map<String, dynamic> json) => DeleteArchiveForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Deletes a previous migration archive. Migration archives are automatically deleted after
 * seven days.
 */
class DeleteArchiveForOrg {
    DeleteArchiveForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteArchiveForOrg.fromRawJson(String str) => DeleteArchiveForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteArchiveForOrg.fromJson(Map<String, dynamic> json) => DeleteArchiveForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Fetches the URL to a migration archive.
 */
class DownloadArchiveForOrg {
    DownloadArchiveForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DownloadArchiveForOrg.fromRawJson(String str) => DownloadArchiveForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DownloadArchiveForOrg.fromJson(Map<String, dynamic> json) => DownloadArchiveForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Fetches the URL to download the migration archive as a `tar.gz` file. Depending on the
 * resources your repository uses, the migration archive can contain JSON files with data
 * for these objects:
 *
 * *   attachments
 * *   bases
 * *   commit\_comments
 * *   issue\_comments
 * *   issue\_events
 * *   issues
 * *   milestones
 * *   organizations
 * *   projects
 * *   protected\_branches
 * *   pull\_request\_reviews
 * *   pull\_requests
 * *   releases
 * *   repositories
 * *   review\_comments
 * *   schema
 * *   users
 *
 * The archive will also contain an `attachments` directory that includes all attachment
 * files uploaded to GitHub.com and a `repositories` directory that contains the
 * repository's Git data.
 */
class GetArchiveForAuthenticatedUser {
    GetArchiveForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetArchiveForAuthenticatedUser.fromRawJson(String str) => GetArchiveForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetArchiveForAuthenticatedUser.fromJson(Map<String, dynamic> json) => GetArchiveForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Fetches the URL to a migration archive.
 */
class GetArchiveForOrg {
    GetArchiveForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetArchiveForOrg.fromRawJson(String str) => GetArchiveForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetArchiveForOrg.fromJson(Map<String, dynamic> json) => GetArchiveForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Each type of source control system represents authors in a different way. For example, a
 * Git commit author has a display name and an email address, but a Subversion commit author
 * just has a username. The GitHub Importer will make the author information valid, but the
 * author might not be correct. For example, it will change the bare Subversion username
 * `hubot` into something like `hubot <hubot@12341234-abab-fefe-8787-fedcba987654>`.
 *
 * This API method and the "Map a commit author" method allow you to provide correct Git
 * author information.
 */
class GetCommitAuthors {
    GetCommitAuthors({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetCommitAuthors.fromRawJson(String str) => GetCommitAuthors.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCommitAuthors.fromJson(Map<String, dynamic> json) => GetCommitAuthors(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * View the progress of an import.
 *
 * **Import status**
 *
 * This section includes details about the possible values of the `status` field of the
 * Import Progress response.
 *
 * An import that does not have errors will progress through these steps:
 *
 * *   `detecting` - the "detection" step of the import is in progress because the request
 * did not include a `vcs` parameter. The import is identifying the type of source control
 * present at the URL.
 * *   `importing` - the "raw" step of the import is in progress. This is where commit data
 * is fetched from the original repository. The import progress response will include
 * `commit_count` (the total number of raw commits that will be imported) and `percent` (0 -
 * 100, the current progress through the import).
 * *   `mapping` - the "rewrite" step of the import is in progress. This is where SVN
 * branches are converted to Git branches, and where author updates are applied. The import
 * progress response does not include progress information.
 * *   `pushing` - the "push" step of the import is in progress. This is where the importer
 * updates the repository on GitHub. The import progress response will include
 * `push_percent`, which is the percent value reported by `git push` when it is "Writing
 * objects".
 * *   `complete` - the import is complete, and the repository is ready on GitHub.
 *
 * If there are problems, you will see one of these in the `status` field:
 *
 * *   `auth_failed` - the import requires authentication in order to connect to the
 * original repository. To update authentication for the import, please see the [Update
 * Existing
 * Import](https://developer.github.com/v3/migrations/source_imports/#update-existing-import)
 * section.
 * *   `error` - the import encountered an error. The import progress response will include
 * the `failed_step` and an error message. Contact [GitHub
 * Support](https://github.com/contact) or [GitHub Premium
 * Support](https://premium.githubsupport.com) for more information.
 * *   `detection_needs_auth` - the importer requires authentication for the originating
 * repository to continue detection. To update authentication for the import, please see the
 * [Update Existing
 * Import](https://developer.github.com/v3/migrations/source_imports/#update-existing-import)
 * section.
 * *   `detection_found_nothing` - the importer didn't recognize any source control at the
 * URL. To resolve, [Cancel the
 * import](https://developer.github.com/v3/migrations/source_imports/#cancel-an-import) and
 * [retry](https://developer.github.com/v3/migrations/source_imports/#start-an-import) with
 * the correct URL.
 * *   `detection_found_multiple` - the importer found several projects or repositories at
 * the provided URL. When this is the case, the Import Progress response will also include a
 * `project_choices` field with the possible project choices as values. To update project
 * choice, please see the [Update Existing
 * Import](https://developer.github.com/v3/migrations/source_imports/#update-existing-import)
 * section.
 *
 * **The project_choices field**
 *
 * When multiple projects are found at the provided URL, the response hash will include a
 * `project_choices` field, the value of which is an array of hashes each representing a
 * project choice. The exact key/value pairs of the project hashes will differ depending on
 * the version control type.
 *
 * **Git LFS related fields**
 *
 * This section includes details about Git LFS related fields that may be present in the
 * Import Progress response.
 *
 * *   `use_lfs` - describes whether the import has been opted in or out of using Git LFS.
 * The value can be `opt_in`, `opt_out`, or `undecided` if no action has been taken.
 * *   `has_large_files` - the boolean value describing whether files larger than 100MB were
 * found during the `importing` step.
 * *   `large_files_size` - the total size in gigabytes of files larger than 100MB found in
 * the originating repository.
 * *   `large_files_count` - the total number of files larger than 100MB found in the
 * originating repository. To see a list of these files, make a "Get Large Files" request.
 */
class GetImportProgress {
    GetImportProgress({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetImportProgress.fromRawJson(String str) => GetImportProgress.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetImportProgress.fromJson(Map<String, dynamic> json) => GetImportProgress(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List files larger than 100MB found during the import
 */
class GetLargeFiles {
    GetLargeFiles({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetLargeFiles.fromRawJson(String str) => GetLargeFiles.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetLargeFiles.fromJson(Map<String, dynamic> json) => GetLargeFiles(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Fetches a single user migration. The response includes the `state` of the migration,
 * which can be one of the following values:
 *
 * *   `pending` - the migration hasn't started yet.
 * *   `exporting` - the migration is in progress.
 * *   `exported` - the migration finished successfully.
 * *   `failed` - the migration failed.
 *
 * Once the migration has been `exported` you can [download the migration
 * archive](https://developer.github.com/v3/migrations/users/#download-a-user-migration-archive).
 */
class GetStatusForAuthenticatedUser {
    GetStatusForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetStatusForAuthenticatedUser.fromRawJson(String str) => GetStatusForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetStatusForAuthenticatedUser.fromJson(Map<String, dynamic> json) => GetStatusForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Fetches the status of a migration.
 *
 * The `state` of a migration can be one of the following values:
 *
 * *   `pending`, which means the migration hasn't started yet.
 * *   `exporting`, which means the migration is in progress.
 * *   `exported`, which means the migration finished successfully.
 * *   `failed`, which means the migration failed.
 */
class GetStatusForOrg {
    GetStatusForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetStatusForOrg.fromRawJson(String str) => GetStatusForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetStatusForOrg.fromJson(Map<String, dynamic> json) => GetStatusForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all migrations a user has started.
 */
class MigrationsListForAuthenticatedUser {
    MigrationsListForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory MigrationsListForAuthenticatedUser.fromRawJson(String str) => MigrationsListForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MigrationsListForAuthenticatedUser.fromJson(Map<String, dynamic> json) => MigrationsListForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the most recent migrations.
 */
class MigrationsListForOrg {
    MigrationsListForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory MigrationsListForOrg.fromRawJson(String str) => MigrationsListForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MigrationsListForOrg.fromJson(Map<String, dynamic> json) => MigrationsListForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all the repositories for this organization migration.
 */
class ListReposForOrg {
    ListReposForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReposForOrg.fromRawJson(String str) => ListReposForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReposForOrg.fromJson(Map<String, dynamic> json) => ListReposForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all the repositories for this user migration.
 */
class ListReposForUser {
    ListReposForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReposForUser.fromRawJson(String str) => ListReposForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReposForUser.fromJson(Map<String, dynamic> json) => ListReposForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Update an author's identity for the import. Your application can continue updating
 * authors any time before you push new commits to the repository.
 */
class MapCommitAuthor {
    MapCommitAuthor({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory MapCommitAuthor.fromRawJson(String str) => MapCommitAuthor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MapCommitAuthor.fromJson(Map<String, dynamic> json) => MapCommitAuthor(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * You can import repositories from Subversion, Mercurial, and TFS that include files larger
 * than 100MB. This ability is powered by [Git LFS](https://git-lfs.github.com). You can
 * learn more about our LFS feature and working with large files [on our help
 * site](https://help.github.com/articles/versioning-large-files/).
 */
class SetLfsPreference {
    SetLfsPreference({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory SetLfsPreference.fromRawJson(String str) => SetLfsPreference.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SetLfsPreference.fromJson(Map<String, dynamic> json) => SetLfsPreference(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Initiates the generation of a user migration archive.
 */
class StartForAuthenticatedUser {
    StartForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory StartForAuthenticatedUser.fromRawJson(String str) => StartForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StartForAuthenticatedUser.fromJson(Map<String, dynamic> json) => StartForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Initiates the generation of a migration archive.
 */
class StartForOrg {
    StartForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory StartForOrg.fromRawJson(String str) => StartForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StartForOrg.fromJson(Map<String, dynamic> json) => StartForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Start a source import to a GitHub repository using GitHub Importer.
 */
class StartImport {
    StartImport({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory StartImport.fromRawJson(String str) => StartImport.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StartImport.fromJson(Map<String, dynamic> json) => StartImport(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Unlocks a repository. You can lock repositories when you [start a user
 * migration](https://developer.github.com/v3/migrations/users/#start-a-user-migration).
 * Once the migration is complete you can unlock each repository to begin using it again or
 * [delete the repository](https://developer.github.com/v3/repos/#delete-a-repository) if
 * you no longer need the source data. Returns a status of `404 Not Found` if the repository
 * is not locked.
 */
class UnlockRepoForAuthenticatedUser {
    UnlockRepoForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UnlockRepoForAuthenticatedUser.fromRawJson(String str) => UnlockRepoForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UnlockRepoForAuthenticatedUser.fromJson(Map<String, dynamic> json) => UnlockRepoForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Unlocks a repository that was locked for migration. You should unlock each migrated
 * repository and [delete them](https://developer.github.com/v3/repos/#delete-a-repository)
 * when the migration is complete and you no longer need the source data.
 */
class UnlockRepoForOrg {
    UnlockRepoForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UnlockRepoForOrg.fromRawJson(String str) => UnlockRepoForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UnlockRepoForOrg.fromJson(Map<String, dynamic> json) => UnlockRepoForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * An import can be updated with credentials or a project choice by passing in the
 * appropriate parameters in this API request. If no parameters are provided, the import
 * will be restarted.
 *
 * Some servers (e.g. TFS servers) can have several projects at a single URL. In those cases
 * the import progress will have the status `detection_found_multiple` and the Import
 * Progress response will include a `project_choices` array. You can select the project to
 * import by providing one of the objects in the `project_choices` array in the update
 * request.
 *
 * The following example demonstrates the workflow for updating an import with "project1" as
 * the project choice. Given a `project_choices` array like such:
 *
 * To restart an import, no parameters are provided in the update request.
 */
class UpdateImport {
    UpdateImport({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateImport.fromRawJson(String str) => UpdateImport.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateImport.fromJson(Map<String, dynamic> json) => UpdateImport(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class OauthAuthorizations {
    OauthAuthorizations({
        this.checkAuthorization,
        this.createAuthorization,
        this.deleteAuthorization,
        this.deleteGrant,
        this.getAuthorization,
        this.getGrant,
        this.getOrCreateAuthorizationForApp,
        this.getOrCreateAuthorizationForAppAndFingerprint,
        this.getOrCreateAuthorizationForAppFingerprint,
        this.listAuthorizations,
        this.listGrants,
        this.resetAuthorization,
        this.revokeAuthorizationForApplication,
        this.revokeGrantForApplication,
        this.updateAuthorization,
    });

    final OauthAuthorizationsCheckAuthorization checkAuthorization;
    final CreateAuthorization createAuthorization;
    final OauthAuthorizationsDeleteAuthorization deleteAuthorization;
    final DeleteGrant deleteGrant;
    final GetAuthorization getAuthorization;
    final GetGrant getGrant;
    final GetOrCreateAuthorizationForApp getOrCreateAuthorizationForApp;
    final GetOrCreateAuthorizationForAppAndFingerprint getOrCreateAuthorizationForAppAndFingerprint;
    final GetOrCreateAuthorizationForAppFingerprint getOrCreateAuthorizationForAppFingerprint;
    final ListAuthorizations listAuthorizations;
    final ListGrants listGrants;
    final OauthAuthorizationsResetAuthorization resetAuthorization;
    final OauthAuthorizationsRevokeAuthorizationForApplication revokeAuthorizationForApplication;
    final OauthAuthorizationsRevokeGrantForApplication revokeGrantForApplication;
    final UpdateAuthorization updateAuthorization;

    factory OauthAuthorizations.fromRawJson(String str) => OauthAuthorizations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OauthAuthorizations.fromJson(Map<String, dynamic> json) => OauthAuthorizations(
        checkAuthorization: json["checkAuthorization"] == null ? null : OauthAuthorizationsCheckAuthorization.fromJson(json["checkAuthorization"]),
        createAuthorization: json["createAuthorization"] == null ? null : CreateAuthorization.fromJson(json["createAuthorization"]),
        deleteAuthorization: json["deleteAuthorization"] == null ? null : OauthAuthorizationsDeleteAuthorization.fromJson(json["deleteAuthorization"]),
        deleteGrant: json["deleteGrant"] == null ? null : DeleteGrant.fromJson(json["deleteGrant"]),
        getAuthorization: json["getAuthorization"] == null ? null : GetAuthorization.fromJson(json["getAuthorization"]),
        getGrant: json["getGrant"] == null ? null : GetGrant.fromJson(json["getGrant"]),
        getOrCreateAuthorizationForApp: json["getOrCreateAuthorizationForApp"] == null ? null : GetOrCreateAuthorizationForApp.fromJson(json["getOrCreateAuthorizationForApp"]),
        getOrCreateAuthorizationForAppAndFingerprint: json["getOrCreateAuthorizationForAppAndFingerprint"] == null ? null : GetOrCreateAuthorizationForAppAndFingerprint.fromJson(json["getOrCreateAuthorizationForAppAndFingerprint"]),
        getOrCreateAuthorizationForAppFingerprint: json["getOrCreateAuthorizationForAppFingerprint"] == null ? null : GetOrCreateAuthorizationForAppFingerprint.fromJson(json["getOrCreateAuthorizationForAppFingerprint"]),
        listAuthorizations: json["listAuthorizations"] == null ? null : ListAuthorizations.fromJson(json["listAuthorizations"]),
        listGrants: json["listGrants"] == null ? null : ListGrants.fromJson(json["listGrants"]),
        resetAuthorization: json["resetAuthorization"] == null ? null : OauthAuthorizationsResetAuthorization.fromJson(json["resetAuthorization"]),
        revokeAuthorizationForApplication: json["revokeAuthorizationForApplication"] == null ? null : OauthAuthorizationsRevokeAuthorizationForApplication.fromJson(json["revokeAuthorizationForApplication"]),
        revokeGrantForApplication: json["revokeGrantForApplication"] == null ? null : OauthAuthorizationsRevokeGrantForApplication.fromJson(json["revokeGrantForApplication"]),
        updateAuthorization: json["updateAuthorization"] == null ? null : UpdateAuthorization.fromJson(json["updateAuthorization"]),
    );

    Map<String, dynamic> toJson() => {
        "checkAuthorization": checkAuthorization == null ? null : checkAuthorization.toJson(),
        "createAuthorization": createAuthorization == null ? null : createAuthorization.toJson(),
        "deleteAuthorization": deleteAuthorization == null ? null : deleteAuthorization.toJson(),
        "deleteGrant": deleteGrant == null ? null : deleteGrant.toJson(),
        "getAuthorization": getAuthorization == null ? null : getAuthorization.toJson(),
        "getGrant": getGrant == null ? null : getGrant.toJson(),
        "getOrCreateAuthorizationForApp": getOrCreateAuthorizationForApp == null ? null : getOrCreateAuthorizationForApp.toJson(),
        "getOrCreateAuthorizationForAppAndFingerprint": getOrCreateAuthorizationForAppAndFingerprint == null ? null : getOrCreateAuthorizationForAppAndFingerprint.toJson(),
        "getOrCreateAuthorizationForAppFingerprint": getOrCreateAuthorizationForAppFingerprint == null ? null : getOrCreateAuthorizationForAppFingerprint.toJson(),
        "listAuthorizations": listAuthorizations == null ? null : listAuthorizations.toJson(),
        "listGrants": listGrants == null ? null : listGrants.toJson(),
        "resetAuthorization": resetAuthorization == null ? null : resetAuthorization.toJson(),
        "revokeAuthorizationForApplication": revokeAuthorizationForApplication == null ? null : revokeAuthorizationForApplication.toJson(),
        "revokeGrantForApplication": revokeGrantForApplication == null ? null : revokeGrantForApplication.toJson(),
        "updateAuthorization": updateAuthorization == null ? null : updateAuthorization.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will replace and discontinue OAuth endpoints containing
 * `access_token` in the path parameter. We are introducing new endpoints that allow you to
 * securely manage tokens for OAuth Apps by using `access_token` as an input parameter. For
 * more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * OAuth applications can use a special API method for checking OAuth token validity without
 * exceeding the normal rate limits for failed login attempts. Authentication works
 * differently with this particular endpoint. You must use [Basic
 * Authentication](https://developer.github.com/v3/auth#basic-authentication) when accessing
 * this endpoint, using the OAuth application's `client_id` and `client_secret` as the
 * username and password. Invalid tokens will return `404 NOT FOUND`.
 */
class OauthAuthorizationsCheckAuthorization {
    OauthAuthorizationsCheckAuthorization({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OauthAuthorizationsCheckAuthorization.fromRawJson(String str) => OauthAuthorizationsCheckAuthorization.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OauthAuthorizationsCheckAuthorization.fromJson(Map<String, dynamic> json) => OauthAuthorizationsCheckAuthorization(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * **Warning:** Apps must use the [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow)
 * to obtain OAuth tokens that work with GitHub SAML organizations. OAuth tokens created
 * using the Authorizations API will be unable to access GitHub SAML organizations. For more
 * information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * Creates OAuth tokens using [Basic
 * Authentication](https://developer.github.com/v3/auth#basic-authentication). If you have
 * two-factor authentication setup, Basic Authentication for this endpoint requires that you
 * use a one-time password (OTP) and your username and password instead of tokens. For more
 * information, see "[Working with two-factor
 * authentication](https://developer.github.com/v3/auth/#working-with-two-factor-authentication)."
 *
 * To create tokens for a particular OAuth application using this endpoint, you must
 * authenticate as the user you want to create an authorization for and provide the app's
 * client ID and secret, found on your OAuth application's settings page. If your OAuth
 * application intends to create multiple tokens for one user, use `fingerprint` to
 * differentiate between them.
 *
 * You can also create tokens on GitHub from the [personal access tokens
 * settings](https://github.com/settings/tokens) page. Read more about these tokens in [the
 * GitHub Help
 * documentation](https://help.github.com/articles/creating-an-access-token-for-command-line-use).
 *
 * Organizations that enforce SAML SSO require personal access tokens to be whitelisted.
 * Read more about whitelisting tokens in [the GitHub Help
 * documentation](https://help.github.com/articles/about-identity-and-access-management-with-saml-single-sign-on).
 */
class CreateAuthorization {
    CreateAuthorization({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateAuthorization.fromRawJson(String str) => CreateAuthorization.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateAuthorization.fromJson(Map<String, dynamic> json) => CreateAuthorization(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 */
class OauthAuthorizationsDeleteAuthorization {
    OauthAuthorizationsDeleteAuthorization({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OauthAuthorizationsDeleteAuthorization.fromRawJson(String str) => OauthAuthorizationsDeleteAuthorization.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OauthAuthorizationsDeleteAuthorization.fromJson(Map<String, dynamic> json) => OauthAuthorizationsDeleteAuthorization(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * Deleting an OAuth application's grant will also delete all OAuth tokens associated with
 * the application for your user. Once deleted, the application has no access to your
 * account and is no longer listed on [the application authorizations settings screen within
 * GitHub](https://github.com/settings/applications#authorized).
 */
class DeleteGrant {
    DeleteGrant({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteGrant.fromRawJson(String str) => DeleteGrant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteGrant.fromJson(Map<String, dynamic> json) => DeleteGrant(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 */
class GetAuthorization {
    GetAuthorization({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetAuthorization.fromRawJson(String str) => GetAuthorization.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetAuthorization.fromJson(Map<String, dynamic> json) => GetAuthorization(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 */
class GetGrant {
    GetGrant({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetGrant.fromRawJson(String str) => GetGrant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetGrant.fromJson(Map<String, dynamic> json) => GetGrant(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * **Warning:** Apps must use the [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow)
 * to obtain OAuth tokens that work with GitHub SAML organizations. OAuth tokens created
 * using the Authorizations API will be unable to access GitHub SAML organizations. For more
 * information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * Creates a new authorization for the specified OAuth application, only if an authorization
 * for that application doesn't already exist for the user. The URL includes the 20
 * character client ID for the OAuth app that is requesting the token. It returns the user's
 * existing authorization for the application if one is present. Otherwise, it creates and
 * returns a new one.
 *
 * If you have two-factor authentication setup, Basic Authentication for this endpoint
 * requires that you use a one-time password (OTP) and your username and password instead of
 * tokens. For more information, see "[Working with two-factor
 * authentication](https://developer.github.com/v3/auth/#working-with-two-factor-authentication)."
 *
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 */
class GetOrCreateAuthorizationForApp {
    GetOrCreateAuthorizationForApp({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetOrCreateAuthorizationForApp.fromRawJson(String str) => GetOrCreateAuthorizationForApp.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetOrCreateAuthorizationForApp.fromJson(Map<String, dynamic> json) => GetOrCreateAuthorizationForApp(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * **Warning:** Apps must use the [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow)
 * to obtain OAuth tokens that work with GitHub SAML organizations. OAuth tokens created
 * using the Authorizations API will be unable to access GitHub SAML organizations. For more
 * information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * This method will create a new authorization for the specified OAuth application, only if
 * an authorization for that application and fingerprint do not already exist for the user.
 * The URL includes the 20 character client ID for the OAuth app that is requesting the
 * token. `fingerprint` is a unique string to distinguish an authorization from others
 * created for the same client ID and user. It returns the user's existing authorization for
 * the application if one is present. Otherwise, it creates and returns a new one.
 *
 * If you have two-factor authentication setup, Basic Authentication for this endpoint
 * requires that you use a one-time password (OTP) and your username and password instead of
 * tokens. For more information, see "[Working with two-factor
 * authentication](https://developer.github.com/v3/auth/#working-with-two-factor-authentication)."
 */
class GetOrCreateAuthorizationForAppAndFingerprint {
    GetOrCreateAuthorizationForAppAndFingerprint({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetOrCreateAuthorizationForAppAndFingerprint.fromRawJson(String str) => GetOrCreateAuthorizationForAppAndFingerprint.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetOrCreateAuthorizationForAppAndFingerprint.fromJson(Map<String, dynamic> json) => GetOrCreateAuthorizationForAppAndFingerprint(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * **Warning:** Apps must use the [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow)
 * to obtain OAuth tokens that work with GitHub SAML organizations. OAuth tokens created
 * using the Authorizations API will be unable to access GitHub SAML organizations. For more
 * information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * This method will create a new authorization for the specified OAuth application, only if
 * an authorization for that application and fingerprint do not already exist for the user.
 * The URL includes the 20 character client ID for the OAuth app that is requesting the
 * token. `fingerprint` is a unique string to distinguish an authorization from others
 * created for the same client ID and user. It returns the user's existing authorization for
 * the application if one is present. Otherwise, it creates and returns a new one.
 *
 * If you have two-factor authentication setup, Basic Authentication for this endpoint
 * requires that you use a one-time password (OTP) and your username and password instead of
 * tokens. For more information, see "[Working with two-factor
 * authentication](https://developer.github.com/v3/auth/#working-with-two-factor-authentication)."
 */
class GetOrCreateAuthorizationForAppFingerprint {
    GetOrCreateAuthorizationForAppFingerprint({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetOrCreateAuthorizationForAppFingerprint.fromRawJson(String str) => GetOrCreateAuthorizationForAppFingerprint.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetOrCreateAuthorizationForAppFingerprint.fromJson(Map<String, dynamic> json) => GetOrCreateAuthorizationForAppFingerprint(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 */
class ListAuthorizations {
    ListAuthorizations({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListAuthorizations.fromRawJson(String str) => ListAuthorizations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListAuthorizations.fromJson(Map<String, dynamic> json) => ListAuthorizations(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * You can use this API to list the set of OAuth applications that have been granted access
 * to your account. Unlike the [list your
 * authorizations](https://developer.github.com/v3/oauth_authorizations/#list-your-authorizations)
 * API, this API does not manage individual tokens. This API will return one entry for each
 * OAuth application that has been granted access to your account, regardless of the number
 * of tokens an application has generated for your user. The list of OAuth applications
 * returned matches what is shown on [the application authorizations settings screen within
 * GitHub](https://github.com/settings/applications#authorized). The `scopes` returned are
 * the union of scopes authorized for the application. For example, if an application has
 * one token with `repo` scope and another token with `user` scope, the grant will return
 * `["repo", "user"]`.
 */
class ListGrants {
    ListGrants({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListGrants.fromRawJson(String str) => ListGrants.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListGrants.fromJson(Map<String, dynamic> json) => ListGrants(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will replace and discontinue OAuth endpoints containing
 * `access_token` in the path parameter. We are introducing new endpoints that allow you to
 * securely manage tokens for OAuth Apps by using `access_token` as an input parameter. For
 * more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * OAuth applications can use this API method to reset a valid OAuth token without end-user
 * involvement. Applications must save the "token" property in the response because changes
 * take effect immediately. You must use [Basic
 * Authentication](https://developer.github.com/v3/auth#basic-authentication) when accessing
 * this endpoint, using the OAuth application's `client_id` and `client_secret` as the
 * username and password. Invalid tokens will return `404 NOT FOUND`.
 */
class OauthAuthorizationsResetAuthorization {
    OauthAuthorizationsResetAuthorization({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OauthAuthorizationsResetAuthorization.fromRawJson(String str) => OauthAuthorizationsResetAuthorization.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OauthAuthorizationsResetAuthorization.fromJson(Map<String, dynamic> json) => OauthAuthorizationsResetAuthorization(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will replace and discontinue OAuth endpoints containing
 * `access_token` in the path parameter. We are introducing new endpoints that allow you to
 * securely manage tokens for OAuth Apps by using `access_token` as an input parameter. For
 * more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * OAuth application owners can revoke a single token for an OAuth application. You must use
 * [Basic Authentication](https://developer.github.com/v3/auth#basic-authentication) when
 * accessing this endpoint, using the OAuth application's `client_id` and `client_secret` as
 * the username and password.
 */
class OauthAuthorizationsRevokeAuthorizationForApplication {
    OauthAuthorizationsRevokeAuthorizationForApplication({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OauthAuthorizationsRevokeAuthorizationForApplication.fromRawJson(String str) => OauthAuthorizationsRevokeAuthorizationForApplication.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OauthAuthorizationsRevokeAuthorizationForApplication.fromJson(Map<String, dynamic> json) => OauthAuthorizationsRevokeAuthorizationForApplication(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will replace and discontinue OAuth endpoints containing
 * `access_token` in the path parameter. We are introducing new endpoints that allow you to
 * securely manage tokens for OAuth Apps by using `access_token` as an input parameter. For
 * more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * OAuth application owners can revoke a grant for their OAuth application and a specific
 * user. You must use [Basic
 * Authentication](https://developer.github.com/v3/auth#basic-authentication) when accessing
 * this endpoint, using the OAuth application's `client_id` and `client_secret` as the
 * username and password. You must also provide a valid token as `:access_token` and the
 * grant for the token's owner will be deleted.
 *
 * Deleting an OAuth application's grant will also delete all OAuth tokens associated with
 * the application for the user. Once deleted, the application will have no access to the
 * user's account and will no longer be listed on [the Applications settings page under
 * "Authorized OAuth Apps" on GitHub](https://github.com/settings/applications#authorized).
 */
class OauthAuthorizationsRevokeGrantForApplication {
    OauthAuthorizationsRevokeGrantForApplication({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OauthAuthorizationsRevokeGrantForApplication.fromRawJson(String str) => OauthAuthorizationsRevokeGrantForApplication.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OauthAuthorizationsRevokeGrantForApplication.fromJson(Map<String, dynamic> json) => OauthAuthorizationsRevokeGrantForApplication(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** GitHub will discontinue the [OAuth Authorizations
 * API](https://developer.github.com/v3/oauth_authorizations/), which is used by
 * integrations to create personal access tokens and OAuth tokens, and you must now create
 * these tokens using our [web application
 * flow](https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/#web-application-flow).
 * For more information, see the [blog
 * post](https://developer.github.com/changes/2019-11-05-deprecated-passwords-and-authorizations-api).
 *
 * If you have two-factor authentication setup, Basic Authentication for this endpoint
 * requires that you use a one-time password (OTP) and your username and password instead of
 * tokens. For more information, see "[Working with two-factor
 * authentication](https://developer.github.com/v3/auth/#working-with-two-factor-authentication)."
 *
 * You can only send one of these scope keys at a time.
 */
class UpdateAuthorization {
    UpdateAuthorization({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateAuthorization.fromRawJson(String str) => UpdateAuthorization.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateAuthorization.fromJson(Map<String, dynamic> json) => UpdateAuthorization(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Orgs {
    Orgs({
        this.addOrUpdateMembership,
        this.blockUser,
        this.checkBlockedUser,
        this.checkMembership,
        this.checkPublicMembership,
        this.concealMembership,
        this.convertMemberToOutsideCollaborator,
        this.createHook,
        this.createInvitation,
        this.deleteHook,
        this.orgsGet,
        this.getHook,
        this.getMembership,
        this.getMembershipForAuthenticatedUser,
        this.list,
        this.listBlockedUsers,
        this.listForAuthenticatedUser,
        this.listForUser,
        this.listHooks,
        this.listInstallations,
        this.listInvitationTeams,
        this.listMembers,
        this.listMemberships,
        this.listOutsideCollaborators,
        this.listPendingInvitations,
        this.listPublicMembers,
        this.pingHook,
        this.publicizeMembership,
        this.removeMember,
        this.removeMembership,
        this.removeOutsideCollaborator,
        this.unblockUser,
        this.update,
        this.updateHook,
        this.updateMembership,
    });

    final OrgsAddOrUpdateMembership addOrUpdateMembership;
    final BlockUser blockUser;
    final CheckBlockedUser checkBlockedUser;
    final CheckMembership checkMembership;
    final CheckPublicMembership checkPublicMembership;
    final ConcealMembership concealMembership;
    final ConvertMemberToOutsideCollaborator convertMemberToOutsideCollaborator;
    final OrgsCreateHook createHook;
    final CreateInvitation createInvitation;
    final OrgsDeleteHook deleteHook;
    final OrgsGet orgsGet;
    final OrgsGetHook getHook;
    final OrgsGetMembership getMembership;
    final GetMembershipForAuthenticatedUser getMembershipForAuthenticatedUser;
    final OrgsList list;
    final ListBlockedUsers listBlockedUsers;
    final OrgsListForAuthenticatedUser listForAuthenticatedUser;
    final OrgsListForUser listForUser;
    final OrgsListHooks listHooks;
    final OrgsListInstallations listInstallations;
    final ListInvitationTeams listInvitationTeams;
    final OrgsListMembers listMembers;
    final ListMemberships listMemberships;
    final ListOutsideCollaborators listOutsideCollaborators;
    final OrgsListPendingInvitations listPendingInvitations;
    final ListPublicMembers listPublicMembers;
    final OrgsPingHook pingHook;
    final PublicizeMembership publicizeMembership;
    final OrgsRemoveMember removeMember;
    final OrgsRemoveMembership removeMembership;
    final RemoveOutsideCollaborator removeOutsideCollaborator;
    final UnblockUser unblockUser;
    final OrgsUpdate update;
    final OrgsUpdateHook updateHook;
    final UpdateMembership updateMembership;

    factory Orgs.fromRawJson(String str) => Orgs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Orgs.fromJson(Map<String, dynamic> json) => Orgs(
        addOrUpdateMembership: json["addOrUpdateMembership"] == null ? null : OrgsAddOrUpdateMembership.fromJson(json["addOrUpdateMembership"]),
        blockUser: json["blockUser"] == null ? null : BlockUser.fromJson(json["blockUser"]),
        checkBlockedUser: json["checkBlockedUser"] == null ? null : CheckBlockedUser.fromJson(json["checkBlockedUser"]),
        checkMembership: json["checkMembership"] == null ? null : CheckMembership.fromJson(json["checkMembership"]),
        checkPublicMembership: json["checkPublicMembership"] == null ? null : CheckPublicMembership.fromJson(json["checkPublicMembership"]),
        concealMembership: json["concealMembership"] == null ? null : ConcealMembership.fromJson(json["concealMembership"]),
        convertMemberToOutsideCollaborator: json["convertMemberToOutsideCollaborator"] == null ? null : ConvertMemberToOutsideCollaborator.fromJson(json["convertMemberToOutsideCollaborator"]),
        createHook: json["createHook"] == null ? null : OrgsCreateHook.fromJson(json["createHook"]),
        createInvitation: json["createInvitation"] == null ? null : CreateInvitation.fromJson(json["createInvitation"]),
        deleteHook: json["deleteHook"] == null ? null : OrgsDeleteHook.fromJson(json["deleteHook"]),
        orgsGet: json["get"] == null ? null : OrgsGet.fromJson(json["get"]),
        getHook: json["getHook"] == null ? null : OrgsGetHook.fromJson(json["getHook"]),
        getMembership: json["getMembership"] == null ? null : OrgsGetMembership.fromJson(json["getMembership"]),
        getMembershipForAuthenticatedUser: json["getMembershipForAuthenticatedUser"] == null ? null : GetMembershipForAuthenticatedUser.fromJson(json["getMembershipForAuthenticatedUser"]),
        list: json["list"] == null ? null : OrgsList.fromJson(json["list"]),
        listBlockedUsers: json["listBlockedUsers"] == null ? null : ListBlockedUsers.fromJson(json["listBlockedUsers"]),
        listForAuthenticatedUser: json["listForAuthenticatedUser"] == null ? null : OrgsListForAuthenticatedUser.fromJson(json["listForAuthenticatedUser"]),
        listForUser: json["listForUser"] == null ? null : OrgsListForUser.fromJson(json["listForUser"]),
        listHooks: json["listHooks"] == null ? null : OrgsListHooks.fromJson(json["listHooks"]),
        listInstallations: json["listInstallations"] == null ? null : OrgsListInstallations.fromJson(json["listInstallations"]),
        listInvitationTeams: json["listInvitationTeams"] == null ? null : ListInvitationTeams.fromJson(json["listInvitationTeams"]),
        listMembers: json["listMembers"] == null ? null : OrgsListMembers.fromJson(json["listMembers"]),
        listMemberships: json["listMemberships"] == null ? null : ListMemberships.fromJson(json["listMemberships"]),
        listOutsideCollaborators: json["listOutsideCollaborators"] == null ? null : ListOutsideCollaborators.fromJson(json["listOutsideCollaborators"]),
        listPendingInvitations: json["listPendingInvitations"] == null ? null : OrgsListPendingInvitations.fromJson(json["listPendingInvitations"]),
        listPublicMembers: json["listPublicMembers"] == null ? null : ListPublicMembers.fromJson(json["listPublicMembers"]),
        pingHook: json["pingHook"] == null ? null : OrgsPingHook.fromJson(json["pingHook"]),
        publicizeMembership: json["publicizeMembership"] == null ? null : PublicizeMembership.fromJson(json["publicizeMembership"]),
        removeMember: json["removeMember"] == null ? null : OrgsRemoveMember.fromJson(json["removeMember"]),
        removeMembership: json["removeMembership"] == null ? null : OrgsRemoveMembership.fromJson(json["removeMembership"]),
        removeOutsideCollaborator: json["removeOutsideCollaborator"] == null ? null : RemoveOutsideCollaborator.fromJson(json["removeOutsideCollaborator"]),
        unblockUser: json["unblockUser"] == null ? null : UnblockUser.fromJson(json["unblockUser"]),
        update: json["update"] == null ? null : OrgsUpdate.fromJson(json["update"]),
        updateHook: json["updateHook"] == null ? null : OrgsUpdateHook.fromJson(json["updateHook"]),
        updateMembership: json["updateMembership"] == null ? null : UpdateMembership.fromJson(json["updateMembership"]),
    );

    Map<String, dynamic> toJson() => {
        "addOrUpdateMembership": addOrUpdateMembership == null ? null : addOrUpdateMembership.toJson(),
        "blockUser": blockUser == null ? null : blockUser.toJson(),
        "checkBlockedUser": checkBlockedUser == null ? null : checkBlockedUser.toJson(),
        "checkMembership": checkMembership == null ? null : checkMembership.toJson(),
        "checkPublicMembership": checkPublicMembership == null ? null : checkPublicMembership.toJson(),
        "concealMembership": concealMembership == null ? null : concealMembership.toJson(),
        "convertMemberToOutsideCollaborator": convertMemberToOutsideCollaborator == null ? null : convertMemberToOutsideCollaborator.toJson(),
        "createHook": createHook == null ? null : createHook.toJson(),
        "createInvitation": createInvitation == null ? null : createInvitation.toJson(),
        "deleteHook": deleteHook == null ? null : deleteHook.toJson(),
        "get": orgsGet == null ? null : orgsGet.toJson(),
        "getHook": getHook == null ? null : getHook.toJson(),
        "getMembership": getMembership == null ? null : getMembership.toJson(),
        "getMembershipForAuthenticatedUser": getMembershipForAuthenticatedUser == null ? null : getMembershipForAuthenticatedUser.toJson(),
        "list": list == null ? null : list.toJson(),
        "listBlockedUsers": listBlockedUsers == null ? null : listBlockedUsers.toJson(),
        "listForAuthenticatedUser": listForAuthenticatedUser == null ? null : listForAuthenticatedUser.toJson(),
        "listForUser": listForUser == null ? null : listForUser.toJson(),
        "listHooks": listHooks == null ? null : listHooks.toJson(),
        "listInstallations": listInstallations == null ? null : listInstallations.toJson(),
        "listInvitationTeams": listInvitationTeams == null ? null : listInvitationTeams.toJson(),
        "listMembers": listMembers == null ? null : listMembers.toJson(),
        "listMemberships": listMemberships == null ? null : listMemberships.toJson(),
        "listOutsideCollaborators": listOutsideCollaborators == null ? null : listOutsideCollaborators.toJson(),
        "listPendingInvitations": listPendingInvitations == null ? null : listPendingInvitations.toJson(),
        "listPublicMembers": listPublicMembers == null ? null : listPublicMembers.toJson(),
        "pingHook": pingHook == null ? null : pingHook.toJson(),
        "publicizeMembership": publicizeMembership == null ? null : publicizeMembership.toJson(),
        "removeMember": removeMember == null ? null : removeMember.toJson(),
        "removeMembership": removeMembership == null ? null : removeMembership.toJson(),
        "removeOutsideCollaborator": removeOutsideCollaborator == null ? null : removeOutsideCollaborator.toJson(),
        "unblockUser": unblockUser == null ? null : unblockUser.toJson(),
        "update": update == null ? null : update.toJson(),
        "updateHook": updateHook == null ? null : updateHook.toJson(),
        "updateMembership": updateMembership == null ? null : updateMembership.toJson(),
    };
}

/**
 * Only authenticated organization owners can add a member to the organization or update the
 * member's role.
 *
 * *   If the authenticated user is _adding_ a member to the organization, the invited user
 * will receive an email inviting them to the organization. The user's [membership
 * status](https://developer.github.com/v3/orgs/members/#get-organization-membership) will
 * be `pending` until they accept the invitation.
 *
 * *   Authenticated users can _update_ a user's membership by passing the `role` parameter.
 * If the authenticated user changes a member's role to `admin`, the affected user will
 * receive an email notifying them that they've been made an organization owner. If the
 * authenticated user changes an owner's role to `member`, no email will be sent.
 *
 * **Rate limits**
 *
 * To prevent abuse, the authenticated user is limited to 50 organization invitations per 24
 * hour period. If the organization is more than one month old or on a paid plan, the limit
 * is 500 invitations per 24 hour period.
 */
class OrgsAddOrUpdateMembership {
    OrgsAddOrUpdateMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsAddOrUpdateMembership.fromRawJson(String str) => OrgsAddOrUpdateMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsAddOrUpdateMembership.fromJson(Map<String, dynamic> json) => OrgsAddOrUpdateMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class BlockUser {
    BlockUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory BlockUser.fromRawJson(String str) => BlockUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BlockUser.fromJson(Map<String, dynamic> json) => BlockUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * If the user is blocked:
 *
 * If the user is not blocked:
 */
class CheckBlockedUser {
    CheckBlockedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckBlockedUser.fromRawJson(String str) => CheckBlockedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckBlockedUser.fromJson(Map<String, dynamic> json) => CheckBlockedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Check if a user is, publicly or privately, a member of the organization.
 */
class CheckMembership {
    CheckMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckMembership.fromRawJson(String str) => CheckMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckMembership.fromJson(Map<String, dynamic> json) => CheckMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class CheckPublicMembership {
    CheckPublicMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckPublicMembership.fromRawJson(String str) => CheckPublicMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckPublicMembership.fromJson(Map<String, dynamic> json) => CheckPublicMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ConcealMembership {
    ConcealMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ConcealMembership.fromRawJson(String str) => ConcealMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ConcealMembership.fromJson(Map<String, dynamic> json) => ConcealMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * When an organization member is converted to an outside collaborator, they'll only have
 * access to the repositories that their current team membership allows. The user will no
 * longer be a member of the organization. For more information, see "[Converting an
 * organization member to an outside
 * collaborator](https://help.github.com/articles/converting-an-organization-member-to-an-outside-collaborator/)".
 */
class ConvertMemberToOutsideCollaborator {
    ConvertMemberToOutsideCollaborator({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ConvertMemberToOutsideCollaborator.fromRawJson(String str) => ConvertMemberToOutsideCollaborator.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ConvertMemberToOutsideCollaborator.fromJson(Map<String, dynamic> json) => ConvertMemberToOutsideCollaborator(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Here's how you can create a hook that posts payloads in JSON format:
 */
class OrgsCreateHook {
    OrgsCreateHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsCreateHook.fromRawJson(String str) => OrgsCreateHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsCreateHook.fromJson(Map<String, dynamic> json) => OrgsCreateHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Invite people to an organization by using their GitHub user ID or their email address. In
 * order to create invitations in an organization, the authenticated user must be an
 * organization owner.
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class CreateInvitation {
    CreateInvitation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateInvitation.fromRawJson(String str) => CreateInvitation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateInvitation.fromJson(Map<String, dynamic> json) => CreateInvitation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class OrgsDeleteHook {
    OrgsDeleteHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsDeleteHook.fromRawJson(String str) => OrgsDeleteHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsDeleteHook.fromJson(Map<String, dynamic> json) => OrgsDeleteHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class OrgsGetHook {
    OrgsGetHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsGetHook.fromRawJson(String str) => OrgsGetHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsGetHook.fromJson(Map<String, dynamic> json) => OrgsGetHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * In order to get a user's membership with an organization, the authenticated user must be
 * an organization member.
 */
class OrgsGetMembership {
    OrgsGetMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsGetMembership.fromRawJson(String str) => OrgsGetMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsGetMembership.fromJson(Map<String, dynamic> json) => OrgsGetMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetMembershipForAuthenticatedUser {
    GetMembershipForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetMembershipForAuthenticatedUser.fromRawJson(String str) => GetMembershipForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetMembershipForAuthenticatedUser.fromJson(Map<String, dynamic> json) => GetMembershipForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all organizations, in the order that they were created on GitHub.
 *
 * **Note:** Pagination is powered exclusively by the `since` parameter. Use the [Link
 * header](https://developer.github.com/v3/#link-header) to get the URL for the next page of
 * organizations.
 */
class OrgsList {
    OrgsList({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsList.fromRawJson(String str) => OrgsList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsList.fromJson(Map<String, dynamic> json) => OrgsList(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List the users blocked by an organization.
 */
class ListBlockedUsers {
    ListBlockedUsers({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListBlockedUsers.fromRawJson(String str) => ListBlockedUsers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListBlockedUsers.fromJson(Map<String, dynamic> json) => ListBlockedUsers(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List organizations for the authenticated user.
 *
 * **OAuth scope requirements**
 *
 * This only lists organizations that your authorization allows you to operate on in some
 * way (e.g., you can list teams with `read:org` scope, you can publicize your organization
 * membership with `user` scope, etc.). Therefore, this API requires at least `user` or
 * `read:org` scope. OAuth requests with insufficient scope receive a `403 Forbidden`
 * response.
 */
class OrgsListForAuthenticatedUser {
    OrgsListForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsListForAuthenticatedUser.fromRawJson(String str) => OrgsListForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsListForAuthenticatedUser.fromJson(Map<String, dynamic> json) => OrgsListForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List [public organization
 * memberships](https://help.github.com/articles/publicizing-or-concealing-organization-membership)
 * for the specified user.
 *
 * This method only lists _public_ memberships, regardless of authentication. If you need to
 * fetch all of the organization memberships (public and private) for the authenticated
 * user, use the [List your
 * organizations](https://developer.github.com/v3/orgs/#list-your-organizations) API instead.
 */
class OrgsListForUser {
    OrgsListForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsListForUser.fromRawJson(String str) => OrgsListForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsListForUser.fromJson(Map<String, dynamic> json) => OrgsListForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class OrgsListHooks {
    OrgsListHooks({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsListHooks.fromRawJson(String str) => OrgsListHooks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsListHooks.fromJson(Map<String, dynamic> json) => OrgsListHooks(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all GitHub Apps in an organization. The installation count includes all GitHub Apps
 * installed on repositories in the organization. You must be an organization owner with
 * `admin:read` scope to use this endpoint.
 */
class OrgsListInstallations {
    OrgsListInstallations({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsListInstallations.fromRawJson(String str) => OrgsListInstallations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsListInstallations.fromJson(Map<String, dynamic> json) => OrgsListInstallations(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all teams associated with an invitation. In order to see invitations in an
 * organization, the authenticated user must be an organization owner.
 */
class ListInvitationTeams {
    ListInvitationTeams({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListInvitationTeams.fromRawJson(String str) => ListInvitationTeams.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListInvitationTeams.fromJson(Map<String, dynamic> json) => ListInvitationTeams(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all users who are members of an organization. If the authenticated user is also a
 * member of this organization then both concealed and public members will be returned.
 */
class OrgsListMembers {
    OrgsListMembers({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsListMembers.fromRawJson(String str) => OrgsListMembers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsListMembers.fromJson(Map<String, dynamic> json) => OrgsListMembers(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListMemberships {
    ListMemberships({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListMemberships.fromRawJson(String str) => ListMemberships.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListMemberships.fromJson(Map<String, dynamic> json) => ListMemberships(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all users who are outside collaborators of an organization.
 */
class ListOutsideCollaborators {
    ListOutsideCollaborators({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListOutsideCollaborators.fromRawJson(String str) => ListOutsideCollaborators.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListOutsideCollaborators.fromJson(Map<String, dynamic> json) => ListOutsideCollaborators(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The return hash contains a `role` field which refers to the Organization Invitation role
 * and will be one of the following values: `direct_member`, `admin`, `billing_manager`,
 * `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login`
 * field in the return hash will be `null`.
 */
class OrgsListPendingInvitations {
    OrgsListPendingInvitations({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsListPendingInvitations.fromRawJson(String str) => OrgsListPendingInvitations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsListPendingInvitations.fromJson(Map<String, dynamic> json) => OrgsListPendingInvitations(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Members of an organization can choose to have their membership publicized or not.
 */
class ListPublicMembers {
    ListPublicMembers({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPublicMembers.fromRawJson(String str) => ListPublicMembers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPublicMembers.fromJson(Map<String, dynamic> json) => ListPublicMembers(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * To see many of the organization response values, you need to be an authenticated
 * organization owner with the `admin:org` scope. When the value of
 * `two_factor_requirement_enabled` is `true`, the organization requires all members,
 * billing managers, and outside collaborators to enable [two-factor
 * authentication](https://help.github.com/articles/securing-your-account-with-two-factor-authentication-2fa/).
 *
 * GitHub Apps with the `Organization plan` permission can use this endpoint to retrieve
 * information about an organization's GitHub plan. See "[Authenticating with GitHub
 * Apps](https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/)"
 * for details. For an example response, see "[Response with GitHub plan
 * information](https://developer.github.com/v3/orgs/#response-with-github-plan-information)."
 */
class OrgsGet {
    OrgsGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsGet.fromRawJson(String str) => OrgsGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsGet.fromJson(Map<String, dynamic> json) => OrgsGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This will trigger a [ping event](https://developer.github.com/webhooks/#ping-event) to be
 * sent to the hook.
 */
class OrgsPingHook {
    OrgsPingHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsPingHook.fromRawJson(String str) => OrgsPingHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsPingHook.fromJson(Map<String, dynamic> json) => OrgsPingHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The user can publicize their own membership. (A user cannot publicize the membership for
 * another user.)
 *
 * Note that you'll need to set `Content-Length` to zero when calling out to this endpoint.
 * For more information, see "[HTTP verbs](https://developer.github.com/v3/#http-verbs)."
 */
class PublicizeMembership {
    PublicizeMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PublicizeMembership.fromRawJson(String str) => PublicizeMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PublicizeMembership.fromJson(Map<String, dynamic> json) => PublicizeMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Removing a user from this list will remove them from all teams and they will no longer
 * have any access to the organization's repositories.
 */
class OrgsRemoveMember {
    OrgsRemoveMember({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsRemoveMember.fromRawJson(String str) => OrgsRemoveMember.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsRemoveMember.fromJson(Map<String, dynamic> json) => OrgsRemoveMember(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * In order to remove a user's membership with an organization, the authenticated user must
 * be an organization owner.
 *
 * If the specified user is an active member of the organization, this will remove them from
 * the organization. If the specified user has been invited to the organization, this will
 * cancel their invitation. The specified user will receive an email notification in both
 * cases.
 */
class OrgsRemoveMembership {
    OrgsRemoveMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsRemoveMembership.fromRawJson(String str) => OrgsRemoveMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsRemoveMembership.fromJson(Map<String, dynamic> json) => OrgsRemoveMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Removing a user from this list will remove them from all the organization's repositories.
 */
class RemoveOutsideCollaborator {
    RemoveOutsideCollaborator({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveOutsideCollaborator.fromRawJson(String str) => RemoveOutsideCollaborator.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveOutsideCollaborator.fromJson(Map<String, dynamic> json) => RemoveOutsideCollaborator(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class UnblockUser {
    UnblockUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UnblockUser.fromRawJson(String str) => UnblockUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UnblockUser.fromJson(Map<String, dynamic> json) => UnblockUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Parameter Deprecation Notice:** GitHub will replace and discontinue
 * `members_allowed_repository_creation_type` in favor of more granular permissions. The new
 * input parameters are `members_can_create_public_repositories`,
 * `members_can_create_private_repositories` for all organizations and
 * `members_can_create_internal_repositories` for organizations associated with an
 * enterprise account using GitHub Enterprise Cloud. For more information, see the [blog
 * post](https://developer.github.com/changes/2019-12-03-internal-visibility-changes).
 *
 * Enables an authenticated organization owner with the `admin:org` scope to update the
 * organization's profile and member privileges.
 */
class OrgsUpdate {
    OrgsUpdate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsUpdate.fromRawJson(String str) => OrgsUpdate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsUpdate.fromJson(Map<String, dynamic> json) => OrgsUpdate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class OrgsUpdateHook {
    OrgsUpdateHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OrgsUpdateHook.fromRawJson(String str) => OrgsUpdateHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrgsUpdateHook.fromJson(Map<String, dynamic> json) => OrgsUpdateHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class UpdateMembership {
    UpdateMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateMembership.fromRawJson(String str) => UpdateMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateMembership.fromJson(Map<String, dynamic> json) => UpdateMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class OctokitPaginate {
    OctokitPaginate({
        this.iterator,
    });

    final Map<String, dynamic> iterator;

    factory OctokitPaginate.fromRawJson(String str) => OctokitPaginate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OctokitPaginate.fromJson(Map<String, dynamic> json) => OctokitPaginate(
        iterator: json["iterator"] == null ? null : Map.from(json["iterator"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "iterator": iterator == null ? null : Map.from(iterator).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Projects {
    Projects({
        this.addCollaborator,
        this.createCard,
        this.createColumn,
        this.createForAuthenticatedUser,
        this.createForOrg,
        this.createForRepo,
        this.delete,
        this.deleteCard,
        this.deleteColumn,
        this.projectsGet,
        this.getCard,
        this.getColumn,
        this.listCards,
        this.listCollaborators,
        this.listColumns,
        this.listForOrg,
        this.listForRepo,
        this.listForUser,
        this.moveCard,
        this.moveColumn,
        this.removeCollaborator,
        this.reviewUserPermissionLevel,
        this.update,
        this.updateCard,
        this.updateColumn,
    });

    final ProjectsAddCollaborator addCollaborator;
    final CreateCard createCard;
    final CreateColumn createColumn;
    final ProjectsCreateForAuthenticatedUser createForAuthenticatedUser;
    final CreateForOrg createForOrg;
    final CreateForRepo createForRepo;
    final ProjectsDelete delete;
    final DeleteCard deleteCard;
    final DeleteColumn deleteColumn;
    final ProjectsGet projectsGet;
    final GetCard getCard;
    final GetColumn getColumn;
    final ListCards listCards;
    final ProjectsListCollaborators listCollaborators;
    final ListColumns listColumns;
    final ProjectsListForOrg listForOrg;
    final ProjectsListForRepo listForRepo;
    final ProjectsListForUser listForUser;
    final MoveCard moveCard;
    final MoveColumn moveColumn;
    final ProjectsRemoveCollaborator removeCollaborator;
    final ReviewUserPermissionLevel reviewUserPermissionLevel;
    final ProjectsUpdate update;
    final UpdateCard updateCard;
    final UpdateColumn updateColumn;

    factory Projects.fromRawJson(String str) => Projects.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        addCollaborator: json["addCollaborator"] == null ? null : ProjectsAddCollaborator.fromJson(json["addCollaborator"]),
        createCard: json["createCard"] == null ? null : CreateCard.fromJson(json["createCard"]),
        createColumn: json["createColumn"] == null ? null : CreateColumn.fromJson(json["createColumn"]),
        createForAuthenticatedUser: json["createForAuthenticatedUser"] == null ? null : ProjectsCreateForAuthenticatedUser.fromJson(json["createForAuthenticatedUser"]),
        createForOrg: json["createForOrg"] == null ? null : CreateForOrg.fromJson(json["createForOrg"]),
        createForRepo: json["createForRepo"] == null ? null : CreateForRepo.fromJson(json["createForRepo"]),
        delete: json["delete"] == null ? null : ProjectsDelete.fromJson(json["delete"]),
        deleteCard: json["deleteCard"] == null ? null : DeleteCard.fromJson(json["deleteCard"]),
        deleteColumn: json["deleteColumn"] == null ? null : DeleteColumn.fromJson(json["deleteColumn"]),
        projectsGet: json["get"] == null ? null : ProjectsGet.fromJson(json["get"]),
        getCard: json["getCard"] == null ? null : GetCard.fromJson(json["getCard"]),
        getColumn: json["getColumn"] == null ? null : GetColumn.fromJson(json["getColumn"]),
        listCards: json["listCards"] == null ? null : ListCards.fromJson(json["listCards"]),
        listCollaborators: json["listCollaborators"] == null ? null : ProjectsListCollaborators.fromJson(json["listCollaborators"]),
        listColumns: json["listColumns"] == null ? null : ListColumns.fromJson(json["listColumns"]),
        listForOrg: json["listForOrg"] == null ? null : ProjectsListForOrg.fromJson(json["listForOrg"]),
        listForRepo: json["listForRepo"] == null ? null : ProjectsListForRepo.fromJson(json["listForRepo"]),
        listForUser: json["listForUser"] == null ? null : ProjectsListForUser.fromJson(json["listForUser"]),
        moveCard: json["moveCard"] == null ? null : MoveCard.fromJson(json["moveCard"]),
        moveColumn: json["moveColumn"] == null ? null : MoveColumn.fromJson(json["moveColumn"]),
        removeCollaborator: json["removeCollaborator"] == null ? null : ProjectsRemoveCollaborator.fromJson(json["removeCollaborator"]),
        reviewUserPermissionLevel: json["reviewUserPermissionLevel"] == null ? null : ReviewUserPermissionLevel.fromJson(json["reviewUserPermissionLevel"]),
        update: json["update"] == null ? null : ProjectsUpdate.fromJson(json["update"]),
        updateCard: json["updateCard"] == null ? null : UpdateCard.fromJson(json["updateCard"]),
        updateColumn: json["updateColumn"] == null ? null : UpdateColumn.fromJson(json["updateColumn"]),
    );

    Map<String, dynamic> toJson() => {
        "addCollaborator": addCollaborator == null ? null : addCollaborator.toJson(),
        "createCard": createCard == null ? null : createCard.toJson(),
        "createColumn": createColumn == null ? null : createColumn.toJson(),
        "createForAuthenticatedUser": createForAuthenticatedUser == null ? null : createForAuthenticatedUser.toJson(),
        "createForOrg": createForOrg == null ? null : createForOrg.toJson(),
        "createForRepo": createForRepo == null ? null : createForRepo.toJson(),
        "delete": delete == null ? null : delete.toJson(),
        "deleteCard": deleteCard == null ? null : deleteCard.toJson(),
        "deleteColumn": deleteColumn == null ? null : deleteColumn.toJson(),
        "get": projectsGet == null ? null : projectsGet.toJson(),
        "getCard": getCard == null ? null : getCard.toJson(),
        "getColumn": getColumn == null ? null : getColumn.toJson(),
        "listCards": listCards == null ? null : listCards.toJson(),
        "listCollaborators": listCollaborators == null ? null : listCollaborators.toJson(),
        "listColumns": listColumns == null ? null : listColumns.toJson(),
        "listForOrg": listForOrg == null ? null : listForOrg.toJson(),
        "listForRepo": listForRepo == null ? null : listForRepo.toJson(),
        "listForUser": listForUser == null ? null : listForUser.toJson(),
        "moveCard": moveCard == null ? null : moveCard.toJson(),
        "moveColumn": moveColumn == null ? null : moveColumn.toJson(),
        "removeCollaborator": removeCollaborator == null ? null : removeCollaborator.toJson(),
        "reviewUserPermissionLevel": reviewUserPermissionLevel == null ? null : reviewUserPermissionLevel.toJson(),
        "update": update == null ? null : update.toJson(),
        "updateCard": updateCard == null ? null : updateCard.toJson(),
        "updateColumn": updateColumn == null ? null : updateColumn.toJson(),
    };
}

/**
 * Adds a collaborator to a an organization project and sets their permission level. You
 * must be an organization owner or a project `admin` to add a collaborator.
 */
class ProjectsAddCollaborator {
    ProjectsAddCollaborator({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ProjectsAddCollaborator.fromRawJson(String str) => ProjectsAddCollaborator.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectsAddCollaborator.fromJson(Map<String, dynamic> json) => ProjectsAddCollaborator(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note**: GitHub's REST API v3 considers every pull request an issue, but not every issue
 * is a pull request. For this reason, "Issues" endpoints may return both issues and pull
 * requests in the response. You can identify pull requests by the `pull_request` key.
 *
 * Be aware that the `id` of a pull request returned from "Issues" endpoints will be an
 * _issue id_. To find out the pull request id, use the "[List pull
 * requests](https://developer.github.com/v3/pulls/#list-pull-requests)" endpoint.
 */
class CreateCard {
    CreateCard({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateCard.fromRawJson(String str) => CreateCard.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateCard.fromJson(Map<String, dynamic> json) => CreateCard(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class CreateColumn {
    CreateColumn({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateColumn.fromRawJson(String str) => CreateColumn.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateColumn.fromJson(Map<String, dynamic> json) => CreateColumn(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ProjectsCreateForAuthenticatedUser {
    ProjectsCreateForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ProjectsCreateForAuthenticatedUser.fromRawJson(String str) => ProjectsCreateForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectsCreateForAuthenticatedUser.fromJson(Map<String, dynamic> json) => ProjectsCreateForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates an organization project board. Returns a `404 Not Found` status if projects are
 * disabled in the organization. If you do not have sufficient privileges to perform this
 * action, a `401 Unauthorized` or `410 Gone` status is returned.
 */
class CreateForOrg {
    CreateForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForOrg.fromRawJson(String str) => CreateForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForOrg.fromJson(Map<String, dynamic> json) => CreateForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a repository project board. Returns a `404 Not Found` status if projects are
 * disabled in the repository. If you do not have sufficient privileges to perform this
 * action, a `401 Unauthorized` or `410 Gone` status is returned.
 */
class CreateForRepo {
    CreateForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForRepo.fromRawJson(String str) => CreateForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForRepo.fromJson(Map<String, dynamic> json) => CreateForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Deletes a project board. Returns a `404 Not Found` status if projects are disabled.
 */
class ProjectsDelete {
    ProjectsDelete({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ProjectsDelete.fromRawJson(String str) => ProjectsDelete.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectsDelete.fromJson(Map<String, dynamic> json) => ProjectsDelete(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeleteCard {
    DeleteCard({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteCard.fromRawJson(String str) => DeleteCard.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteCard.fromJson(Map<String, dynamic> json) => DeleteCard(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeleteColumn {
    DeleteColumn({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteColumn.fromRawJson(String str) => DeleteColumn.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteColumn.fromJson(Map<String, dynamic> json) => DeleteColumn(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetCard {
    GetCard({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetCard.fromRawJson(String str) => GetCard.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCard.fromJson(Map<String, dynamic> json) => GetCard(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetColumn {
    GetColumn({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetColumn.fromRawJson(String str) => GetColumn.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetColumn.fromJson(Map<String, dynamic> json) => GetColumn(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListCards {
    ListCards({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListCards.fromRawJson(String str) => ListCards.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListCards.fromJson(Map<String, dynamic> json) => ListCards(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the collaborators for an organization project. For a project, the list of
 * collaborators includes outside collaborators, organization members that are direct
 * collaborators, organization members with access through team memberships, organization
 * members with access through default organization permissions, and organization owners.
 * You must be an organization owner or a project `admin` to list collaborators.
 */
class ProjectsListCollaborators {
    ProjectsListCollaborators({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ProjectsListCollaborators.fromRawJson(String str) => ProjectsListCollaborators.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectsListCollaborators.fromJson(Map<String, dynamic> json) => ProjectsListCollaborators(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListColumns {
    ListColumns({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListColumns.fromRawJson(String str) => ListColumns.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListColumns.fromJson(Map<String, dynamic> json) => ListColumns(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the projects in an organization. Returns a `404 Not Found` status if projects are
 * disabled in the organization. If you do not have sufficient privileges to perform this
 * action, a `401 Unauthorized` or `410 Gone` status is returned.
 *
 * s
 */
class ProjectsListForOrg {
    ProjectsListForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ProjectsListForOrg.fromRawJson(String str) => ProjectsListForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectsListForOrg.fromJson(Map<String, dynamic> json) => ProjectsListForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the projects in a repository. Returns a `404 Not Found` status if projects are
 * disabled in the repository. If you do not have sufficient privileges to perform this
 * action, a `401 Unauthorized` or `410 Gone` status is returned.
 */
class ProjectsListForRepo {
    ProjectsListForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ProjectsListForRepo.fromRawJson(String str) => ProjectsListForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectsListForRepo.fromJson(Map<String, dynamic> json) => ProjectsListForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ProjectsListForUser {
    ProjectsListForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ProjectsListForUser.fromRawJson(String str) => ProjectsListForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectsListForUser.fromJson(Map<String, dynamic> json) => ProjectsListForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class MoveCard {
    MoveCard({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory MoveCard.fromRawJson(String str) => MoveCard.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MoveCard.fromJson(Map<String, dynamic> json) => MoveCard(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class MoveColumn {
    MoveColumn({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory MoveColumn.fromRawJson(String str) => MoveColumn.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MoveColumn.fromJson(Map<String, dynamic> json) => MoveColumn(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a project by its `id`. Returns a `404 Not Found` status if projects are disabled. If
 * you do not have sufficient privileges to perform this action, a `401 Unauthorized` or
 * `410 Gone` status is returned.
 */
class ProjectsGet {
    ProjectsGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ProjectsGet.fromRawJson(String str) => ProjectsGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectsGet.fromJson(Map<String, dynamic> json) => ProjectsGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Removes a collaborator from an organization project. You must be an organization owner or
 * a project `admin` to remove a collaborator.
 */
class ProjectsRemoveCollaborator {
    ProjectsRemoveCollaborator({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ProjectsRemoveCollaborator.fromRawJson(String str) => ProjectsRemoveCollaborator.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectsRemoveCollaborator.fromJson(Map<String, dynamic> json) => ProjectsRemoveCollaborator(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns the collaborator's permission level for an organization project. Possible values
 * for the `permission` key: `admin`, `write`, `read`, `none`. You must be an organization
 * owner or a project `admin` to review a user's permission level.
 */
class ReviewUserPermissionLevel {
    ReviewUserPermissionLevel({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReviewUserPermissionLevel.fromRawJson(String str) => ReviewUserPermissionLevel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReviewUserPermissionLevel.fromJson(Map<String, dynamic> json) => ReviewUserPermissionLevel(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Updates a project board's information. Returns a `404 Not Found` status if projects are
 * disabled. If you do not have sufficient privileges to perform this action, a `401
 * Unauthorized` or `410 Gone` status is returned.
 */
class ProjectsUpdate {
    ProjectsUpdate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ProjectsUpdate.fromRawJson(String str) => ProjectsUpdate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectsUpdate.fromJson(Map<String, dynamic> json) => ProjectsUpdate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class UpdateCard {
    UpdateCard({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateCard.fromRawJson(String str) => UpdateCard.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateCard.fromJson(Map<String, dynamic> json) => UpdateCard(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class UpdateColumn {
    UpdateColumn({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateColumn.fromRawJson(String str) => UpdateColumn.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateColumn.fromJson(Map<String, dynamic> json) => UpdateColumn(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Pulls {
    Pulls({
        this.checkIfMerged,
        this.create,
        this.createComment,
        this.createCommentReply,
        this.createFromIssue,
        this.createReview,
        this.createReviewCommentReply,
        this.createReviewRequest,
        this.deleteComment,
        this.deletePendingReview,
        this.deleteReviewRequest,
        this.dismissReview,
        this.pullsGet,
        this.getComment,
        this.getCommentsForReview,
        this.getReview,
        this.list,
        this.listComments,
        this.listCommentsForRepo,
        this.listCommits,
        this.listFiles,
        this.listReviewRequests,
        this.listReviews,
        this.merge,
        this.submitReview,
        this.update,
        this.updateBranch,
        this.updateComment,
        this.updateReview,
    });

    final CheckIfMerged checkIfMerged;
    final PullsCreate create;
    final PullsCreateComment createComment;
    final CreateCommentReply createCommentReply;
    final CreateFromIssue createFromIssue;
    final CreateReview createReview;
    final CreateReviewCommentReply createReviewCommentReply;
    final CreateReviewRequest createReviewRequest;
    final PullsDeleteComment deleteComment;
    final DeletePendingReview deletePendingReview;
    final DeleteReviewRequest deleteReviewRequest;
    final DismissReview dismissReview;
    final PullsGet pullsGet;
    final PullsGetComment getComment;
    final GetCommentsForReview getCommentsForReview;
    final GetReview getReview;
    final PullsList list;
    final PullsListComments listComments;
    final PullsListCommentsForRepo listCommentsForRepo;
    final PullsListCommits listCommits;
    final ListFiles listFiles;
    final ListReviewRequests listReviewRequests;
    final ListReviews listReviews;
    final PullsMerge merge;
    final SubmitReview submitReview;
    final PullsUpdate update;
    final UpdateBranch updateBranch;
    final PullsUpdateComment updateComment;
    final UpdateReview updateReview;

    factory Pulls.fromRawJson(String str) => Pulls.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Pulls.fromJson(Map<String, dynamic> json) => Pulls(
        checkIfMerged: json["checkIfMerged"] == null ? null : CheckIfMerged.fromJson(json["checkIfMerged"]),
        create: json["create"] == null ? null : PullsCreate.fromJson(json["create"]),
        createComment: json["createComment"] == null ? null : PullsCreateComment.fromJson(json["createComment"]),
        createCommentReply: json["createCommentReply"] == null ? null : CreateCommentReply.fromJson(json["createCommentReply"]),
        createFromIssue: json["createFromIssue"] == null ? null : CreateFromIssue.fromJson(json["createFromIssue"]),
        createReview: json["createReview"] == null ? null : CreateReview.fromJson(json["createReview"]),
        createReviewCommentReply: json["createReviewCommentReply"] == null ? null : CreateReviewCommentReply.fromJson(json["createReviewCommentReply"]),
        createReviewRequest: json["createReviewRequest"] == null ? null : CreateReviewRequest.fromJson(json["createReviewRequest"]),
        deleteComment: json["deleteComment"] == null ? null : PullsDeleteComment.fromJson(json["deleteComment"]),
        deletePendingReview: json["deletePendingReview"] == null ? null : DeletePendingReview.fromJson(json["deletePendingReview"]),
        deleteReviewRequest: json["deleteReviewRequest"] == null ? null : DeleteReviewRequest.fromJson(json["deleteReviewRequest"]),
        dismissReview: json["dismissReview"] == null ? null : DismissReview.fromJson(json["dismissReview"]),
        pullsGet: json["get"] == null ? null : PullsGet.fromJson(json["get"]),
        getComment: json["getComment"] == null ? null : PullsGetComment.fromJson(json["getComment"]),
        getCommentsForReview: json["getCommentsForReview"] == null ? null : GetCommentsForReview.fromJson(json["getCommentsForReview"]),
        getReview: json["getReview"] == null ? null : GetReview.fromJson(json["getReview"]),
        list: json["list"] == null ? null : PullsList.fromJson(json["list"]),
        listComments: json["listComments"] == null ? null : PullsListComments.fromJson(json["listComments"]),
        listCommentsForRepo: json["listCommentsForRepo"] == null ? null : PullsListCommentsForRepo.fromJson(json["listCommentsForRepo"]),
        listCommits: json["listCommits"] == null ? null : PullsListCommits.fromJson(json["listCommits"]),
        listFiles: json["listFiles"] == null ? null : ListFiles.fromJson(json["listFiles"]),
        listReviewRequests: json["listReviewRequests"] == null ? null : ListReviewRequests.fromJson(json["listReviewRequests"]),
        listReviews: json["listReviews"] == null ? null : ListReviews.fromJson(json["listReviews"]),
        merge: json["merge"] == null ? null : PullsMerge.fromJson(json["merge"]),
        submitReview: json["submitReview"] == null ? null : SubmitReview.fromJson(json["submitReview"]),
        update: json["update"] == null ? null : PullsUpdate.fromJson(json["update"]),
        updateBranch: json["updateBranch"] == null ? null : UpdateBranch.fromJson(json["updateBranch"]),
        updateComment: json["updateComment"] == null ? null : PullsUpdateComment.fromJson(json["updateComment"]),
        updateReview: json["updateReview"] == null ? null : UpdateReview.fromJson(json["updateReview"]),
    );

    Map<String, dynamic> toJson() => {
        "checkIfMerged": checkIfMerged == null ? null : checkIfMerged.toJson(),
        "create": create == null ? null : create.toJson(),
        "createComment": createComment == null ? null : createComment.toJson(),
        "createCommentReply": createCommentReply == null ? null : createCommentReply.toJson(),
        "createFromIssue": createFromIssue == null ? null : createFromIssue.toJson(),
        "createReview": createReview == null ? null : createReview.toJson(),
        "createReviewCommentReply": createReviewCommentReply == null ? null : createReviewCommentReply.toJson(),
        "createReviewRequest": createReviewRequest == null ? null : createReviewRequest.toJson(),
        "deleteComment": deleteComment == null ? null : deleteComment.toJson(),
        "deletePendingReview": deletePendingReview == null ? null : deletePendingReview.toJson(),
        "deleteReviewRequest": deleteReviewRequest == null ? null : deleteReviewRequest.toJson(),
        "dismissReview": dismissReview == null ? null : dismissReview.toJson(),
        "get": pullsGet == null ? null : pullsGet.toJson(),
        "getComment": getComment == null ? null : getComment.toJson(),
        "getCommentsForReview": getCommentsForReview == null ? null : getCommentsForReview.toJson(),
        "getReview": getReview == null ? null : getReview.toJson(),
        "list": list == null ? null : list.toJson(),
        "listComments": listComments == null ? null : listComments.toJson(),
        "listCommentsForRepo": listCommentsForRepo == null ? null : listCommentsForRepo.toJson(),
        "listCommits": listCommits == null ? null : listCommits.toJson(),
        "listFiles": listFiles == null ? null : listFiles.toJson(),
        "listReviewRequests": listReviewRequests == null ? null : listReviewRequests.toJson(),
        "listReviews": listReviews == null ? null : listReviews.toJson(),
        "merge": merge == null ? null : merge.toJson(),
        "submitReview": submitReview == null ? null : submitReview.toJson(),
        "update": update == null ? null : update.toJson(),
        "updateBranch": updateBranch == null ? null : updateBranch.toJson(),
        "updateComment": updateComment == null ? null : updateComment.toJson(),
        "updateReview": updateReview == null ? null : updateReview.toJson(),
    };
}

class CheckIfMerged {
    CheckIfMerged({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckIfMerged.fromRawJson(String str) => CheckIfMerged.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckIfMerged.fromJson(Map<String, dynamic> json) => CheckIfMerged(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Draft pull requests are available in public repositories with GitHub Free and GitHub Pro,
 * and in public and private repositories with GitHub Team and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * To open or update a pull request in a public repository, you must have write access to
 * the head or the source branch. For organization-owned repositories, you must be a member
 * of the organization that owns the repository to open or update a pull request.
 *
 * You can create a new pull request.
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class PullsCreate {
    PullsCreate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsCreate.fromRawJson(String str) => PullsCreate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsCreate.fromJson(Map<String, dynamic> json) => PullsCreate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** Multi-line comments on pull requests are currently in public beta and subject
 * to change.
 *
 * Creates a review comment in the pull request diff. To add a regular comment to a pull
 * request timeline, see
 * "[Comments](https://developer.github.com/v3/issues/comments/#create-a-comment)." We
 * recommend creating a review comment using `line`, `side`, and optionally `start_line` and
 * `start_side` if your comment applies to more than one line in the pull request diff.
 *
 * You can still create a review comment using the `position` parameter. When you use
 * `position`, the `line`, `side`, `start_line`, and `start_side` parameters are not
 * required. For more information, see [Multi-line comment
 * summary](https://developer.github.com/v3/pulls/comments/#multi-line-comment-summary-3).
 *
 * **Note:** The position value equals the number of lines down from the first "@@" hunk
 * header in the file you want to add a comment. The line just below the "@@" line is
 * position 1, the next line is position 2, and so on. The position in the diff continues to
 * increase through lines of whitespace and additional hunks until the beginning of a new
 * file.
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 *
 * **Multi-line comment summary**
 *
 * **Note:** New parameters and response fields are available for developers to preview.
 * During the preview period, these response fields may change without advance notice.
 * Please see the [blog
 * post](https://developer.github.com/changes/2019-10-03-multi-line-comments) for full
 * details.
 *
 * Use the `comfort-fade` preview header and the `line` parameter to show multi-line
 * comment-supported fields in the response.
 *
 * If you use the `comfort-fade` preview header, your response will show:
 *
 * *   For multi-line comments, values for `start_line`, `original_start_line`,
 * `start_side`, `line`, `original_line`, and `side`.
 * *   For single-line comments, values for `line`, `original_line`, and `side` and a `null`
 * value for `start_line`, `original_start_line`, and `start_side`.
 *
 * If you don't use the `comfort-fade` preview header, multi-line and single-line comments
 * will appear the same way in the response with a single `position` attribute. Your
 * response will show:
 *
 * *   For multi-line comments, the last line of the comment range for the `position`
 * attribute.
 * *   For single-line comments, the diff-positioned way of referencing comments for the
 * `position` attribute. For more information, see `position` in the [input
 * parameters](https://developer.github.com/v3/pulls/comments/#parameters-2) table.
 */
class PullsCreateComment {
    PullsCreateComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsCreateComment.fromRawJson(String str) => PullsCreateComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsCreateComment.fromJson(Map<String, dynamic> json) => PullsCreateComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** Multi-line comments on pull requests are currently in public beta and subject
 * to change.
 *
 * Creates a review comment in the pull request diff. To add a regular comment to a pull
 * request timeline, see
 * "[Comments](https://developer.github.com/v3/issues/comments/#create-a-comment)." We
 * recommend creating a review comment using `line`, `side`, and optionally `start_line` and
 * `start_side` if your comment applies to more than one line in the pull request diff.
 *
 * You can still create a review comment using the `position` parameter. When you use
 * `position`, the `line`, `side`, `start_line`, and `start_side` parameters are not
 * required. For more information, see [Multi-line comment
 * summary](https://developer.github.com/v3/pulls/comments/#multi-line-comment-summary-3).
 *
 * **Note:** The position value equals the number of lines down from the first "@@" hunk
 * header in the file you want to add a comment. The line just below the "@@" line is
 * position 1, the next line is position 2, and so on. The position in the diff continues to
 * increase through lines of whitespace and additional hunks until the beginning of a new
 * file.
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 *
 * **Multi-line comment summary**
 *
 * **Note:** New parameters and response fields are available for developers to preview.
 * During the preview period, these response fields may change without advance notice.
 * Please see the [blog
 * post](https://developer.github.com/changes/2019-10-03-multi-line-comments) for full
 * details.
 *
 * Use the `comfort-fade` preview header and the `line` parameter to show multi-line
 * comment-supported fields in the response.
 *
 * If you use the `comfort-fade` preview header, your response will show:
 *
 * *   For multi-line comments, values for `start_line`, `original_start_line`,
 * `start_side`, `line`, `original_line`, and `side`.
 * *   For single-line comments, values for `line`, `original_line`, and `side` and a `null`
 * value for `start_line`, `original_start_line`, and `start_side`.
 *
 * If you don't use the `comfort-fade` preview header, multi-line and single-line comments
 * will appear the same way in the response with a single `position` attribute. Your
 * response will show:
 *
 * *   For multi-line comments, the last line of the comment range for the `position`
 * attribute.
 * *   For single-line comments, the diff-positioned way of referencing comments for the
 * `position` attribute. For more information, see `position` in the [input
 * parameters](https://developer.github.com/v3/pulls/comments/#parameters-2) table.
 */
class CreateCommentReply {
    CreateCommentReply({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateCommentReply.fromRawJson(String str) => CreateCommentReply.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateCommentReply.fromJson(Map<String, dynamic> json) => CreateCommentReply(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class CreateFromIssue {
    CreateFromIssue({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateFromIssue.fromRawJson(String str) => CreateFromIssue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateFromIssue.fromJson(Map<String, dynamic> json) => CreateFromIssue(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 *
 * **Note:** To comment on a specific line in a file, you need to first determine the
 * _position_ of that line in the diff. The GitHub REST API v3 offers the
 * `application/vnd.github.v3.diff` [media
 * type](https://developer.github.com/v3/media/#commits-commit-comparison-and-pull-requests).
 * To see a pull request diff, add this media type to the `Accept` header of a call to the
 * [single pull request](https://developer.github.com/v3/pulls/#get-a-single-pull-request)
 * endpoint.
 *
 * The `position` value equals the number of lines down from the first "@@" hunk header in
 * the file you want to add a comment. The line just below the "@@" line is position 1, the
 * next line is position 2, and so on. The position in the diff continues to increase
 * through lines of whitespace and additional hunks until the beginning of a new file.
 */
class CreateReview {
    CreateReview({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateReview.fromRawJson(String str) => CreateReview.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateReview.fromJson(Map<String, dynamic> json) => CreateReview(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a reply to a review comment for a pull request. For the `comment_id`, provide the
 * ID of the review comment you are replying to. This must be the ID of a _top-level review
 * comment_, not a reply to that comment. Replies to replies are not supported.
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class CreateReviewCommentReply {
    CreateReviewCommentReply({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateReviewCommentReply.fromRawJson(String str) => CreateReviewCommentReply.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateReviewCommentReply.fromJson(Map<String, dynamic> json) => CreateReviewCommentReply(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class CreateReviewRequest {
    CreateReviewRequest({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateReviewRequest.fromRawJson(String str) => CreateReviewRequest.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateReviewRequest.fromJson(Map<String, dynamic> json) => CreateReviewRequest(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Deletes a review comment.
 */
class PullsDeleteComment {
    PullsDeleteComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsDeleteComment.fromRawJson(String str) => PullsDeleteComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsDeleteComment.fromJson(Map<String, dynamic> json) => PullsDeleteComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeletePendingReview {
    DeletePendingReview({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeletePendingReview.fromRawJson(String str) => DeletePendingReview.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeletePendingReview.fromJson(Map<String, dynamic> json) => DeletePendingReview(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeleteReviewRequest {
    DeleteReviewRequest({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteReviewRequest.fromRawJson(String str) => DeleteReviewRequest.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteReviewRequest.fromJson(Map<String, dynamic> json) => DeleteReviewRequest(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** To dismiss a pull request review on a [protected
 * branch](https://developer.github.com/v3/repos/branches/), you must be a repository
 * administrator or be included in the list of people or teams who can dismiss pull request
 * reviews.
 */
class DismissReview {
    DismissReview({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DismissReview.fromRawJson(String str) => DismissReview.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DismissReview.fromJson(Map<String, dynamic> json) => DismissReview(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** Multi-line comments on pull requests are currently in public beta and subject
 * to change.
 *
 * Provides details for a review comment.
 *
 * **Multi-line comment summary**
 *
 * **Note:** New parameters and response fields are available for developers to preview.
 * During the preview period, these response fields may change without advance notice.
 * Please see the [blog
 * post](https://developer.github.com/changes/2019-10-03-multi-line-comments) for full
 * details.
 *
 * Use the `comfort-fade` preview header and the `line` parameter to show multi-line
 * comment-supported fields in the response.
 *
 * If you use the `comfort-fade` preview header, your response will show:
 *
 * *   For multi-line comments, values for `start_line`, `original_start_line`,
 * `start_side`, `line`, `original_line`, and `side`.
 * *   For single-line comments, values for `line`, `original_line`, and `side` and a `null`
 * value for `start_line`, `original_start_line`, and `start_side`.
 *
 * If you don't use the `comfort-fade` preview header, multi-line and single-line comments
 * will appear the same way in the response with a single `position` attribute. Your
 * response will show:
 *
 * *   For multi-line comments, the last line of the comment range for the `position`
 * attribute.
 * *   For single-line comments, the diff-positioned way of referencing comments for the
 * `position` attribute. For more information, see `position` in the [input
 * parameters](https://developer.github.com/v3/pulls/comments/#parameters-2) table.
 *
 * The `reactions` key will have the following payload where `url` can be used to construct
 * the API location for [listing and creating](https://developer.github.com/v3/reactions)
 * reactions.
 */
class PullsGetComment {
    PullsGetComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsGetComment.fromRawJson(String str) => PullsGetComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsGetComment.fromJson(Map<String, dynamic> json) => PullsGetComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetCommentsForReview {
    GetCommentsForReview({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetCommentsForReview.fromRawJson(String str) => GetCommentsForReview.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCommentsForReview.fromJson(Map<String, dynamic> json) => GetCommentsForReview(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetReview {
    GetReview({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetReview.fromRawJson(String str) => GetReview.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetReview.fromJson(Map<String, dynamic> json) => GetReview(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Draft pull requests are available in public repositories with GitHub Free and GitHub Pro,
 * and in public and private repositories with GitHub Team and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class PullsList {
    PullsList({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsList.fromRawJson(String str) => PullsList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsList.fromJson(Map<String, dynamic> json) => PullsList(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** Multi-line comments on pull requests are currently in public beta and subject
 * to change.
 *
 * Lists review comments for a pull request. By default, review comments are in ascending
 * order by ID.
 *
 * **Multi-line comment summary**
 *
 * **Note:** New parameters and response fields are available for developers to preview.
 * During the preview period, these response fields may change without advance notice.
 * Please see the [blog
 * post](https://developer.github.com/changes/2019-10-03-multi-line-comments) for full
 * details.
 *
 * Use the `comfort-fade` preview header and the `line` parameter to show multi-line
 * comment-supported fields in the response.
 *
 * If you use the `comfort-fade` preview header, your response will show:
 *
 * *   For multi-line comments, values for `start_line`, `original_start_line`,
 * `start_side`, `line`, `original_line`, and `side`.
 * *   For single-line comments, values for `line`, `original_line`, and `side` and a `null`
 * value for `start_line`, `original_start_line`, and `start_side`.
 *
 * If you don't use the `comfort-fade` preview header, multi-line and single-line comments
 * will appear the same way in the response with a single `position` attribute. Your
 * response will show:
 *
 * *   For multi-line comments, the last line of the comment range for the `position`
 * attribute.
 * *   For single-line comments, the diff-positioned way of referencing comments for the
 * `position` attribute. For more information, see `position` in the [input
 * parameters](https://developer.github.com/v3/pulls/comments/#parameters-2) table.
 *
 * The `reactions` key will have the following payload where `url` can be used to construct
 * the API location for [listing and creating](https://developer.github.com/v3/reactions)
 * reactions.
 */
class PullsListComments {
    PullsListComments({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsListComments.fromRawJson(String str) => PullsListComments.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsListComments.fromJson(Map<String, dynamic> json) => PullsListComments(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** Multi-line comments on pull requests are currently in public beta and subject
 * to change.
 *
 * Lists review comments for all pull requests in a repository. By default, review comments
 * are in ascending order by ID.
 *
 * **Multi-line comment summary**
 *
 * **Note:** New parameters and response fields are available for developers to preview.
 * During the preview period, these response fields may change without advance notice.
 * Please see the [blog
 * post](https://developer.github.com/changes/2019-10-03-multi-line-comments) for full
 * details.
 *
 * Use the `comfort-fade` preview header and the `line` parameter to show multi-line
 * comment-supported fields in the response.
 *
 * If you use the `comfort-fade` preview header, your response will show:
 *
 * *   For multi-line comments, values for `start_line`, `original_start_line`,
 * `start_side`, `line`, `original_line`, and `side`.
 * *   For single-line comments, values for `line`, `original_line`, and `side` and a `null`
 * value for `start_line`, `original_start_line`, and `start_side`.
 *
 * If you don't use the `comfort-fade` preview header, multi-line and single-line comments
 * will appear the same way in the response with a single `position` attribute. Your
 * response will show:
 *
 * *   For multi-line comments, the last line of the comment range for the `position`
 * attribute.
 * *   For single-line comments, the diff-positioned way of referencing comments for the
 * `position` attribute. For more information, see `position` in the [input
 * parameters](https://developer.github.com/v3/pulls/comments/#parameters-2) table.
 *
 * The `reactions` key will have the following payload where `url` can be used to construct
 * the API location for [listing and creating](https://developer.github.com/v3/reactions)
 * reactions.
 */
class PullsListCommentsForRepo {
    PullsListCommentsForRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsListCommentsForRepo.fromRawJson(String str) => PullsListCommentsForRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsListCommentsForRepo.fromJson(Map<String, dynamic> json) => PullsListCommentsForRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists a maximum of 250 commits for a pull request. To receive a complete commit list for
 * pull requests with more than 250 commits, use the [Commit List
 * API](https://developer.github.com/v3/repos/commits/#list-commits-on-a-repository).
 */
class PullsListCommits {
    PullsListCommits({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsListCommits.fromRawJson(String str) => PullsListCommits.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsListCommits.fromJson(Map<String, dynamic> json) => PullsListCommits(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** Responses include a maximum of 3000 files. The paginated response returns 30
 * files per page by default.
 */
class ListFiles {
    ListFiles({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListFiles.fromRawJson(String str) => ListFiles.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListFiles.fromJson(Map<String, dynamic> json) => ListFiles(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListReviewRequests {
    ListReviewRequests({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReviewRequests.fromRawJson(String str) => ListReviewRequests.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReviewRequests.fromJson(Map<String, dynamic> json) => ListReviewRequests(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The list of reviews returns in chronological order.
 */
class ListReviews {
    ListReviews({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReviews.fromRawJson(String str) => ListReviews.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReviews.fromJson(Map<String, dynamic> json) => ListReviews(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class PullsMerge {
    PullsMerge({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsMerge.fromRawJson(String str) => PullsMerge.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsMerge.fromJson(Map<String, dynamic> json) => PullsMerge(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Draft pull requests are available in public repositories with GitHub Free and GitHub Pro,
 * and in public and private repositories with GitHub Team and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Lists details of a pull request by providing its number.
 *
 * When you get, [create](https://developer.github.com/v3/pulls/#create-a-pull-request), or
 * [edit](https://developer.github.com/v3/pulls/#update-a-pull-request) a pull request,
 * GitHub creates a merge commit to test whether the pull request can be automatically
 * merged into the base branch. This test commit is not added to the base branch or the head
 * branch. You can review the status of the test commit using the `mergeable` key. For more
 * information, see "[Checking mergeability of pull
 * requests](https://developer.github.com/v3/git/#checking-mergeability-of-pull-requests)".
 *
 * The value of the `mergeable` attribute can be `true`, `false`, or `null`. If the value is
 * `null`, then GitHub has started a background job to compute the mergeability. After
 * giving the job time to complete, resubmit the request. When the job finishes, you will
 * see a non-`null` value for the `mergeable` attribute in the response. If `mergeable` is
 * `true`, then `merge_commit_sha` will be the SHA of the _test_ merge commit.
 *
 * The value of the `merge_commit_sha` attribute changes depending on the state of the pull
 * request. Before merging a pull request, the `merge_commit_sha` attribute holds the SHA of
 * the _test_ merge commit. After merging a pull request, the `merge_commit_sha` attribute
 * changes depending on how you merged the pull request:
 *
 * *   If merged as a [merge
 * commit](https://help.github.com/articles/about-merge-methods-on-github/),
 * `merge_commit_sha` represents the SHA of the merge commit.
 * *   If merged via a
 * [squash](https://help.github.com/articles/about-merge-methods-on-github/#squashing-your-merge-commits),
 * `merge_commit_sha` represents the SHA of the squashed commit on the base branch.
 * *   If
 * [rebased](https://help.github.com/articles/about-merge-methods-on-github/#rebasing-and-merging-your-commits),
 * `merge_commit_sha` represents the commit that the base branch was updated to.
 *
 * Pass the appropriate [media
 * type](https://developer.github.com/v3/media/#commits-commit-comparison-and-pull-requests)
 * to fetch diff and patch formats.
 */
class PullsGet {
    PullsGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsGet.fromRawJson(String str) => PullsGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsGet.fromJson(Map<String, dynamic> json) => PullsGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class SubmitReview {
    SubmitReview({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory SubmitReview.fromRawJson(String str) => SubmitReview.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubmitReview.fromJson(Map<String, dynamic> json) => SubmitReview(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Draft pull requests are available in public repositories with GitHub Free and GitHub Pro,
 * and in public and private repositories with GitHub Team and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * To open or update a pull request in a public repository, you must have write access to
 * the head or the source branch. For organization-owned repositories, you must be a member
 * of the organization that owns the repository to open or update a pull request.
 */
class PullsUpdate {
    PullsUpdate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsUpdate.fromRawJson(String str) => PullsUpdate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsUpdate.fromJson(Map<String, dynamic> json) => PullsUpdate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Updates the pull request branch with the latest upstream changes by merging HEAD from the
 * base branch into the pull request branch.
 */
class UpdateBranch {
    UpdateBranch({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateBranch.fromRawJson(String str) => UpdateBranch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateBranch.fromJson(Map<String, dynamic> json) => UpdateBranch(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** Multi-line comments on pull requests are currently in public beta and subject
 * to change.
 *
 * Enables you to edit a review comment.
 *
 * **Multi-line comment summary**
 *
 * **Note:** New parameters and response fields are available for developers to preview.
 * During the preview period, these response fields may change without advance notice.
 * Please see the [blog
 * post](https://developer.github.com/changes/2019-10-03-multi-line-comments) for full
 * details.
 *
 * Use the `comfort-fade` preview header and the `line` parameter to show multi-line
 * comment-supported fields in the response.
 *
 * If you use the `comfort-fade` preview header, your response will show:
 *
 * *   For multi-line comments, values for `start_line`, `original_start_line`,
 * `start_side`, `line`, `original_line`, and `side`.
 * *   For single-line comments, values for `line`, `original_line`, and `side` and a `null`
 * value for `start_line`, `original_start_line`, and `start_side`.
 *
 * If you don't use the `comfort-fade` preview header, multi-line and single-line comments
 * will appear the same way in the response with a single `position` attribute. Your
 * response will show:
 *
 * *   For multi-line comments, the last line of the comment range for the `position`
 * attribute.
 * *   For single-line comments, the diff-positioned way of referencing comments for the
 * `position` attribute. For more information, see `position` in the [input
 * parameters](https://developer.github.com/v3/pulls/comments/#parameters-2) table.
 */
class PullsUpdateComment {
    PullsUpdateComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory PullsUpdateComment.fromRawJson(String str) => PullsUpdateComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PullsUpdateComment.fromJson(Map<String, dynamic> json) => PullsUpdateComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Update the review summary comment with new text.
 */
class UpdateReview {
    UpdateReview({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateReview.fromRawJson(String str) => UpdateReview.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateReview.fromJson(Map<String, dynamic> json) => UpdateReview(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class RateLimit {
    RateLimit({
        this.rateLimitGet,
    });

    final RateLimitGet rateLimitGet;

    factory RateLimit.fromRawJson(String str) => RateLimit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit(
        rateLimitGet: json["get"] == null ? null : RateLimitGet.fromJson(json["get"]),
    );

    Map<String, dynamic> toJson() => {
        "get": rateLimitGet == null ? null : rateLimitGet.toJson(),
    };
}

/**
 * **Note:** Accessing this endpoint does not count against your REST API rate limit.
 *
 * **Understanding your rate limit status**
 *
 * The Search API has a [custom rate
 * limit](https://developer.github.com/v3/search/#rate-limit), separate from the rate limit
 * governing the rest of the REST API. The GraphQL API also has a [custom rate
 * limit](https://developer.github.com/v4/guides/resource-limitations/#rate-limit) that is
 * separate from and calculated differently than rate limits in the REST API.
 *
 * For these reasons, the Rate Limit API response categorizes your rate limit. Under
 * `resources`, you'll see four objects:
 *
 * *   The `core` object provides your rate limit status for all non-search-related
 * resources in the REST API.
 * *   The `search` object provides your rate limit status for the [Search
 * API](https://developer.github.com/v3/search/).
 * *   The `graphql` object provides your rate limit status for the [GraphQL
 * API](https://developer.github.com/v4/).
 * *   The `integration_manifest` object provides your rate limit status for the [GitHub App
 * Manifest code
 * conversion](https://developer.github.com/apps/building-github-apps/creating-github-apps-from-a-manifest/#3-you-exchange-the-temporary-code-to-retrieve-the-app-configuration)
 * endpoint.
 *
 * For more information on the headers and values in the rate limit response, see "[Rate
 * limiting](https://developer.github.com/v3/#rate-limiting)."
 *
 * The `rate` object (shown at the bottom of the response above) is deprecated.
 *
 * If you're writing new API client code or updating existing code, you should use the
 * `core` object instead of the `rate` object. The `core` object contains the same
 * information that is present in the `rate` object.
 */
class RateLimitGet {
    RateLimitGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RateLimitGet.fromRawJson(String str) => RateLimitGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RateLimitGet.fromJson(Map<String, dynamic> json) => RateLimitGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Reactions {
    Reactions({
        this.createForCommitComment,
        this.createForIssue,
        this.createForIssueComment,
        this.createForPullRequestReviewComment,
        this.createForTeamDiscussion,
        this.createForTeamDiscussionComment,
        this.createForTeamDiscussionCommentInOrg,
        this.createForTeamDiscussionCommentLegacy,
        this.createForTeamDiscussionInOrg,
        this.createForTeamDiscussionLegacy,
        this.delete,
        this.listForCommitComment,
        this.listForIssue,
        this.listForIssueComment,
        this.listForPullRequestReviewComment,
        this.listForTeamDiscussion,
        this.listForTeamDiscussionComment,
        this.listForTeamDiscussionCommentInOrg,
        this.listForTeamDiscussionCommentLegacy,
        this.listForTeamDiscussionInOrg,
        this.listForTeamDiscussionLegacy,
    });

    final CreateForCommitComment createForCommitComment;
    final CreateForIssue createForIssue;
    final CreateForIssueComment createForIssueComment;
    final CreateForPullRequestReviewComment createForPullRequestReviewComment;
    final CreateForTeamDiscussion createForTeamDiscussion;
    final CreateForTeamDiscussionComment createForTeamDiscussionComment;
    final CreateForTeamDiscussionCommentInOrg createForTeamDiscussionCommentInOrg;
    final CreateForTeamDiscussionCommentLegacy createForTeamDiscussionCommentLegacy;
    final CreateForTeamDiscussionInOrg createForTeamDiscussionInOrg;
    final CreateForTeamDiscussionLegacy createForTeamDiscussionLegacy;
    final ReactionsDelete delete;
    final ListForCommitComment listForCommitComment;
    final ListForIssue listForIssue;
    final ListForIssueComment listForIssueComment;
    final ListForPullRequestReviewComment listForPullRequestReviewComment;
    final ListForTeamDiscussion listForTeamDiscussion;
    final ListForTeamDiscussionComment listForTeamDiscussionComment;
    final ListForTeamDiscussionCommentInOrg listForTeamDiscussionCommentInOrg;
    final ListForTeamDiscussionCommentLegacy listForTeamDiscussionCommentLegacy;
    final ListForTeamDiscussionInOrg listForTeamDiscussionInOrg;
    final ListForTeamDiscussionLegacy listForTeamDiscussionLegacy;

    factory Reactions.fromRawJson(String str) => Reactions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        createForCommitComment: json["createForCommitComment"] == null ? null : CreateForCommitComment.fromJson(json["createForCommitComment"]),
        createForIssue: json["createForIssue"] == null ? null : CreateForIssue.fromJson(json["createForIssue"]),
        createForIssueComment: json["createForIssueComment"] == null ? null : CreateForIssueComment.fromJson(json["createForIssueComment"]),
        createForPullRequestReviewComment: json["createForPullRequestReviewComment"] == null ? null : CreateForPullRequestReviewComment.fromJson(json["createForPullRequestReviewComment"]),
        createForTeamDiscussion: json["createForTeamDiscussion"] == null ? null : CreateForTeamDiscussion.fromJson(json["createForTeamDiscussion"]),
        createForTeamDiscussionComment: json["createForTeamDiscussionComment"] == null ? null : CreateForTeamDiscussionComment.fromJson(json["createForTeamDiscussionComment"]),
        createForTeamDiscussionCommentInOrg: json["createForTeamDiscussionCommentInOrg"] == null ? null : CreateForTeamDiscussionCommentInOrg.fromJson(json["createForTeamDiscussionCommentInOrg"]),
        createForTeamDiscussionCommentLegacy: json["createForTeamDiscussionCommentLegacy"] == null ? null : CreateForTeamDiscussionCommentLegacy.fromJson(json["createForTeamDiscussionCommentLegacy"]),
        createForTeamDiscussionInOrg: json["createForTeamDiscussionInOrg"] == null ? null : CreateForTeamDiscussionInOrg.fromJson(json["createForTeamDiscussionInOrg"]),
        createForTeamDiscussionLegacy: json["createForTeamDiscussionLegacy"] == null ? null : CreateForTeamDiscussionLegacy.fromJson(json["createForTeamDiscussionLegacy"]),
        delete: json["delete"] == null ? null : ReactionsDelete.fromJson(json["delete"]),
        listForCommitComment: json["listForCommitComment"] == null ? null : ListForCommitComment.fromJson(json["listForCommitComment"]),
        listForIssue: json["listForIssue"] == null ? null : ListForIssue.fromJson(json["listForIssue"]),
        listForIssueComment: json["listForIssueComment"] == null ? null : ListForIssueComment.fromJson(json["listForIssueComment"]),
        listForPullRequestReviewComment: json["listForPullRequestReviewComment"] == null ? null : ListForPullRequestReviewComment.fromJson(json["listForPullRequestReviewComment"]),
        listForTeamDiscussion: json["listForTeamDiscussion"] == null ? null : ListForTeamDiscussion.fromJson(json["listForTeamDiscussion"]),
        listForTeamDiscussionComment: json["listForTeamDiscussionComment"] == null ? null : ListForTeamDiscussionComment.fromJson(json["listForTeamDiscussionComment"]),
        listForTeamDiscussionCommentInOrg: json["listForTeamDiscussionCommentInOrg"] == null ? null : ListForTeamDiscussionCommentInOrg.fromJson(json["listForTeamDiscussionCommentInOrg"]),
        listForTeamDiscussionCommentLegacy: json["listForTeamDiscussionCommentLegacy"] == null ? null : ListForTeamDiscussionCommentLegacy.fromJson(json["listForTeamDiscussionCommentLegacy"]),
        listForTeamDiscussionInOrg: json["listForTeamDiscussionInOrg"] == null ? null : ListForTeamDiscussionInOrg.fromJson(json["listForTeamDiscussionInOrg"]),
        listForTeamDiscussionLegacy: json["listForTeamDiscussionLegacy"] == null ? null : ListForTeamDiscussionLegacy.fromJson(json["listForTeamDiscussionLegacy"]),
    );

    Map<String, dynamic> toJson() => {
        "createForCommitComment": createForCommitComment == null ? null : createForCommitComment.toJson(),
        "createForIssue": createForIssue == null ? null : createForIssue.toJson(),
        "createForIssueComment": createForIssueComment == null ? null : createForIssueComment.toJson(),
        "createForPullRequestReviewComment": createForPullRequestReviewComment == null ? null : createForPullRequestReviewComment.toJson(),
        "createForTeamDiscussion": createForTeamDiscussion == null ? null : createForTeamDiscussion.toJson(),
        "createForTeamDiscussionComment": createForTeamDiscussionComment == null ? null : createForTeamDiscussionComment.toJson(),
        "createForTeamDiscussionCommentInOrg": createForTeamDiscussionCommentInOrg == null ? null : createForTeamDiscussionCommentInOrg.toJson(),
        "createForTeamDiscussionCommentLegacy": createForTeamDiscussionCommentLegacy == null ? null : createForTeamDiscussionCommentLegacy.toJson(),
        "createForTeamDiscussionInOrg": createForTeamDiscussionInOrg == null ? null : createForTeamDiscussionInOrg.toJson(),
        "createForTeamDiscussionLegacy": createForTeamDiscussionLegacy == null ? null : createForTeamDiscussionLegacy.toJson(),
        "delete": delete == null ? null : delete.toJson(),
        "listForCommitComment": listForCommitComment == null ? null : listForCommitComment.toJson(),
        "listForIssue": listForIssue == null ? null : listForIssue.toJson(),
        "listForIssueComment": listForIssueComment == null ? null : listForIssueComment.toJson(),
        "listForPullRequestReviewComment": listForPullRequestReviewComment == null ? null : listForPullRequestReviewComment.toJson(),
        "listForTeamDiscussion": listForTeamDiscussion == null ? null : listForTeamDiscussion.toJson(),
        "listForTeamDiscussionComment": listForTeamDiscussionComment == null ? null : listForTeamDiscussionComment.toJson(),
        "listForTeamDiscussionCommentInOrg": listForTeamDiscussionCommentInOrg == null ? null : listForTeamDiscussionCommentInOrg.toJson(),
        "listForTeamDiscussionCommentLegacy": listForTeamDiscussionCommentLegacy == null ? null : listForTeamDiscussionCommentLegacy.toJson(),
        "listForTeamDiscussionInOrg": listForTeamDiscussionInOrg == null ? null : listForTeamDiscussionInOrg.toJson(),
        "listForTeamDiscussionLegacy": listForTeamDiscussionLegacy == null ? null : listForTeamDiscussionLegacy.toJson(),
    };
}

/**
 * Create a reaction to a [commit comment](https://developer.github.com/v3/repos/comments/).
 * A response with a `Status: 200 OK` means that you already added the reaction type to this
 * commit comment.
 */
class CreateForCommitComment {
    CreateForCommitComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForCommitComment.fromRawJson(String str) => CreateForCommitComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForCommitComment.fromJson(Map<String, dynamic> json) => CreateForCommitComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Create a reaction to an [issue](https://developer.github.com/v3/issues/). A response with
 * a `Status: 200 OK` means that you already added the reaction type to this issue.
 */
class CreateForIssue {
    CreateForIssue({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForIssue.fromRawJson(String str) => CreateForIssue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForIssue.fromJson(Map<String, dynamic> json) => CreateForIssue(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Create a reaction to an [issue
 * comment](https://developer.github.com/v3/issues/comments/). A response with a `Status:
 * 200 OK` means that you already added the reaction type to this issue comment.
 */
class CreateForIssueComment {
    CreateForIssueComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForIssueComment.fromRawJson(String str) => CreateForIssueComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForIssueComment.fromJson(Map<String, dynamic> json) => CreateForIssueComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Create a reaction to a [pull request review
 * comment](https://developer.github.com/v3/pulls/comments/). A response with a `Status: 200
 * OK` means that you already added the reaction type to this pull request review comment.
 */
class CreateForPullRequestReviewComment {
    CreateForPullRequestReviewComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForPullRequestReviewComment.fromRawJson(String str) => CreateForPullRequestReviewComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForPullRequestReviewComment.fromJson(Map<String, dynamic> json) => CreateForPullRequestReviewComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Create reaction for
 * a team
 * discussion`](https://developer.github.com/v3/reactions/#create-reaction-for-a-team-discussion)
 * endpoint.
 *
 * Create a reaction to a [team
 * discussion](https://developer.github.com/v3/teams/discussions/). OAuth access tokens
 * require the `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 * A response with a `Status: 200 OK` means that you already added the reaction type to this
 * team discussion.
 */
class CreateForTeamDiscussion {
    CreateForTeamDiscussion({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForTeamDiscussion.fromRawJson(String str) => CreateForTeamDiscussion.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForTeamDiscussion.fromJson(Map<String, dynamic> json) => CreateForTeamDiscussion(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Create reaction for
 * a team discussion
 * comment`](https://developer.github.com/v3/reactions/#create-reaction-for-a-team-discussion-comment)
 * endpoint.
 *
 * Create a reaction to a [team discussion
 * comment](https://developer.github.com/v3/teams/discussion_comments/). OAuth access tokens
 * require the `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 * A response with a `Status: 200 OK` means that you already added the reaction type to this
 * team discussion comment.
 */
class CreateForTeamDiscussionComment {
    CreateForTeamDiscussionComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForTeamDiscussionComment.fromRawJson(String str) => CreateForTeamDiscussionComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForTeamDiscussionComment.fromJson(Map<String, dynamic> json) => CreateForTeamDiscussionComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Create a reaction to a [team discussion
 * comment](https://developer.github.com/v3/teams/discussion_comments/). OAuth access tokens
 * require the `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 * A response with a `Status: 200 OK` means that you already added the reaction type to this
 * team discussion comment.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `POST
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number/reactions`.
 */
class CreateForTeamDiscussionCommentInOrg {
    CreateForTeamDiscussionCommentInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForTeamDiscussionCommentInOrg.fromRawJson(String str) => CreateForTeamDiscussionCommentInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForTeamDiscussionCommentInOrg.fromJson(Map<String, dynamic> json) => CreateForTeamDiscussionCommentInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Create reaction for
 * a team discussion
 * comment`](https://developer.github.com/v3/reactions/#create-reaction-for-a-team-discussion-comment)
 * endpoint.
 *
 * Create a reaction to a [team discussion
 * comment](https://developer.github.com/v3/teams/discussion_comments/). OAuth access tokens
 * require the `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 * A response with a `Status: 200 OK` means that you already added the reaction type to this
 * team discussion comment.
 */
class CreateForTeamDiscussionCommentLegacy {
    CreateForTeamDiscussionCommentLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForTeamDiscussionCommentLegacy.fromRawJson(String str) => CreateForTeamDiscussionCommentLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForTeamDiscussionCommentLegacy.fromJson(Map<String, dynamic> json) => CreateForTeamDiscussionCommentLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Create a reaction to a [team
 * discussion](https://developer.github.com/v3/teams/discussions/). OAuth access tokens
 * require the `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 * A response with a `Status: 200 OK` means that you already added the reaction type to this
 * team discussion.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `POST
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number/reactions`.
 */
class CreateForTeamDiscussionInOrg {
    CreateForTeamDiscussionInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForTeamDiscussionInOrg.fromRawJson(String str) => CreateForTeamDiscussionInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForTeamDiscussionInOrg.fromJson(Map<String, dynamic> json) => CreateForTeamDiscussionInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Create reaction for
 * a team
 * discussion`](https://developer.github.com/v3/reactions/#create-reaction-for-a-team-discussion)
 * endpoint.
 *
 * Create a reaction to a [team
 * discussion](https://developer.github.com/v3/teams/discussions/). OAuth access tokens
 * require the `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 * A response with a `Status: 200 OK` means that you already added the reaction type to this
 * team discussion.
 */
class CreateForTeamDiscussionLegacy {
    CreateForTeamDiscussionLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateForTeamDiscussionLegacy.fromRawJson(String str) => CreateForTeamDiscussionLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateForTeamDiscussionLegacy.fromJson(Map<String, dynamic> json) => CreateForTeamDiscussionLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * OAuth access tokens require the `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/),
 * when deleting a [team discussion](https://developer.github.com/v3/teams/discussions/) or
 * [team discussion comment](https://developer.github.com/v3/teams/discussion_comments/).
 */
class ReactionsDelete {
    ReactionsDelete({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReactionsDelete.fromRawJson(String str) => ReactionsDelete.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReactionsDelete.fromJson(Map<String, dynamic> json) => ReactionsDelete(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List the reactions to a [commit comment](https://developer.github.com/v3/repos/comments/).
 */
class ListForCommitComment {
    ListForCommitComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForCommitComment.fromRawJson(String str) => ListForCommitComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForCommitComment.fromJson(Map<String, dynamic> json) => ListForCommitComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List the reactions to an [issue](https://developer.github.com/v3/issues/).
 */
class ListForIssue {
    ListForIssue({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForIssue.fromRawJson(String str) => ListForIssue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForIssue.fromJson(Map<String, dynamic> json) => ListForIssue(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List the reactions to an [issue
 * comment](https://developer.github.com/v3/issues/comments/).
 */
class ListForIssueComment {
    ListForIssueComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForIssueComment.fromRawJson(String str) => ListForIssueComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForIssueComment.fromJson(Map<String, dynamic> json) => ListForIssueComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List the reactions to a [pull request review
 * comment](https://developer.github.com/v3/pulls/comments/).
 */
class ListForPullRequestReviewComment {
    ListForPullRequestReviewComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForPullRequestReviewComment.fromRawJson(String str) => ListForPullRequestReviewComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForPullRequestReviewComment.fromJson(Map<String, dynamic> json) => ListForPullRequestReviewComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List reactions for
 * a team
 * discussion`](https://developer.github.com/v3/reactions/#list-reactions-for-a-team-discussion)
 * endpoint.
 *
 * List the reactions to a [team
 * discussion](https://developer.github.com/v3/teams/discussions/). OAuth access tokens
 * require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class ListForTeamDiscussion {
    ListForTeamDiscussion({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForTeamDiscussion.fromRawJson(String str) => ListForTeamDiscussion.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForTeamDiscussion.fromJson(Map<String, dynamic> json) => ListForTeamDiscussion(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List reactions for
 * a team discussion
 * comment`](https://developer.github.com/v3/reactions/#list-reactions-for-a-team-discussion-comment)
 * endpoint.
 *
 * List the reactions to a [team discussion
 * comment](https://developer.github.com/v3/teams/discussion_comments/). OAuth access tokens
 * require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class ListForTeamDiscussionComment {
    ListForTeamDiscussionComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForTeamDiscussionComment.fromRawJson(String str) => ListForTeamDiscussionComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForTeamDiscussionComment.fromJson(Map<String, dynamic> json) => ListForTeamDiscussionComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List the reactions to a [team discussion
 * comment](https://developer.github.com/v3/teams/discussion_comments/). OAuth access tokens
 * require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number/reactions`.
 */
class ListForTeamDiscussionCommentInOrg {
    ListForTeamDiscussionCommentInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForTeamDiscussionCommentInOrg.fromRawJson(String str) => ListForTeamDiscussionCommentInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForTeamDiscussionCommentInOrg.fromJson(Map<String, dynamic> json) => ListForTeamDiscussionCommentInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List reactions for
 * a team discussion
 * comment`](https://developer.github.com/v3/reactions/#list-reactions-for-a-team-discussion-comment)
 * endpoint.
 *
 * List the reactions to a [team discussion
 * comment](https://developer.github.com/v3/teams/discussion_comments/). OAuth access tokens
 * require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class ListForTeamDiscussionCommentLegacy {
    ListForTeamDiscussionCommentLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForTeamDiscussionCommentLegacy.fromRawJson(String str) => ListForTeamDiscussionCommentLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForTeamDiscussionCommentLegacy.fromJson(Map<String, dynamic> json) => ListForTeamDiscussionCommentLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List the reactions to a [team
 * discussion](https://developer.github.com/v3/teams/discussions/). OAuth access tokens
 * require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number/reactions`.
 */
class ListForTeamDiscussionInOrg {
    ListForTeamDiscussionInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForTeamDiscussionInOrg.fromRawJson(String str) => ListForTeamDiscussionInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForTeamDiscussionInOrg.fromJson(Map<String, dynamic> json) => ListForTeamDiscussionInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List reactions for
 * a team
 * discussion`](https://developer.github.com/v3/reactions/#list-reactions-for-a-team-discussion)
 * endpoint.
 *
 * List the reactions to a [team
 * discussion](https://developer.github.com/v3/teams/discussions/). OAuth access tokens
 * require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class ListForTeamDiscussionLegacy {
    ListForTeamDiscussionLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListForTeamDiscussionLegacy.fromRawJson(String str) => ListForTeamDiscussionLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListForTeamDiscussionLegacy.fromJson(Map<String, dynamic> json) => ListForTeamDiscussionLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ApiRepos {
    ApiRepos({
        this.acceptInvitation,
        this.addCollaborator,
        this.addDeployKey,
        this.addProtectedBranchAdminEnforcement,
        this.addProtectedBranchAppRestrictions,
        this.addProtectedBranchRequiredSignatures,
        this.addProtectedBranchRequiredStatusChecksContexts,
        this.addProtectedBranchTeamRestrictions,
        this.addProtectedBranchUserRestrictions,
        this.checkCollaborator,
        this.checkVulnerabilityAlerts,
        this.compareCommits,
        this.createCommitComment,
        this.createDeployment,
        this.createDeploymentStatus,
        this.createDispatchEvent,
        this.createFile,
        this.createForAuthenticatedUser,
        this.createFork,
        this.createHook,
        this.createInOrg,
        this.createOrUpdateFile,
        this.createRelease,
        this.createStatus,
        this.createUsingTemplate,
        this.declineInvitation,
        this.delete,
        this.deleteCommitComment,
        this.deleteDownload,
        this.deleteFile,
        this.deleteHook,
        this.deleteInvitation,
        this.deleteRelease,
        this.deleteReleaseAsset,
        this.disableAutomatedSecurityFixes,
        this.disablePagesSite,
        this.disableVulnerabilityAlerts,
        this.enableAutomatedSecurityFixes,
        this.enablePagesSite,
        this.enableVulnerabilityAlerts,
        this.reposGet,
        this.getAppsWithAccessToProtectedBranch,
        this.getArchiveLink,
        this.getBranch,
        this.getBranchProtection,
        this.getClones,
        this.getCodeFrequencyStats,
        this.getCollaboratorPermissionLevel,
        this.getCombinedStatusForRef,
        this.getCommit,
        this.getCommitActivityStats,
        this.getCommitComment,
        this.getCommitRefSha,
        this.getContents,
        this.getContributorsStats,
        this.getDeployKey,
        this.getDeployment,
        this.getDeploymentStatus,
        this.getDownload,
        this.getHook,
        this.getLatestPagesBuild,
        this.getLatestRelease,
        this.getPages,
        this.getPagesBuild,
        this.getParticipationStats,
        this.getProtectedBranchAdminEnforcement,
        this.getProtectedBranchPullRequestReviewEnforcement,
        this.getProtectedBranchRequiredSignatures,
        this.getProtectedBranchRequiredStatusChecks,
        this.getProtectedBranchRestrictions,
        this.getPunchCardStats,
        this.getReadme,
        this.getRelease,
        this.getReleaseAsset,
        this.getReleaseByTag,
        this.getTeamsWithAccessToProtectedBranch,
        this.getTopPaths,
        this.getTopReferrers,
        this.getUsersWithAccessToProtectedBranch,
        this.getViews,
        this.list,
        this.listAppsWithAccessToProtectedBranch,
        this.listAssetsForRelease,
        this.listBranches,
        this.listBranchesForHeadCommit,
        this.listCollaborators,
        this.listCommentsForCommit,
        this.listCommitComments,
        this.listCommits,
        this.listContributors,
        this.listDeployKeys,
        this.listDeployments,
        this.listDeploymentStatuses,
        this.listDownloads,
        this.listForks,
        this.listForOrg,
        this.listForUser,
        this.listHooks,
        this.listInvitations,
        this.listInvitationsForAuthenticatedUser,
        this.listLanguages,
        this.listPagesBuilds,
        this.listProtectedBranchRequiredStatusChecksContexts,
        this.listProtectedBranchTeamRestrictions,
        this.listProtectedBranchUserRestrictions,
        this.listPublic,
        this.listPullRequestsAssociatedWithCommit,
        this.listReleases,
        this.listStatusesForRef,
        this.listTags,
        this.listTeams,
        this.listTeamsWithAccessToProtectedBranch,
        this.listTopics,
        this.listUsersWithAccessToProtectedBranch,
        this.merge,
        this.pingHook,
        this.removeBranchProtection,
        this.removeCollaborator,
        this.removeDeployKey,
        this.removeProtectedBranchAdminEnforcement,
        this.removeProtectedBranchAppRestrictions,
        this.removeProtectedBranchPullRequestReviewEnforcement,
        this.removeProtectedBranchRequiredSignatures,
        this.removeProtectedBranchRequiredStatusChecks,
        this.removeProtectedBranchRequiredStatusChecksContexts,
        this.removeProtectedBranchRestrictions,
        this.removeProtectedBranchTeamRestrictions,
        this.removeProtectedBranchUserRestrictions,
        this.replaceProtectedBranchAppRestrictions,
        this.replaceProtectedBranchRequiredStatusChecksContexts,
        this.replaceProtectedBranchTeamRestrictions,
        this.replaceProtectedBranchUserRestrictions,
        this.replaceTopics,
        this.requestPageBuild,
        this.retrieveCommunityProfileMetrics,
        this.testPushHook,
        this.transfer,
        this.update,
        this.updateBranchProtection,
        this.updateCommitComment,
        this.updateFile,
        this.updateHook,
        this.updateInformationAboutPagesSite,
        this.updateInvitation,
        this.updateProtectedBranchPullRequestReviewEnforcement,
        this.updateProtectedBranchRequiredStatusChecks,
        this.updateRelease,
        this.updateReleaseAsset,
        this.uploadReleaseAsset,
    });

    final AcceptInvitation acceptInvitation;
    final ReposAddCollaborator addCollaborator;
    final AddDeployKey addDeployKey;
    final AddProtectedBranchAdminEnforcement addProtectedBranchAdminEnforcement;
    final AddProtectedBranchAppRestrictions addProtectedBranchAppRestrictions;
    final AddProtectedBranchRequiredSignatures addProtectedBranchRequiredSignatures;
    final AddProtectedBranchRequiredStatusChecksContexts addProtectedBranchRequiredStatusChecksContexts;
    final AddProtectedBranchTeamRestrictions addProtectedBranchTeamRestrictions;
    final AddProtectedBranchUserRestrictions addProtectedBranchUserRestrictions;
    final CheckCollaborator checkCollaborator;
    final CheckVulnerabilityAlerts checkVulnerabilityAlerts;
    final CompareCommits compareCommits;
    final CreateCommitComment createCommitComment;
    final CreateDeployment createDeployment;
    final CreateDeploymentStatus createDeploymentStatus;
    final CreateDispatchEvent createDispatchEvent;
    final CreateFile createFile;
    final ReposCreateForAuthenticatedUser createForAuthenticatedUser;
    final CreateFork createFork;
    final ReposCreateHook createHook;
    final CreateInOrg createInOrg;
    final CreateOrUpdateFile createOrUpdateFile;
    final CreateRelease createRelease;
    final CreateStatus createStatus;
    final CreateUsingTemplate createUsingTemplate;
    final DeclineInvitation declineInvitation;
    final ReposDelete delete;
    final DeleteCommitComment deleteCommitComment;
    final DeleteDownload deleteDownload;
    final DeleteFile deleteFile;
    final ReposDeleteHook deleteHook;
    final DeleteInvitation deleteInvitation;
    final DeleteRelease deleteRelease;
    final DeleteReleaseAsset deleteReleaseAsset;
    final DisableAutomatedSecurityFixes disableAutomatedSecurityFixes;
    final DisablePagesSite disablePagesSite;
    final DisableVulnerabilityAlerts disableVulnerabilityAlerts;
    final EnableAutomatedSecurityFixes enableAutomatedSecurityFixes;
    final EnablePagesSite enablePagesSite;
    final EnableVulnerabilityAlerts enableVulnerabilityAlerts;
    final ReposGet reposGet;
    final GetAppsWithAccessToProtectedBranch getAppsWithAccessToProtectedBranch;
    final GetArchiveLink getArchiveLink;
    final GetBranch getBranch;
    final GetBranchProtection getBranchProtection;
    final GetClones getClones;
    final GetCodeFrequencyStats getCodeFrequencyStats;
    final GetCollaboratorPermissionLevel getCollaboratorPermissionLevel;
    final GetCombinedStatusForRef getCombinedStatusForRef;
    final ReposGetCommit getCommit;
    final GetCommitActivityStats getCommitActivityStats;
    final GetCommitComment getCommitComment;
    final GetCommitRefSha getCommitRefSha;
    final GetContents getContents;
    final GetContributorsStats getContributorsStats;
    final GetDeployKey getDeployKey;
    final GetDeployment getDeployment;
    final GetDeploymentStatus getDeploymentStatus;
    final GetDownload getDownload;
    final ReposGetHook getHook;
    final GetLatestPagesBuild getLatestPagesBuild;
    final GetLatestRelease getLatestRelease;
    final GetPages getPages;
    final GetPagesBuild getPagesBuild;
    final GetParticipationStats getParticipationStats;
    final GetProtectedBranchAdminEnforcement getProtectedBranchAdminEnforcement;
    final GetProtectedBranchPullRequestReviewEnforcement getProtectedBranchPullRequestReviewEnforcement;
    final GetProtectedBranchRequiredSignatures getProtectedBranchRequiredSignatures;
    final GetProtectedBranchRequiredStatusChecks getProtectedBranchRequiredStatusChecks;
    final GetProtectedBranchRestrictions getProtectedBranchRestrictions;
    final GetPunchCardStats getPunchCardStats;
    final GetReadme getReadme;
    final GetRelease getRelease;
    final GetReleaseAsset getReleaseAsset;
    final GetReleaseByTag getReleaseByTag;
    final GetTeamsWithAccessToProtectedBranch getTeamsWithAccessToProtectedBranch;
    final GetTopPaths getTopPaths;
    final GetTopReferrers getTopReferrers;
    final GetUsersWithAccessToProtectedBranch getUsersWithAccessToProtectedBranch;
    final GetViews getViews;
    final ReposList list;
    final ListAppsWithAccessToProtectedBranch listAppsWithAccessToProtectedBranch;
    final ListAssetsForRelease listAssetsForRelease;
    final ListBranches listBranches;
    final ListBranchesForHeadCommit listBranchesForHeadCommit;
    final ReposListCollaborators listCollaborators;
    final ListCommentsForCommit listCommentsForCommit;
    final ListCommitComments listCommitComments;
    final ReposListCommits listCommits;
    final ListContributors listContributors;
    final ListDeployKeys listDeployKeys;
    final ListDeployments listDeployments;
    final ListDeploymentStatuses listDeploymentStatuses;
    final ListDownloads listDownloads;
    final ReposListForks listForks;
    final ReposListForOrg listForOrg;
    final ReposListForUser listForUser;
    final ReposListHooks listHooks;
    final ListInvitations listInvitations;
    final ListInvitationsForAuthenticatedUser listInvitationsForAuthenticatedUser;
    final ListLanguages listLanguages;
    final ListPagesBuilds listPagesBuilds;
    final ListProtectedBranchRequiredStatusChecksContexts listProtectedBranchRequiredStatusChecksContexts;
    final ListProtectedBranchTeamRestrictions listProtectedBranchTeamRestrictions;
    final ListProtectedBranchUserRestrictions listProtectedBranchUserRestrictions;
    final ReposListPublic listPublic;
    final ListPullRequestsAssociatedWithCommit listPullRequestsAssociatedWithCommit;
    final ListReleases listReleases;
    final ListStatusesForRef listStatusesForRef;
    final ListTags listTags;
    final ListTeams listTeams;
    final ListTeamsWithAccessToProtectedBranch listTeamsWithAccessToProtectedBranch;
    final ListTopics listTopics;
    final ListUsersWithAccessToProtectedBranch listUsersWithAccessToProtectedBranch;
    final ReposMerge merge;
    final ReposPingHook pingHook;
    final RemoveBranchProtection removeBranchProtection;
    final ReposRemoveCollaborator removeCollaborator;
    final RemoveDeployKey removeDeployKey;
    final RemoveProtectedBranchAdminEnforcement removeProtectedBranchAdminEnforcement;
    final RemoveProtectedBranchAppRestrictions removeProtectedBranchAppRestrictions;
    final RemoveProtectedBranchPullRequestReviewEnforcement removeProtectedBranchPullRequestReviewEnforcement;
    final RemoveProtectedBranchRequiredSignatures removeProtectedBranchRequiredSignatures;
    final RemoveProtectedBranchRequiredStatusChecks removeProtectedBranchRequiredStatusChecks;
    final RemoveProtectedBranchRequiredStatusChecksContexts removeProtectedBranchRequiredStatusChecksContexts;
    final RemoveProtectedBranchRestrictions removeProtectedBranchRestrictions;
    final RemoveProtectedBranchTeamRestrictions removeProtectedBranchTeamRestrictions;
    final RemoveProtectedBranchUserRestrictions removeProtectedBranchUserRestrictions;
    final ReplaceProtectedBranchAppRestrictions replaceProtectedBranchAppRestrictions;
    final ReplaceProtectedBranchRequiredStatusChecksContexts replaceProtectedBranchRequiredStatusChecksContexts;
    final ReplaceProtectedBranchTeamRestrictions replaceProtectedBranchTeamRestrictions;
    final ReplaceProtectedBranchUserRestrictions replaceProtectedBranchUserRestrictions;
    final ReplaceTopics replaceTopics;
    final RequestPageBuild requestPageBuild;
    final RetrieveCommunityProfileMetrics retrieveCommunityProfileMetrics;
    final TestPushHook testPushHook;
    final Transfer transfer;
    final ReposUpdate update;
    final UpdateBranchProtection updateBranchProtection;
    final UpdateCommitComment updateCommitComment;
    final UpdateFile updateFile;
    final ReposUpdateHook updateHook;
    final UpdateInformationAboutPagesSite updateInformationAboutPagesSite;
    final UpdateInvitation updateInvitation;
    final UpdateProtectedBranchPullRequestReviewEnforcement updateProtectedBranchPullRequestReviewEnforcement;
    final UpdateProtectedBranchRequiredStatusChecks updateProtectedBranchRequiredStatusChecks;
    final UpdateRelease updateRelease;
    final UpdateReleaseAsset updateReleaseAsset;
    final UploadReleaseAsset uploadReleaseAsset;

    factory ApiRepos.fromRawJson(String str) => ApiRepos.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ApiRepos.fromJson(Map<String, dynamic> json) => ApiRepos(
        acceptInvitation: json["acceptInvitation"] == null ? null : AcceptInvitation.fromJson(json["acceptInvitation"]),
        addCollaborator: json["addCollaborator"] == null ? null : ReposAddCollaborator.fromJson(json["addCollaborator"]),
        addDeployKey: json["addDeployKey"] == null ? null : AddDeployKey.fromJson(json["addDeployKey"]),
        addProtectedBranchAdminEnforcement: json["addProtectedBranchAdminEnforcement"] == null ? null : AddProtectedBranchAdminEnforcement.fromJson(json["addProtectedBranchAdminEnforcement"]),
        addProtectedBranchAppRestrictions: json["addProtectedBranchAppRestrictions"] == null ? null : AddProtectedBranchAppRestrictions.fromJson(json["addProtectedBranchAppRestrictions"]),
        addProtectedBranchRequiredSignatures: json["addProtectedBranchRequiredSignatures"] == null ? null : AddProtectedBranchRequiredSignatures.fromJson(json["addProtectedBranchRequiredSignatures"]),
        addProtectedBranchRequiredStatusChecksContexts: json["addProtectedBranchRequiredStatusChecksContexts"] == null ? null : AddProtectedBranchRequiredStatusChecksContexts.fromJson(json["addProtectedBranchRequiredStatusChecksContexts"]),
        addProtectedBranchTeamRestrictions: json["addProtectedBranchTeamRestrictions"] == null ? null : AddProtectedBranchTeamRestrictions.fromJson(json["addProtectedBranchTeamRestrictions"]),
        addProtectedBranchUserRestrictions: json["addProtectedBranchUserRestrictions"] == null ? null : AddProtectedBranchUserRestrictions.fromJson(json["addProtectedBranchUserRestrictions"]),
        checkCollaborator: json["checkCollaborator"] == null ? null : CheckCollaborator.fromJson(json["checkCollaborator"]),
        checkVulnerabilityAlerts: json["checkVulnerabilityAlerts"] == null ? null : CheckVulnerabilityAlerts.fromJson(json["checkVulnerabilityAlerts"]),
        compareCommits: json["compareCommits"] == null ? null : CompareCommits.fromJson(json["compareCommits"]),
        createCommitComment: json["createCommitComment"] == null ? null : CreateCommitComment.fromJson(json["createCommitComment"]),
        createDeployment: json["createDeployment"] == null ? null : CreateDeployment.fromJson(json["createDeployment"]),
        createDeploymentStatus: json["createDeploymentStatus"] == null ? null : CreateDeploymentStatus.fromJson(json["createDeploymentStatus"]),
        createDispatchEvent: json["createDispatchEvent"] == null ? null : CreateDispatchEvent.fromJson(json["createDispatchEvent"]),
        createFile: json["createFile"] == null ? null : CreateFile.fromJson(json["createFile"]),
        createForAuthenticatedUser: json["createForAuthenticatedUser"] == null ? null : ReposCreateForAuthenticatedUser.fromJson(json["createForAuthenticatedUser"]),
        createFork: json["createFork"] == null ? null : CreateFork.fromJson(json["createFork"]),
        createHook: json["createHook"] == null ? null : ReposCreateHook.fromJson(json["createHook"]),
        createInOrg: json["createInOrg"] == null ? null : CreateInOrg.fromJson(json["createInOrg"]),
        createOrUpdateFile: json["createOrUpdateFile"] == null ? null : CreateOrUpdateFile.fromJson(json["createOrUpdateFile"]),
        createRelease: json["createRelease"] == null ? null : CreateRelease.fromJson(json["createRelease"]),
        createStatus: json["createStatus"] == null ? null : CreateStatus.fromJson(json["createStatus"]),
        createUsingTemplate: json["createUsingTemplate"] == null ? null : CreateUsingTemplate.fromJson(json["createUsingTemplate"]),
        declineInvitation: json["declineInvitation"] == null ? null : DeclineInvitation.fromJson(json["declineInvitation"]),
        delete: json["delete"] == null ? null : ReposDelete.fromJson(json["delete"]),
        deleteCommitComment: json["deleteCommitComment"] == null ? null : DeleteCommitComment.fromJson(json["deleteCommitComment"]),
        deleteDownload: json["deleteDownload"] == null ? null : DeleteDownload.fromJson(json["deleteDownload"]),
        deleteFile: json["deleteFile"] == null ? null : DeleteFile.fromJson(json["deleteFile"]),
        deleteHook: json["deleteHook"] == null ? null : ReposDeleteHook.fromJson(json["deleteHook"]),
        deleteInvitation: json["deleteInvitation"] == null ? null : DeleteInvitation.fromJson(json["deleteInvitation"]),
        deleteRelease: json["deleteRelease"] == null ? null : DeleteRelease.fromJson(json["deleteRelease"]),
        deleteReleaseAsset: json["deleteReleaseAsset"] == null ? null : DeleteReleaseAsset.fromJson(json["deleteReleaseAsset"]),
        disableAutomatedSecurityFixes: json["disableAutomatedSecurityFixes"] == null ? null : DisableAutomatedSecurityFixes.fromJson(json["disableAutomatedSecurityFixes"]),
        disablePagesSite: json["disablePagesSite"] == null ? null : DisablePagesSite.fromJson(json["disablePagesSite"]),
        disableVulnerabilityAlerts: json["disableVulnerabilityAlerts"] == null ? null : DisableVulnerabilityAlerts.fromJson(json["disableVulnerabilityAlerts"]),
        enableAutomatedSecurityFixes: json["enableAutomatedSecurityFixes"] == null ? null : EnableAutomatedSecurityFixes.fromJson(json["enableAutomatedSecurityFixes"]),
        enablePagesSite: json["enablePagesSite"] == null ? null : EnablePagesSite.fromJson(json["enablePagesSite"]),
        enableVulnerabilityAlerts: json["enableVulnerabilityAlerts"] == null ? null : EnableVulnerabilityAlerts.fromJson(json["enableVulnerabilityAlerts"]),
        reposGet: json["get"] == null ? null : ReposGet.fromJson(json["get"]),
        getAppsWithAccessToProtectedBranch: json["getAppsWithAccessToProtectedBranch"] == null ? null : GetAppsWithAccessToProtectedBranch.fromJson(json["getAppsWithAccessToProtectedBranch"]),
        getArchiveLink: json["getArchiveLink"] == null ? null : GetArchiveLink.fromJson(json["getArchiveLink"]),
        getBranch: json["getBranch"] == null ? null : GetBranch.fromJson(json["getBranch"]),
        getBranchProtection: json["getBranchProtection"] == null ? null : GetBranchProtection.fromJson(json["getBranchProtection"]),
        getClones: json["getClones"] == null ? null : GetClones.fromJson(json["getClones"]),
        getCodeFrequencyStats: json["getCodeFrequencyStats"] == null ? null : GetCodeFrequencyStats.fromJson(json["getCodeFrequencyStats"]),
        getCollaboratorPermissionLevel: json["getCollaboratorPermissionLevel"] == null ? null : GetCollaboratorPermissionLevel.fromJson(json["getCollaboratorPermissionLevel"]),
        getCombinedStatusForRef: json["getCombinedStatusForRef"] == null ? null : GetCombinedStatusForRef.fromJson(json["getCombinedStatusForRef"]),
        getCommit: json["getCommit"] == null ? null : ReposGetCommit.fromJson(json["getCommit"]),
        getCommitActivityStats: json["getCommitActivityStats"] == null ? null : GetCommitActivityStats.fromJson(json["getCommitActivityStats"]),
        getCommitComment: json["getCommitComment"] == null ? null : GetCommitComment.fromJson(json["getCommitComment"]),
        getCommitRefSha: json["getCommitRefSha"] == null ? null : GetCommitRefSha.fromJson(json["getCommitRefSha"]),
        getContents: json["getContents"] == null ? null : GetContents.fromJson(json["getContents"]),
        getContributorsStats: json["getContributorsStats"] == null ? null : GetContributorsStats.fromJson(json["getContributorsStats"]),
        getDeployKey: json["getDeployKey"] == null ? null : GetDeployKey.fromJson(json["getDeployKey"]),
        getDeployment: json["getDeployment"] == null ? null : GetDeployment.fromJson(json["getDeployment"]),
        getDeploymentStatus: json["getDeploymentStatus"] == null ? null : GetDeploymentStatus.fromJson(json["getDeploymentStatus"]),
        getDownload: json["getDownload"] == null ? null : GetDownload.fromJson(json["getDownload"]),
        getHook: json["getHook"] == null ? null : ReposGetHook.fromJson(json["getHook"]),
        getLatestPagesBuild: json["getLatestPagesBuild"] == null ? null : GetLatestPagesBuild.fromJson(json["getLatestPagesBuild"]),
        getLatestRelease: json["getLatestRelease"] == null ? null : GetLatestRelease.fromJson(json["getLatestRelease"]),
        getPages: json["getPages"] == null ? null : GetPages.fromJson(json["getPages"]),
        getPagesBuild: json["getPagesBuild"] == null ? null : GetPagesBuild.fromJson(json["getPagesBuild"]),
        getParticipationStats: json["getParticipationStats"] == null ? null : GetParticipationStats.fromJson(json["getParticipationStats"]),
        getProtectedBranchAdminEnforcement: json["getProtectedBranchAdminEnforcement"] == null ? null : GetProtectedBranchAdminEnforcement.fromJson(json["getProtectedBranchAdminEnforcement"]),
        getProtectedBranchPullRequestReviewEnforcement: json["getProtectedBranchPullRequestReviewEnforcement"] == null ? null : GetProtectedBranchPullRequestReviewEnforcement.fromJson(json["getProtectedBranchPullRequestReviewEnforcement"]),
        getProtectedBranchRequiredSignatures: json["getProtectedBranchRequiredSignatures"] == null ? null : GetProtectedBranchRequiredSignatures.fromJson(json["getProtectedBranchRequiredSignatures"]),
        getProtectedBranchRequiredStatusChecks: json["getProtectedBranchRequiredStatusChecks"] == null ? null : GetProtectedBranchRequiredStatusChecks.fromJson(json["getProtectedBranchRequiredStatusChecks"]),
        getProtectedBranchRestrictions: json["getProtectedBranchRestrictions"] == null ? null : GetProtectedBranchRestrictions.fromJson(json["getProtectedBranchRestrictions"]),
        getPunchCardStats: json["getPunchCardStats"] == null ? null : GetPunchCardStats.fromJson(json["getPunchCardStats"]),
        getReadme: json["getReadme"] == null ? null : GetReadme.fromJson(json["getReadme"]),
        getRelease: json["getRelease"] == null ? null : GetRelease.fromJson(json["getRelease"]),
        getReleaseAsset: json["getReleaseAsset"] == null ? null : GetReleaseAsset.fromJson(json["getReleaseAsset"]),
        getReleaseByTag: json["getReleaseByTag"] == null ? null : GetReleaseByTag.fromJson(json["getReleaseByTag"]),
        getTeamsWithAccessToProtectedBranch: json["getTeamsWithAccessToProtectedBranch"] == null ? null : GetTeamsWithAccessToProtectedBranch.fromJson(json["getTeamsWithAccessToProtectedBranch"]),
        getTopPaths: json["getTopPaths"] == null ? null : GetTopPaths.fromJson(json["getTopPaths"]),
        getTopReferrers: json["getTopReferrers"] == null ? null : GetTopReferrers.fromJson(json["getTopReferrers"]),
        getUsersWithAccessToProtectedBranch: json["getUsersWithAccessToProtectedBranch"] == null ? null : GetUsersWithAccessToProtectedBranch.fromJson(json["getUsersWithAccessToProtectedBranch"]),
        getViews: json["getViews"] == null ? null : GetViews.fromJson(json["getViews"]),
        list: json["list"] == null ? null : ReposList.fromJson(json["list"]),
        listAppsWithAccessToProtectedBranch: json["listAppsWithAccessToProtectedBranch"] == null ? null : ListAppsWithAccessToProtectedBranch.fromJson(json["listAppsWithAccessToProtectedBranch"]),
        listAssetsForRelease: json["listAssetsForRelease"] == null ? null : ListAssetsForRelease.fromJson(json["listAssetsForRelease"]),
        listBranches: json["listBranches"] == null ? null : ListBranches.fromJson(json["listBranches"]),
        listBranchesForHeadCommit: json["listBranchesForHeadCommit"] == null ? null : ListBranchesForHeadCommit.fromJson(json["listBranchesForHeadCommit"]),
        listCollaborators: json["listCollaborators"] == null ? null : ReposListCollaborators.fromJson(json["listCollaborators"]),
        listCommentsForCommit: json["listCommentsForCommit"] == null ? null : ListCommentsForCommit.fromJson(json["listCommentsForCommit"]),
        listCommitComments: json["listCommitComments"] == null ? null : ListCommitComments.fromJson(json["listCommitComments"]),
        listCommits: json["listCommits"] == null ? null : ReposListCommits.fromJson(json["listCommits"]),
        listContributors: json["listContributors"] == null ? null : ListContributors.fromJson(json["listContributors"]),
        listDeployKeys: json["listDeployKeys"] == null ? null : ListDeployKeys.fromJson(json["listDeployKeys"]),
        listDeployments: json["listDeployments"] == null ? null : ListDeployments.fromJson(json["listDeployments"]),
        listDeploymentStatuses: json["listDeploymentStatuses"] == null ? null : ListDeploymentStatuses.fromJson(json["listDeploymentStatuses"]),
        listDownloads: json["listDownloads"] == null ? null : ListDownloads.fromJson(json["listDownloads"]),
        listForks: json["listForks"] == null ? null : ReposListForks.fromJson(json["listForks"]),
        listForOrg: json["listForOrg"] == null ? null : ReposListForOrg.fromJson(json["listForOrg"]),
        listForUser: json["listForUser"] == null ? null : ReposListForUser.fromJson(json["listForUser"]),
        listHooks: json["listHooks"] == null ? null : ReposListHooks.fromJson(json["listHooks"]),
        listInvitations: json["listInvitations"] == null ? null : ListInvitations.fromJson(json["listInvitations"]),
        listInvitationsForAuthenticatedUser: json["listInvitationsForAuthenticatedUser"] == null ? null : ListInvitationsForAuthenticatedUser.fromJson(json["listInvitationsForAuthenticatedUser"]),
        listLanguages: json["listLanguages"] == null ? null : ListLanguages.fromJson(json["listLanguages"]),
        listPagesBuilds: json["listPagesBuilds"] == null ? null : ListPagesBuilds.fromJson(json["listPagesBuilds"]),
        listProtectedBranchRequiredStatusChecksContexts: json["listProtectedBranchRequiredStatusChecksContexts"] == null ? null : ListProtectedBranchRequiredStatusChecksContexts.fromJson(json["listProtectedBranchRequiredStatusChecksContexts"]),
        listProtectedBranchTeamRestrictions: json["listProtectedBranchTeamRestrictions"] == null ? null : ListProtectedBranchTeamRestrictions.fromJson(json["listProtectedBranchTeamRestrictions"]),
        listProtectedBranchUserRestrictions: json["listProtectedBranchUserRestrictions"] == null ? null : ListProtectedBranchUserRestrictions.fromJson(json["listProtectedBranchUserRestrictions"]),
        listPublic: json["listPublic"] == null ? null : ReposListPublic.fromJson(json["listPublic"]),
        listPullRequestsAssociatedWithCommit: json["listPullRequestsAssociatedWithCommit"] == null ? null : ListPullRequestsAssociatedWithCommit.fromJson(json["listPullRequestsAssociatedWithCommit"]),
        listReleases: json["listReleases"] == null ? null : ListReleases.fromJson(json["listReleases"]),
        listStatusesForRef: json["listStatusesForRef"] == null ? null : ListStatusesForRef.fromJson(json["listStatusesForRef"]),
        listTags: json["listTags"] == null ? null : ListTags.fromJson(json["listTags"]),
        listTeams: json["listTeams"] == null ? null : ListTeams.fromJson(json["listTeams"]),
        listTeamsWithAccessToProtectedBranch: json["listTeamsWithAccessToProtectedBranch"] == null ? null : ListTeamsWithAccessToProtectedBranch.fromJson(json["listTeamsWithAccessToProtectedBranch"]),
        listTopics: json["listTopics"] == null ? null : ListTopics.fromJson(json["listTopics"]),
        listUsersWithAccessToProtectedBranch: json["listUsersWithAccessToProtectedBranch"] == null ? null : ListUsersWithAccessToProtectedBranch.fromJson(json["listUsersWithAccessToProtectedBranch"]),
        merge: json["merge"] == null ? null : ReposMerge.fromJson(json["merge"]),
        pingHook: json["pingHook"] == null ? null : ReposPingHook.fromJson(json["pingHook"]),
        removeBranchProtection: json["removeBranchProtection"] == null ? null : RemoveBranchProtection.fromJson(json["removeBranchProtection"]),
        removeCollaborator: json["removeCollaborator"] == null ? null : ReposRemoveCollaborator.fromJson(json["removeCollaborator"]),
        removeDeployKey: json["removeDeployKey"] == null ? null : RemoveDeployKey.fromJson(json["removeDeployKey"]),
        removeProtectedBranchAdminEnforcement: json["removeProtectedBranchAdminEnforcement"] == null ? null : RemoveProtectedBranchAdminEnforcement.fromJson(json["removeProtectedBranchAdminEnforcement"]),
        removeProtectedBranchAppRestrictions: json["removeProtectedBranchAppRestrictions"] == null ? null : RemoveProtectedBranchAppRestrictions.fromJson(json["removeProtectedBranchAppRestrictions"]),
        removeProtectedBranchPullRequestReviewEnforcement: json["removeProtectedBranchPullRequestReviewEnforcement"] == null ? null : RemoveProtectedBranchPullRequestReviewEnforcement.fromJson(json["removeProtectedBranchPullRequestReviewEnforcement"]),
        removeProtectedBranchRequiredSignatures: json["removeProtectedBranchRequiredSignatures"] == null ? null : RemoveProtectedBranchRequiredSignatures.fromJson(json["removeProtectedBranchRequiredSignatures"]),
        removeProtectedBranchRequiredStatusChecks: json["removeProtectedBranchRequiredStatusChecks"] == null ? null : RemoveProtectedBranchRequiredStatusChecks.fromJson(json["removeProtectedBranchRequiredStatusChecks"]),
        removeProtectedBranchRequiredStatusChecksContexts: json["removeProtectedBranchRequiredStatusChecksContexts"] == null ? null : RemoveProtectedBranchRequiredStatusChecksContexts.fromJson(json["removeProtectedBranchRequiredStatusChecksContexts"]),
        removeProtectedBranchRestrictions: json["removeProtectedBranchRestrictions"] == null ? null : RemoveProtectedBranchRestrictions.fromJson(json["removeProtectedBranchRestrictions"]),
        removeProtectedBranchTeamRestrictions: json["removeProtectedBranchTeamRestrictions"] == null ? null : RemoveProtectedBranchTeamRestrictions.fromJson(json["removeProtectedBranchTeamRestrictions"]),
        removeProtectedBranchUserRestrictions: json["removeProtectedBranchUserRestrictions"] == null ? null : RemoveProtectedBranchUserRestrictions.fromJson(json["removeProtectedBranchUserRestrictions"]),
        replaceProtectedBranchAppRestrictions: json["replaceProtectedBranchAppRestrictions"] == null ? null : ReplaceProtectedBranchAppRestrictions.fromJson(json["replaceProtectedBranchAppRestrictions"]),
        replaceProtectedBranchRequiredStatusChecksContexts: json["replaceProtectedBranchRequiredStatusChecksContexts"] == null ? null : ReplaceProtectedBranchRequiredStatusChecksContexts.fromJson(json["replaceProtectedBranchRequiredStatusChecksContexts"]),
        replaceProtectedBranchTeamRestrictions: json["replaceProtectedBranchTeamRestrictions"] == null ? null : ReplaceProtectedBranchTeamRestrictions.fromJson(json["replaceProtectedBranchTeamRestrictions"]),
        replaceProtectedBranchUserRestrictions: json["replaceProtectedBranchUserRestrictions"] == null ? null : ReplaceProtectedBranchUserRestrictions.fromJson(json["replaceProtectedBranchUserRestrictions"]),
        replaceTopics: json["replaceTopics"] == null ? null : ReplaceTopics.fromJson(json["replaceTopics"]),
        requestPageBuild: json["requestPageBuild"] == null ? null : RequestPageBuild.fromJson(json["requestPageBuild"]),
        retrieveCommunityProfileMetrics: json["retrieveCommunityProfileMetrics"] == null ? null : RetrieveCommunityProfileMetrics.fromJson(json["retrieveCommunityProfileMetrics"]),
        testPushHook: json["testPushHook"] == null ? null : TestPushHook.fromJson(json["testPushHook"]),
        transfer: json["transfer"] == null ? null : Transfer.fromJson(json["transfer"]),
        update: json["update"] == null ? null : ReposUpdate.fromJson(json["update"]),
        updateBranchProtection: json["updateBranchProtection"] == null ? null : UpdateBranchProtection.fromJson(json["updateBranchProtection"]),
        updateCommitComment: json["updateCommitComment"] == null ? null : UpdateCommitComment.fromJson(json["updateCommitComment"]),
        updateFile: json["updateFile"] == null ? null : UpdateFile.fromJson(json["updateFile"]),
        updateHook: json["updateHook"] == null ? null : ReposUpdateHook.fromJson(json["updateHook"]),
        updateInformationAboutPagesSite: json["updateInformationAboutPagesSite"] == null ? null : UpdateInformationAboutPagesSite.fromJson(json["updateInformationAboutPagesSite"]),
        updateInvitation: json["updateInvitation"] == null ? null : UpdateInvitation.fromJson(json["updateInvitation"]),
        updateProtectedBranchPullRequestReviewEnforcement: json["updateProtectedBranchPullRequestReviewEnforcement"] == null ? null : UpdateProtectedBranchPullRequestReviewEnforcement.fromJson(json["updateProtectedBranchPullRequestReviewEnforcement"]),
        updateProtectedBranchRequiredStatusChecks: json["updateProtectedBranchRequiredStatusChecks"] == null ? null : UpdateProtectedBranchRequiredStatusChecks.fromJson(json["updateProtectedBranchRequiredStatusChecks"]),
        updateRelease: json["updateRelease"] == null ? null : UpdateRelease.fromJson(json["updateRelease"]),
        updateReleaseAsset: json["updateReleaseAsset"] == null ? null : UpdateReleaseAsset.fromJson(json["updateReleaseAsset"]),
        uploadReleaseAsset: json["uploadReleaseAsset"] == null ? null : UploadReleaseAsset.fromJson(json["uploadReleaseAsset"]),
    );

    Map<String, dynamic> toJson() => {
        "acceptInvitation": acceptInvitation == null ? null : acceptInvitation.toJson(),
        "addCollaborator": addCollaborator == null ? null : addCollaborator.toJson(),
        "addDeployKey": addDeployKey == null ? null : addDeployKey.toJson(),
        "addProtectedBranchAdminEnforcement": addProtectedBranchAdminEnforcement == null ? null : addProtectedBranchAdminEnforcement.toJson(),
        "addProtectedBranchAppRestrictions": addProtectedBranchAppRestrictions == null ? null : addProtectedBranchAppRestrictions.toJson(),
        "addProtectedBranchRequiredSignatures": addProtectedBranchRequiredSignatures == null ? null : addProtectedBranchRequiredSignatures.toJson(),
        "addProtectedBranchRequiredStatusChecksContexts": addProtectedBranchRequiredStatusChecksContexts == null ? null : addProtectedBranchRequiredStatusChecksContexts.toJson(),
        "addProtectedBranchTeamRestrictions": addProtectedBranchTeamRestrictions == null ? null : addProtectedBranchTeamRestrictions.toJson(),
        "addProtectedBranchUserRestrictions": addProtectedBranchUserRestrictions == null ? null : addProtectedBranchUserRestrictions.toJson(),
        "checkCollaborator": checkCollaborator == null ? null : checkCollaborator.toJson(),
        "checkVulnerabilityAlerts": checkVulnerabilityAlerts == null ? null : checkVulnerabilityAlerts.toJson(),
        "compareCommits": compareCommits == null ? null : compareCommits.toJson(),
        "createCommitComment": createCommitComment == null ? null : createCommitComment.toJson(),
        "createDeployment": createDeployment == null ? null : createDeployment.toJson(),
        "createDeploymentStatus": createDeploymentStatus == null ? null : createDeploymentStatus.toJson(),
        "createDispatchEvent": createDispatchEvent == null ? null : createDispatchEvent.toJson(),
        "createFile": createFile == null ? null : createFile.toJson(),
        "createForAuthenticatedUser": createForAuthenticatedUser == null ? null : createForAuthenticatedUser.toJson(),
        "createFork": createFork == null ? null : createFork.toJson(),
        "createHook": createHook == null ? null : createHook.toJson(),
        "createInOrg": createInOrg == null ? null : createInOrg.toJson(),
        "createOrUpdateFile": createOrUpdateFile == null ? null : createOrUpdateFile.toJson(),
        "createRelease": createRelease == null ? null : createRelease.toJson(),
        "createStatus": createStatus == null ? null : createStatus.toJson(),
        "createUsingTemplate": createUsingTemplate == null ? null : createUsingTemplate.toJson(),
        "declineInvitation": declineInvitation == null ? null : declineInvitation.toJson(),
        "delete": delete == null ? null : delete.toJson(),
        "deleteCommitComment": deleteCommitComment == null ? null : deleteCommitComment.toJson(),
        "deleteDownload": deleteDownload == null ? null : deleteDownload.toJson(),
        "deleteFile": deleteFile == null ? null : deleteFile.toJson(),
        "deleteHook": deleteHook == null ? null : deleteHook.toJson(),
        "deleteInvitation": deleteInvitation == null ? null : deleteInvitation.toJson(),
        "deleteRelease": deleteRelease == null ? null : deleteRelease.toJson(),
        "deleteReleaseAsset": deleteReleaseAsset == null ? null : deleteReleaseAsset.toJson(),
        "disableAutomatedSecurityFixes": disableAutomatedSecurityFixes == null ? null : disableAutomatedSecurityFixes.toJson(),
        "disablePagesSite": disablePagesSite == null ? null : disablePagesSite.toJson(),
        "disableVulnerabilityAlerts": disableVulnerabilityAlerts == null ? null : disableVulnerabilityAlerts.toJson(),
        "enableAutomatedSecurityFixes": enableAutomatedSecurityFixes == null ? null : enableAutomatedSecurityFixes.toJson(),
        "enablePagesSite": enablePagesSite == null ? null : enablePagesSite.toJson(),
        "enableVulnerabilityAlerts": enableVulnerabilityAlerts == null ? null : enableVulnerabilityAlerts.toJson(),
        "get": reposGet == null ? null : reposGet.toJson(),
        "getAppsWithAccessToProtectedBranch": getAppsWithAccessToProtectedBranch == null ? null : getAppsWithAccessToProtectedBranch.toJson(),
        "getArchiveLink": getArchiveLink == null ? null : getArchiveLink.toJson(),
        "getBranch": getBranch == null ? null : getBranch.toJson(),
        "getBranchProtection": getBranchProtection == null ? null : getBranchProtection.toJson(),
        "getClones": getClones == null ? null : getClones.toJson(),
        "getCodeFrequencyStats": getCodeFrequencyStats == null ? null : getCodeFrequencyStats.toJson(),
        "getCollaboratorPermissionLevel": getCollaboratorPermissionLevel == null ? null : getCollaboratorPermissionLevel.toJson(),
        "getCombinedStatusForRef": getCombinedStatusForRef == null ? null : getCombinedStatusForRef.toJson(),
        "getCommit": getCommit == null ? null : getCommit.toJson(),
        "getCommitActivityStats": getCommitActivityStats == null ? null : getCommitActivityStats.toJson(),
        "getCommitComment": getCommitComment == null ? null : getCommitComment.toJson(),
        "getCommitRefSha": getCommitRefSha == null ? null : getCommitRefSha.toJson(),
        "getContents": getContents == null ? null : getContents.toJson(),
        "getContributorsStats": getContributorsStats == null ? null : getContributorsStats.toJson(),
        "getDeployKey": getDeployKey == null ? null : getDeployKey.toJson(),
        "getDeployment": getDeployment == null ? null : getDeployment.toJson(),
        "getDeploymentStatus": getDeploymentStatus == null ? null : getDeploymentStatus.toJson(),
        "getDownload": getDownload == null ? null : getDownload.toJson(),
        "getHook": getHook == null ? null : getHook.toJson(),
        "getLatestPagesBuild": getLatestPagesBuild == null ? null : getLatestPagesBuild.toJson(),
        "getLatestRelease": getLatestRelease == null ? null : getLatestRelease.toJson(),
        "getPages": getPages == null ? null : getPages.toJson(),
        "getPagesBuild": getPagesBuild == null ? null : getPagesBuild.toJson(),
        "getParticipationStats": getParticipationStats == null ? null : getParticipationStats.toJson(),
        "getProtectedBranchAdminEnforcement": getProtectedBranchAdminEnforcement == null ? null : getProtectedBranchAdminEnforcement.toJson(),
        "getProtectedBranchPullRequestReviewEnforcement": getProtectedBranchPullRequestReviewEnforcement == null ? null : getProtectedBranchPullRequestReviewEnforcement.toJson(),
        "getProtectedBranchRequiredSignatures": getProtectedBranchRequiredSignatures == null ? null : getProtectedBranchRequiredSignatures.toJson(),
        "getProtectedBranchRequiredStatusChecks": getProtectedBranchRequiredStatusChecks == null ? null : getProtectedBranchRequiredStatusChecks.toJson(),
        "getProtectedBranchRestrictions": getProtectedBranchRestrictions == null ? null : getProtectedBranchRestrictions.toJson(),
        "getPunchCardStats": getPunchCardStats == null ? null : getPunchCardStats.toJson(),
        "getReadme": getReadme == null ? null : getReadme.toJson(),
        "getRelease": getRelease == null ? null : getRelease.toJson(),
        "getReleaseAsset": getReleaseAsset == null ? null : getReleaseAsset.toJson(),
        "getReleaseByTag": getReleaseByTag == null ? null : getReleaseByTag.toJson(),
        "getTeamsWithAccessToProtectedBranch": getTeamsWithAccessToProtectedBranch == null ? null : getTeamsWithAccessToProtectedBranch.toJson(),
        "getTopPaths": getTopPaths == null ? null : getTopPaths.toJson(),
        "getTopReferrers": getTopReferrers == null ? null : getTopReferrers.toJson(),
        "getUsersWithAccessToProtectedBranch": getUsersWithAccessToProtectedBranch == null ? null : getUsersWithAccessToProtectedBranch.toJson(),
        "getViews": getViews == null ? null : getViews.toJson(),
        "list": list == null ? null : list.toJson(),
        "listAppsWithAccessToProtectedBranch": listAppsWithAccessToProtectedBranch == null ? null : listAppsWithAccessToProtectedBranch.toJson(),
        "listAssetsForRelease": listAssetsForRelease == null ? null : listAssetsForRelease.toJson(),
        "listBranches": listBranches == null ? null : listBranches.toJson(),
        "listBranchesForHeadCommit": listBranchesForHeadCommit == null ? null : listBranchesForHeadCommit.toJson(),
        "listCollaborators": listCollaborators == null ? null : listCollaborators.toJson(),
        "listCommentsForCommit": listCommentsForCommit == null ? null : listCommentsForCommit.toJson(),
        "listCommitComments": listCommitComments == null ? null : listCommitComments.toJson(),
        "listCommits": listCommits == null ? null : listCommits.toJson(),
        "listContributors": listContributors == null ? null : listContributors.toJson(),
        "listDeployKeys": listDeployKeys == null ? null : listDeployKeys.toJson(),
        "listDeployments": listDeployments == null ? null : listDeployments.toJson(),
        "listDeploymentStatuses": listDeploymentStatuses == null ? null : listDeploymentStatuses.toJson(),
        "listDownloads": listDownloads == null ? null : listDownloads.toJson(),
        "listForks": listForks == null ? null : listForks.toJson(),
        "listForOrg": listForOrg == null ? null : listForOrg.toJson(),
        "listForUser": listForUser == null ? null : listForUser.toJson(),
        "listHooks": listHooks == null ? null : listHooks.toJson(),
        "listInvitations": listInvitations == null ? null : listInvitations.toJson(),
        "listInvitationsForAuthenticatedUser": listInvitationsForAuthenticatedUser == null ? null : listInvitationsForAuthenticatedUser.toJson(),
        "listLanguages": listLanguages == null ? null : listLanguages.toJson(),
        "listPagesBuilds": listPagesBuilds == null ? null : listPagesBuilds.toJson(),
        "listProtectedBranchRequiredStatusChecksContexts": listProtectedBranchRequiredStatusChecksContexts == null ? null : listProtectedBranchRequiredStatusChecksContexts.toJson(),
        "listProtectedBranchTeamRestrictions": listProtectedBranchTeamRestrictions == null ? null : listProtectedBranchTeamRestrictions.toJson(),
        "listProtectedBranchUserRestrictions": listProtectedBranchUserRestrictions == null ? null : listProtectedBranchUserRestrictions.toJson(),
        "listPublic": listPublic == null ? null : listPublic.toJson(),
        "listPullRequestsAssociatedWithCommit": listPullRequestsAssociatedWithCommit == null ? null : listPullRequestsAssociatedWithCommit.toJson(),
        "listReleases": listReleases == null ? null : listReleases.toJson(),
        "listStatusesForRef": listStatusesForRef == null ? null : listStatusesForRef.toJson(),
        "listTags": listTags == null ? null : listTags.toJson(),
        "listTeams": listTeams == null ? null : listTeams.toJson(),
        "listTeamsWithAccessToProtectedBranch": listTeamsWithAccessToProtectedBranch == null ? null : listTeamsWithAccessToProtectedBranch.toJson(),
        "listTopics": listTopics == null ? null : listTopics.toJson(),
        "listUsersWithAccessToProtectedBranch": listUsersWithAccessToProtectedBranch == null ? null : listUsersWithAccessToProtectedBranch.toJson(),
        "merge": merge == null ? null : merge.toJson(),
        "pingHook": pingHook == null ? null : pingHook.toJson(),
        "removeBranchProtection": removeBranchProtection == null ? null : removeBranchProtection.toJson(),
        "removeCollaborator": removeCollaborator == null ? null : removeCollaborator.toJson(),
        "removeDeployKey": removeDeployKey == null ? null : removeDeployKey.toJson(),
        "removeProtectedBranchAdminEnforcement": removeProtectedBranchAdminEnforcement == null ? null : removeProtectedBranchAdminEnforcement.toJson(),
        "removeProtectedBranchAppRestrictions": removeProtectedBranchAppRestrictions == null ? null : removeProtectedBranchAppRestrictions.toJson(),
        "removeProtectedBranchPullRequestReviewEnforcement": removeProtectedBranchPullRequestReviewEnforcement == null ? null : removeProtectedBranchPullRequestReviewEnforcement.toJson(),
        "removeProtectedBranchRequiredSignatures": removeProtectedBranchRequiredSignatures == null ? null : removeProtectedBranchRequiredSignatures.toJson(),
        "removeProtectedBranchRequiredStatusChecks": removeProtectedBranchRequiredStatusChecks == null ? null : removeProtectedBranchRequiredStatusChecks.toJson(),
        "removeProtectedBranchRequiredStatusChecksContexts": removeProtectedBranchRequiredStatusChecksContexts == null ? null : removeProtectedBranchRequiredStatusChecksContexts.toJson(),
        "removeProtectedBranchRestrictions": removeProtectedBranchRestrictions == null ? null : removeProtectedBranchRestrictions.toJson(),
        "removeProtectedBranchTeamRestrictions": removeProtectedBranchTeamRestrictions == null ? null : removeProtectedBranchTeamRestrictions.toJson(),
        "removeProtectedBranchUserRestrictions": removeProtectedBranchUserRestrictions == null ? null : removeProtectedBranchUserRestrictions.toJson(),
        "replaceProtectedBranchAppRestrictions": replaceProtectedBranchAppRestrictions == null ? null : replaceProtectedBranchAppRestrictions.toJson(),
        "replaceProtectedBranchRequiredStatusChecksContexts": replaceProtectedBranchRequiredStatusChecksContexts == null ? null : replaceProtectedBranchRequiredStatusChecksContexts.toJson(),
        "replaceProtectedBranchTeamRestrictions": replaceProtectedBranchTeamRestrictions == null ? null : replaceProtectedBranchTeamRestrictions.toJson(),
        "replaceProtectedBranchUserRestrictions": replaceProtectedBranchUserRestrictions == null ? null : replaceProtectedBranchUserRestrictions.toJson(),
        "replaceTopics": replaceTopics == null ? null : replaceTopics.toJson(),
        "requestPageBuild": requestPageBuild == null ? null : requestPageBuild.toJson(),
        "retrieveCommunityProfileMetrics": retrieveCommunityProfileMetrics == null ? null : retrieveCommunityProfileMetrics.toJson(),
        "testPushHook": testPushHook == null ? null : testPushHook.toJson(),
        "transfer": transfer == null ? null : transfer.toJson(),
        "update": update == null ? null : update.toJson(),
        "updateBranchProtection": updateBranchProtection == null ? null : updateBranchProtection.toJson(),
        "updateCommitComment": updateCommitComment == null ? null : updateCommitComment.toJson(),
        "updateFile": updateFile == null ? null : updateFile.toJson(),
        "updateHook": updateHook == null ? null : updateHook.toJson(),
        "updateInformationAboutPagesSite": updateInformationAboutPagesSite == null ? null : updateInformationAboutPagesSite.toJson(),
        "updateInvitation": updateInvitation == null ? null : updateInvitation.toJson(),
        "updateProtectedBranchPullRequestReviewEnforcement": updateProtectedBranchPullRequestReviewEnforcement == null ? null : updateProtectedBranchPullRequestReviewEnforcement.toJson(),
        "updateProtectedBranchRequiredStatusChecks": updateProtectedBranchRequiredStatusChecks == null ? null : updateProtectedBranchRequiredStatusChecks.toJson(),
        "updateRelease": updateRelease == null ? null : updateRelease.toJson(),
        "updateReleaseAsset": updateReleaseAsset == null ? null : updateReleaseAsset.toJson(),
        "uploadReleaseAsset": uploadReleaseAsset == null ? null : uploadReleaseAsset.toJson(),
    };
}

class AcceptInvitation {
    AcceptInvitation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AcceptInvitation.fromRawJson(String str) => AcceptInvitation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AcceptInvitation.fromJson(Map<String, dynamic> json) => AcceptInvitation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 *
 * Note that, if you choose not to pass any parameters, you'll need to set `Content-Length`
 * to zero when calling out to this endpoint. For more information, see "[HTTP
 * verbs](https://developer.github.com/v3/#http-verbs)."
 *
 * The invitee will receive a notification that they have been invited to the repository,
 * which they must accept or decline. They may do this via the notifications page, the email
 * they receive, or by using the [repository invitations API
 * endpoints](https://developer.github.com/v3/repos/invitations/).
 *
 * **Rate limits**
 *
 * To prevent abuse, you are limited to sending 50 invitations to a repository per 24 hour
 * period. Note there is no limit if you are inviting organization members to an
 * organization repository.
 */
class ReposAddCollaborator {
    ReposAddCollaborator({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposAddCollaborator.fromRawJson(String str) => ReposAddCollaborator.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposAddCollaborator.fromJson(Map<String, dynamic> json) => ReposAddCollaborator(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Here's how you can create a read-only deploy key:
 */
class AddDeployKey {
    AddDeployKey({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddDeployKey.fromRawJson(String str) => AddDeployKey.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddDeployKey.fromJson(Map<String, dynamic> json) => AddDeployKey(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Adding admin enforcement requires admin or owner permissions to the repository and branch
 * protection to be enabled.
 */
class AddProtectedBranchAdminEnforcement {
    AddProtectedBranchAdminEnforcement({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddProtectedBranchAdminEnforcement.fromRawJson(String str) => AddProtectedBranchAdminEnforcement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddProtectedBranchAdminEnforcement.fromJson(Map<String, dynamic> json) => AddProtectedBranchAdminEnforcement(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Grants the specified apps push access for this branch. Only installed GitHub Apps with
 * `write` access to the `contents` permission can be added as authorized actors on a
 * protected branch.
 *
 * | Type    |
 * Description
 * |
 * | ------- |
 * ----------------------------------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `array` | The GitHub Apps that have push access to this branch. Use the app's `slug`.
 * **Note**: The list of users, apps, and teams in total is limited to 100 items. |
 */
class AddProtectedBranchAppRestrictions {
    AddProtectedBranchAppRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddProtectedBranchAppRestrictions.fromRawJson(String str) => AddProtectedBranchAppRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddProtectedBranchAppRestrictions.fromJson(Map<String, dynamic> json) => AddProtectedBranchAppRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * When authenticated with admin or owner permissions to the repository, you can use this
 * endpoint to require signed commits on a branch. You must enable branch protection to
 * require signed commits.
 */
class AddProtectedBranchRequiredSignatures {
    AddProtectedBranchRequiredSignatures({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddProtectedBranchRequiredSignatures.fromRawJson(String str) => AddProtectedBranchRequiredSignatures.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddProtectedBranchRequiredSignatures.fromJson(Map<String, dynamic> json) => AddProtectedBranchRequiredSignatures(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class AddProtectedBranchRequiredStatusChecksContexts {
    AddProtectedBranchRequiredStatusChecksContexts({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddProtectedBranchRequiredStatusChecksContexts.fromRawJson(String str) => AddProtectedBranchRequiredStatusChecksContexts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddProtectedBranchRequiredStatusChecksContexts.fromJson(Map<String, dynamic> json) => AddProtectedBranchRequiredStatusChecksContexts(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Grants the specified teams push access for this branch. You can also give push access to
 * child teams.
 *
 * | Type    |
 * Description
 * |
 * | ------- |
 * ------------------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `array` | The teams that can have push access. Use the team's `slug`. **Note**: The
 * list of users, apps, and teams in total is limited to 100 items. |
 */
class AddProtectedBranchTeamRestrictions {
    AddProtectedBranchTeamRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddProtectedBranchTeamRestrictions.fromRawJson(String str) => AddProtectedBranchTeamRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddProtectedBranchTeamRestrictions.fromJson(Map<String, dynamic> json) => AddProtectedBranchTeamRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Grants the specified people push access for this branch.
 *
 * | Type    |
 * Description
 * |
 * | ------- |
 * -----------------------------------------------------------------------------------------------------------------------------
 * |
 * | `array` | Usernames for people who can have push access. **Note**: The list of users,
 * apps, and teams in total is limited to 100 items. |
 */
class AddProtectedBranchUserRestrictions {
    AddProtectedBranchUserRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddProtectedBranchUserRestrictions.fromRawJson(String str) => AddProtectedBranchUserRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddProtectedBranchUserRestrictions.fromJson(Map<String, dynamic> json) => AddProtectedBranchUserRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * For organization-owned repositories, the list of collaborators includes outside
 * collaborators, organization members that are direct collaborators, organization members
 * with access through team memberships, organization members with access through default
 * organization permissions, and organization owners.
 *
 * Team members will include the members of child teams.
 */
class CheckCollaborator {
    CheckCollaborator({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckCollaborator.fromRawJson(String str) => CheckCollaborator.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckCollaborator.fromJson(Map<String, dynamic> json) => CheckCollaborator(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Shows whether vulnerability alerts are enabled or disabled for a repository. The
 * authenticated user must have admin access to the repository. For more information, see
 * "[About security alerts for vulnerable
 * dependencies](https://help.github.com/en/articles/about-security-alerts-for-vulnerable-dependencies)"
 * in the GitHub Help documentation.
 */
class CheckVulnerabilityAlerts {
    CheckVulnerabilityAlerts({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckVulnerabilityAlerts.fromRawJson(String str) => CheckVulnerabilityAlerts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckVulnerabilityAlerts.fromJson(Map<String, dynamic> json) => CheckVulnerabilityAlerts(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Both `:base` and `:head` must be branch names in `:repo`. To compare branches across
 * other repositories in the same network as `:repo`, use the format `<USERNAME>:branch`.
 *
 * The response from the API is equivalent to running the `git log base..head` command;
 * however, commits are returned in chronological order. Pass the appropriate [media
 * type](https://developer.github.com/v3/media/#commits-commit-comparison-and-pull-requests)
 * to fetch diff and patch formats.
 *
 * The response also includes details on the files that were changed between the two
 * commits. This includes the status of the change (for example, if a file was added,
 * removed, modified, or renamed), and details of the change itself. For example, files with
 * a `renamed` status have a `previous_filename` field showing the previous filename of the
 * file, and files with a `modified` status have a `patch` field showing the changes made to
 * the file.
 *
 * **Working with large comparisons**
 *
 * The response will include a comparison of up to 250 commits. If you are working with a
 * larger commit range, you can use the [Commit List
 * API](https://developer.github.com/v3/repos/commits/#list-commits-on-a-repository) to
 * enumerate all commits in the range.
 *
 * For comparisons with extremely large diffs, you may receive an error response indicating
 * that the diff took too long to generate. You can typically resolve this error by using a
 * smaller commit range.
 *
 * **Signature verification object**
 *
 * The response will include a `verification` object that describes the result of verifying
 * the commit's signature. The following fields are included in the `verification` object:
 *
 * These are the possible values for `reason` in the `verification` object:
 *
 * | Value                    |
 * Description
 * |
 * | ------------------------ |
 * ---------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `expired_key`            | The key that made the signature is
 * expired.
 * |
 * | `not_signing_key`        | The "signing" flag is not among the usage flags in the GPG
 * key that made the signature.                                           |
 * | `gpgverify_error`        | There was an error communicating with the signature
 * verification service.                                                         |
 * | `gpgverify_unavailable`  | The signature verification service is currently
 * unavailable.                                                                      |
 * | `unsigned`               | The object does not include a
 * signature.
 * |
 * | `unknown_signature_type` | A non-PGP signature was found in the
 * commit.
 * |
 * | `no_user`                | No user was associated with the `committer` email address in
 * the commit.                                                          |
 * | `unverified_email`       | The `committer` email address in the commit was associated
 * with a user, but the email address is not verified on her/his account. |
 * | `bad_email`              | The `committer` email address in the commit is not included
 * in the identities of the PGP key that made the signature.             |
 * | `unknown_key`            | The key that made the signature has not been registered with
 * any user's account.                                                  |
 * | `malformed_signature`    | There was an error parsing the
 * signature.
 * |
 * | `invalid`                | The signature could not be cryptographically verified using
 * the key whose key-id was found in the signature.                      |
 * | `valid`                  | None of the above errors applied, so the signature is
 * considered to be verified.                                                  |
 */
class CompareCommits {
    CompareCommits({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CompareCommits.fromRawJson(String str) => CompareCommits.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CompareCommits.fromJson(Map<String, dynamic> json) => CompareCommits(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Create a comment for a commit using its `:commit_sha`.
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class CreateCommitComment {
    CreateCommitComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateCommitComment.fromRawJson(String str) => CreateCommitComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateCommitComment.fromJson(Map<String, dynamic> json) => CreateCommitComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Deployments offer a few configurable parameters with sane defaults.
 *
 * The `ref` parameter can be any named branch, tag, or SHA. At GitHub we often deploy
 * branches and verify them before we merge a pull request.
 *
 * The `environment` parameter allows deployments to be issued to different runtime
 * environments. Teams often have multiple environments for verifying their applications,
 * such as `production`, `staging`, and `qa`. This parameter makes it easier to track which
 * environments have requested deployments. The default environment is `production`.
 *
 * The `auto_merge` parameter is used to ensure that the requested ref is not behind the
 * repository's default branch. If the ref _is_ behind the default branch for the
 * repository, we will attempt to merge it for you. If the merge succeeds, the API will
 * return a successful merge commit. If merge conflicts prevent the merge from succeeding,
 * the API will return a failure response.
 *
 * By default, [commit statuses](https://developer.github.com/v3/repos/statuses) for every
 * submitted context must be in a `success` state. The `required_contexts` parameter allows
 * you to specify a subset of contexts that must be `success`, or to specify contexts that
 * have not yet been submitted. You are not required to use commit statuses to deploy. If
 * you do not require any contexts or create any commit statuses, the deployment will always
 * succeed.
 *
 * The `payload` parameter is available for any extra information that a deployment system
 * might need. It is a JSON text field that will be passed on when a deployment event is
 * dispatched.
 *
 * The `task` parameter is used by the deployment system to allow different execution paths.
 * In the web world this might be `deploy:migrations` to run schema changes on the system.
 * In the compiled world this could be a flag to compile an application with debugging
 * enabled.
 *
 * Users with `repo` or `repo_deployment` scopes can create a deployment for a given ref:
 *
 * A simple example putting the user and room into the payload to notify back to chat
 * networks.
 *
 * A more advanced example specifying required commit statuses and bypassing auto-merging.
 *
 * You will see this response when GitHub automatically merges the base branch into the
 * topic branch instead of creating a deployment. This auto-merge happens when:
 *
 * *   Auto-merge option is enabled in the repository
 * *   Topic branch does not include the latest changes on the base branch, which is
 * `master`in the response example
 * *   There are no merge conflicts
 *
 * If there are no new commits in the base branch, a new request to create a deployment
 * should give a successful response.
 *
 * This error happens when the `auto_merge` option is enabled and when the default branch
 * (in this case `master`), can't be merged into the branch that's being deployed (in this
 * case `topic-branch`), due to merge conflicts.
 *
 * This error happens when the `required_contexts` parameter indicates that one or more
 * contexts need to have a `success` status for the commit to be deployed, but one or more
 * of the required contexts do not have a state of `success`.
 */
class CreateDeployment {
    CreateDeployment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateDeployment.fromRawJson(String str) => CreateDeployment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateDeployment.fromJson(Map<String, dynamic> json) => CreateDeployment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with `push` access can create deployment statuses for a given deployment.
 *
 * GitHub Apps require `read & write` access to "Deployments" and `read-only` access to
 * "Repo contents" (for private repos). OAuth Apps require the `repo_deployment` scope.
 */
class CreateDeploymentStatus {
    CreateDeploymentStatus({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateDeploymentStatus.fromRawJson(String str) => CreateDeploymentStatus.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateDeploymentStatus.fromJson(Map<String, dynamic> json) => CreateDeploymentStatus(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * You can use this endpoint to trigger a webhook event called `repository_dispatch` when
 * you want activity that happens outside of GitHub to trigger a GitHub Actions workflow or
 * GitHub App webhook. You must configure your GitHub Actions workflow or GitHub App to run
 * when the `repository_dispatch` event occurs. For an example `repository_dispatch` webhook
 * payload, see
 * "[RepositoryDispatchEvent](https://developer.github.com/v3/activity/events/types/#repositorydispatchevent)."
 *
 * The `client_payload` parameter is available for any extra information that your workflow
 * might need. This parameter is a JSON payload that will be passed on when the webhook
 * event is dispatched. For example, the `client_payload` can include a message that a user
 * would like to send using a GitHub Actions workflow. Or the `client_payload` can be used
 * as a test to debug your workflow. For a test example, see the [input
 * example](https://developer.github.com/v3/repos/#example-4).
 *
 * To give you write access to the repository, you must use a personal access token with the
 * `repo` scope. For more information, see "[Creating a personal access token for the
 * command
 * line](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line)"
 * in the GitHub Help documentation.
 *
 * This input example shows how you can use the `client_payload` as a test to debug your
 * workflow.
 */
class CreateDispatchEvent {
    CreateDispatchEvent({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateDispatchEvent.fromRawJson(String str) => CreateDispatchEvent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateDispatchEvent.fromJson(Map<String, dynamic> json) => CreateDispatchEvent(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a new file or updates an existing file in a repository.
 */
class CreateFile {
    CreateFile({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateFile.fromRawJson(String str) => CreateFile.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateFile.fromJson(Map<String, dynamic> json) => CreateFile(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a new repository for the authenticated user.
 *
 * **OAuth scope requirements**
 *
 * When using
 * [OAuth](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/),
 * authorizations must include:
 *
 * *   `public_repo` scope or `repo` scope to create a public repository
 * *   `repo` scope to create a private repository
 */
class ReposCreateForAuthenticatedUser {
    ReposCreateForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposCreateForAuthenticatedUser.fromRawJson(String str) => ReposCreateForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposCreateForAuthenticatedUser.fromJson(Map<String, dynamic> json) => ReposCreateForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Create a fork for the authenticated user.
 *
 * **Note**: Forking a Repository happens asynchronously. You may have to wait a short
 * period of time before you can access the git objects. If this takes longer than 5
 * minutes, be sure to contact [GitHub Support](https://github.com/contact) or [GitHub
 * Premium Support](https://premium.githubsupport.com).
 */
class CreateFork {
    CreateFork({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateFork.fromRawJson(String str) => CreateFork.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateFork.fromJson(Map<String, dynamic> json) => CreateFork(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Repositories can have multiple webhooks installed. Each webhook should have a unique
 * `config`. Multiple webhooks can share the same `config` as long as those webhooks do not
 * have any `events` that overlap.
 *
 * Here's how you can create a hook that posts payloads in JSON format:
 */
class ReposCreateHook {
    ReposCreateHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposCreateHook.fromRawJson(String str) => ReposCreateHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposCreateHook.fromJson(Map<String, dynamic> json) => ReposCreateHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a new repository for the authenticated user.
 *
 * **OAuth scope requirements**
 *
 * When using
 * [OAuth](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/),
 * authorizations must include:
 *
 * *   `public_repo` scope or `repo` scope to create a public repository
 * *   `repo` scope to create a private repository
 */
class CreateInOrg {
    CreateInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateInOrg.fromRawJson(String str) => CreateInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateInOrg.fromJson(Map<String, dynamic> json) => CreateInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a new file or updates an existing file in a repository.
 */
class CreateOrUpdateFile {
    CreateOrUpdateFile({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateOrUpdateFile.fromRawJson(String str) => CreateOrUpdateFile.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateOrUpdateFile.fromJson(Map<String, dynamic> json) => CreateOrUpdateFile(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with push access to the repository can create a release.
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class CreateRelease {
    CreateRelease({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateRelease.fromRawJson(String str) => CreateRelease.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateRelease.fromJson(Map<String, dynamic> json) => CreateRelease(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with push access in a repository can create commit statuses for a given SHA.
 *
 * Note: there is a limit of 1000 statuses per `sha` and `context` within a repository.
 * Attempts to create more than 1000 statuses will result in a validation error.
 */
class CreateStatus {
    CreateStatus({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateStatus.fromRawJson(String str) => CreateStatus.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateStatus.fromJson(Map<String, dynamic> json) => CreateStatus(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a new repository using a repository template. Use the `template_owner` and
 * `template_repo` route parameters to specify the repository to use as the template. The
 * authenticated user must own or be a member of an organization that owns the repository.
 * To check if a repository is available to use as a template, get the repository's
 * information using the [`GET
 * /repos/:owner/:repo`](https://developer.github.com/v3/repos/#get) endpoint and check that
 * the `is_template` key is `true`.
 *
 * **OAuth scope requirements**
 *
 * When using
 * [OAuth](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/),
 * authorizations must include:
 *
 * *   `public_repo` scope or `repo` scope to create a public repository
 * *   `repo` scope to create a private repository
 *
 * \`
 * *
 */
class CreateUsingTemplate {
    CreateUsingTemplate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateUsingTemplate.fromRawJson(String str) => CreateUsingTemplate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateUsingTemplate.fromJson(Map<String, dynamic> json) => CreateUsingTemplate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeclineInvitation {
    DeclineInvitation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeclineInvitation.fromRawJson(String str) => DeclineInvitation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeclineInvitation.fromJson(Map<String, dynamic> json) => DeclineInvitation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Deleting a repository requires admin access. If OAuth is used, the `delete_repo` scope is
 * required.
 *
 * If an organization owner has configured the organization to prevent members from deleting
 * organization-owned repositories, a member will get this response:
 */
class ReposDelete {
    ReposDelete({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposDelete.fromRawJson(String str) => ReposDelete.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposDelete.fromJson(Map<String, dynamic> json) => ReposDelete(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeleteCommitComment {
    DeleteCommitComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteCommitComment.fromRawJson(String str) => DeleteCommitComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteCommitComment.fromJson(Map<String, dynamic> json) => DeleteCommitComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeleteDownload {
    DeleteDownload({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteDownload.fromRawJson(String str) => DeleteDownload.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteDownload.fromJson(Map<String, dynamic> json) => DeleteDownload(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Deletes a file in a repository.
 *
 * You can provide an additional `committer` parameter, which is an object containing
 * information about the committer. Or, you can provide an `author` parameter, which is an
 * object containing information about the author.
 *
 * The `author` section is optional and is filled in with the `committer` information if
 * omitted. If the `committer` information is omitted, the authenticated user's information
 * is used.
 *
 * You must provide values for both `name` and `email`, whether you choose to use `author`
 * or `committer`. Otherwise, you'll receive a `422` status code.
 */
class DeleteFile {
    DeleteFile({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteFile.fromRawJson(String str) => DeleteFile.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteFile.fromJson(Map<String, dynamic> json) => DeleteFile(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ReposDeleteHook {
    ReposDeleteHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposDeleteHook.fromRawJson(String str) => ReposDeleteHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposDeleteHook.fromJson(Map<String, dynamic> json) => ReposDeleteHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeleteInvitation {
    DeleteInvitation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteInvitation.fromRawJson(String str) => DeleteInvitation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteInvitation.fromJson(Map<String, dynamic> json) => DeleteInvitation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with push access to the repository can delete a release.
 */
class DeleteRelease {
    DeleteRelease({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteRelease.fromRawJson(String str) => DeleteRelease.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteRelease.fromJson(Map<String, dynamic> json) => DeleteRelease(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DeleteReleaseAsset {
    DeleteReleaseAsset({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteReleaseAsset.fromRawJson(String str) => DeleteReleaseAsset.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteReleaseAsset.fromJson(Map<String, dynamic> json) => DeleteReleaseAsset(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Disables automated security fixes for a repository. The authenticated user must have
 * admin access to the repository. For more information, see "[Configuring automated
 * security
 * fixes](https://help.github.com/en/articles/configuring-automated-security-fixes)" in the
 * GitHub Help documentation.
 */
class DisableAutomatedSecurityFixes {
    DisableAutomatedSecurityFixes({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DisableAutomatedSecurityFixes.fromRawJson(String str) => DisableAutomatedSecurityFixes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DisableAutomatedSecurityFixes.fromJson(Map<String, dynamic> json) => DisableAutomatedSecurityFixes(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class DisablePagesSite {
    DisablePagesSite({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DisablePagesSite.fromRawJson(String str) => DisablePagesSite.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DisablePagesSite.fromJson(Map<String, dynamic> json) => DisablePagesSite(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Disables vulnerability alerts and the dependency graph for a repository. The
 * authenticated user must have admin access to the repository. For more information, see
 * "[About security alerts for vulnerable
 * dependencies](https://help.github.com/en/articles/about-security-alerts-for-vulnerable-dependencies)"
 * in the GitHub Help documentation.
 */
class DisableVulnerabilityAlerts {
    DisableVulnerabilityAlerts({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DisableVulnerabilityAlerts.fromRawJson(String str) => DisableVulnerabilityAlerts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DisableVulnerabilityAlerts.fromJson(Map<String, dynamic> json) => DisableVulnerabilityAlerts(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Enables automated security fixes for a repository. The authenticated user must have admin
 * access to the repository. For more information, see "[Configuring automated security
 * fixes](https://help.github.com/en/articles/configuring-automated-security-fixes)" in the
 * GitHub Help documentation.
 */
class EnableAutomatedSecurityFixes {
    EnableAutomatedSecurityFixes({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory EnableAutomatedSecurityFixes.fromRawJson(String str) => EnableAutomatedSecurityFixes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EnableAutomatedSecurityFixes.fromJson(Map<String, dynamic> json) => EnableAutomatedSecurityFixes(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class EnablePagesSite {
    EnablePagesSite({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory EnablePagesSite.fromRawJson(String str) => EnablePagesSite.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EnablePagesSite.fromJson(Map<String, dynamic> json) => EnablePagesSite(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Enables vulnerability alerts and the dependency graph for a repository. The authenticated
 * user must have admin access to the repository. For more information, see "[About security
 * alerts for vulnerable
 * dependencies](https://help.github.com/en/articles/about-security-alerts-for-vulnerable-dependencies)"
 * in the GitHub Help documentation.
 */
class EnableVulnerabilityAlerts {
    EnableVulnerabilityAlerts({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory EnableVulnerabilityAlerts.fromRawJson(String str) => EnableVulnerabilityAlerts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EnableVulnerabilityAlerts.fromJson(Map<String, dynamic> json) => EnableVulnerabilityAlerts(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Lists the GitHub Apps that have push access to this branch. Only installed GitHub Apps
 * with `write` access to the `contents` permission can be added as authorized actors on a
 * protected branch.
 */
class GetAppsWithAccessToProtectedBranch {
    GetAppsWithAccessToProtectedBranch({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetAppsWithAccessToProtectedBranch.fromRawJson(String str) => GetAppsWithAccessToProtectedBranch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetAppsWithAccessToProtectedBranch.fromJson(Map<String, dynamic> json) => GetAppsWithAccessToProtectedBranch(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a redirect URL to download an archive for a repository. The `:archive_format` can be
 * either `tarball` or `zipball`. The `:ref` must be a valid Git reference. If you omit
 * `:ref`, the repository’s default branch (usually `master`) will be used. Please make sure
 * your HTTP framework is configured to follow redirects or you will need to use the
 * `Location` header to make a second `GET` request.
 *
 * _Note_: For private repositories, these links are temporary and expire after five
 * minutes.
 *
 * To follow redirects with curl, use the `-L` switch:
 */
class GetArchiveLink {
    GetArchiveLink({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetArchiveLink.fromRawJson(String str) => GetArchiveLink.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetArchiveLink.fromJson(Map<String, dynamic> json) => GetArchiveLink(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetBranch {
    GetBranch({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetBranch.fromRawJson(String str) => GetBranch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetBranch.fromJson(Map<String, dynamic> json) => GetBranch(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class GetBranchProtection {
    GetBranchProtection({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetBranchProtection.fromRawJson(String str) => GetBranchProtection.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetBranchProtection.fromJson(Map<String, dynamic> json) => GetBranchProtection(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Get the total number of clones and breakdown per day or week for the last 14 days.
 * Timestamps are aligned to UTC midnight of the beginning of the day or week. Week begins
 * on Monday.
 */
class GetClones {
    GetClones({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetClones.fromRawJson(String str) => GetClones.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetClones.fromJson(Map<String, dynamic> json) => GetClones(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns a weekly aggregate of the number of additions and deletions pushed to a
 * repository.
 */
class GetCodeFrequencyStats {
    GetCodeFrequencyStats({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetCodeFrequencyStats.fromRawJson(String str) => GetCodeFrequencyStats.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCodeFrequencyStats.fromJson(Map<String, dynamic> json) => GetCodeFrequencyStats(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Possible values for the `permission` key: `admin`, `write`, `read`, `none`.
 */
class GetCollaboratorPermissionLevel {
    GetCollaboratorPermissionLevel({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetCollaboratorPermissionLevel.fromRawJson(String str) => GetCollaboratorPermissionLevel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCollaboratorPermissionLevel.fromJson(Map<String, dynamic> json) => GetCollaboratorPermissionLevel(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with pull access in a repository can access a combined view of commit statuses for
 * a given ref. The ref can be a SHA, a branch name, or a tag name.
 *
 * The most recent status for each context is returned, up to 100. This field
 * [paginates](https://developer.github.com/v3/#pagination) if there are over 100 contexts.
 *
 * Additionally, a combined `state` is returned. The `state` is one of:
 *
 * *   **failure** if any of the contexts report as `error` or `failure`
 * *   **pending** if there are no statuses or a context is `pending`
 * *   **success** if the latest status for all contexts is `success`
 */
class GetCombinedStatusForRef {
    GetCombinedStatusForRef({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetCombinedStatusForRef.fromRawJson(String str) => GetCombinedStatusForRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCombinedStatusForRef.fromJson(Map<String, dynamic> json) => GetCombinedStatusForRef(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns the contents of a single commit reference. You must have `read` access for the
 * repository to use this endpoint.
 *
 * You can pass the appropriate [media
 * type](https://developer.github.com/v3/media/#commits-commit-comparison-and-pull-requests)
 * to fetch `diff` and `patch` formats. Diffs with binary data will have no `patch`
 * property.
 *
 * To return only the SHA-1 hash of the commit reference, you can provide the `sha` custom
 * [media
 * type](https://developer.github.com/v3/media/#commits-commit-comparison-and-pull-requests)
 * in the `Accept` header. You can use this endpoint to check if a remote reference's SHA-1
 * hash is the same as your local reference's SHA-1 hash by providing the local SHA-1
 * reference as the ETag.
 *
 * **Signature verification object**
 *
 * The response will include a `verification` object that describes the result of verifying
 * the commit's signature. The following fields are included in the `verification` object:
 *
 * These are the possible values for `reason` in the `verification` object:
 *
 * | Value                    |
 * Description
 * |
 * | ------------------------ |
 * ---------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `expired_key`            | The key that made the signature is
 * expired.
 * |
 * | `not_signing_key`        | The "signing" flag is not among the usage flags in the GPG
 * key that made the signature.                                           |
 * | `gpgverify_error`        | There was an error communicating with the signature
 * verification service.                                                         |
 * | `gpgverify_unavailable`  | The signature verification service is currently
 * unavailable.                                                                      |
 * | `unsigned`               | The object does not include a
 * signature.
 * |
 * | `unknown_signature_type` | A non-PGP signature was found in the
 * commit.
 * |
 * | `no_user`                | No user was associated with the `committer` email address in
 * the commit.                                                          |
 * | `unverified_email`       | The `committer` email address in the commit was associated
 * with a user, but the email address is not verified on her/his account. |
 * | `bad_email`              | The `committer` email address in the commit is not included
 * in the identities of the PGP key that made the signature.             |
 * | `unknown_key`            | The key that made the signature has not been registered with
 * any user's account.                                                  |
 * | `malformed_signature`    | There was an error parsing the
 * signature.
 * |
 * | `invalid`                | The signature could not be cryptographically verified using
 * the key whose key-id was found in the signature.                      |
 * | `valid`                  | None of the above errors applied, so the signature is
 * considered to be verified.                                                  |
 */
class ReposGetCommit {
    ReposGetCommit({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposGetCommit.fromRawJson(String str) => ReposGetCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposGetCommit.fromJson(Map<String, dynamic> json) => ReposGetCommit(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns the last year of commit activity grouped by week. The `days` array is a group of
 * commits per day, starting on `Sunday`.
 */
class GetCommitActivityStats {
    GetCommitActivityStats({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetCommitActivityStats.fromRawJson(String str) => GetCommitActivityStats.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCommitActivityStats.fromJson(Map<String, dynamic> json) => GetCommitActivityStats(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetCommitComment {
    GetCommitComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetCommitComment.fromRawJson(String str) => GetCommitComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCommitComment.fromJson(Map<String, dynamic> json) => GetCommitComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** To access this endpoint, you must provide a custom [media
 * type](https://developer.github.com/v3/media) in the `Accept` header:
 * ```
 * * application/vnd.github.VERSION.sha
 * * ```
 * Returns the SHA-1 of the commit reference. You must have `read` access for the repository
 * to get the SHA-1 of a commit reference. You can use this endpoint to check if a remote
 * reference's SHA-1 is the same as your local reference's SHA-1 by providing the local
 * SHA-1 reference as the ETag.
 */
class GetCommitRefSha {
    GetCommitRefSha({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetCommitRefSha.fromRawJson(String str) => GetCommitRefSha.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCommitRefSha.fromJson(Map<String, dynamic> json) => GetCommitRefSha(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets the contents of a file or directory in a repository. Specify the file path or
 * directory in `:path`. If you omit `:path`, you will receive the contents of all files in
 * the repository.
 *
 * Files and symlinks support [a custom media
 * type](https://developer.github.com/v3/repos/contents/#custom-media-types) for retrieving
 * the raw content or rendered HTML (when supported). All content types support [a custom
 * media type](https://developer.github.com/v3/repos/contents/#custom-media-types) to ensure
 * the content is returned in a consistent object format.
 *
 * **Note**:
 *
 * *   To get a repository's contents recursively, you can [recursively get the
 * tree](https://developer.github.com/v3/git/trees/).
 * *   This API has an upper limit of 1,000 files for a directory. If you need to retrieve
 * more files, use the [Git Trees
 * API](https://developer.github.com/v3/git/trees/#get-a-tree).
 * *   This API supports files up to 1 megabyte in size.
 *
 * The response will be an array of objects, one object for each item in the directory.
 *
 * When listing the contents of a directory, submodules have their "type" specified as
 * "file". Logically, the value _should_ be "submodule". This behavior exists in API v3 [for
 * backwards compatibility purposes](https://git.io/v1YCW). In the next major version of the
 * API, the type will be returned as "submodule".
 *
 * If the requested `:path` points to a symlink, and the symlink's target is a normal file
 * in the repository, then the API responds with the content of the file (in the [format
 * shown
 * above](https://developer.github.com/v3/repos/contents/#response-if-content-is-a-file)).
 *
 * Otherwise, the API responds with an object describing the symlink itself:
 *
 * The `submodule_git_url` identifies the location of the submodule repository, and the
 * `sha` identifies a specific commit within the submodule repository. Git uses the given
 * URL when cloning the submodule repository, and checks out the submodule at that specific
 * commit.
 *
 * If the submodule repository is not hosted on github.com, the Git URLs (`git_url` and
 * `_links["git"]`) and the github.com URLs (`html_url` and `_links["html"]`) will have null
 * values.
 */
class GetContents {
    GetContents({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetContents.fromRawJson(String str) => GetContents.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetContents.fromJson(Map<String, dynamic> json) => GetContents(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * *   `total` - The Total number of commits authored by the contributor.
 *
 * Weekly Hash (`weeks` array):
 *
 * *   `w` - Start of the week, given as a [Unix
 * timestamp](http://en.wikipedia.org/wiki/Unix_time).
 * *   `a` - Number of additions
 * *   `d` - Number of deletions
 * *   `c` - Number of commits
 */
class GetContributorsStats {
    GetContributorsStats({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetContributorsStats.fromRawJson(String str) => GetContributorsStats.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetContributorsStats.fromJson(Map<String, dynamic> json) => GetContributorsStats(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetDeployKey {
    GetDeployKey({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetDeployKey.fromRawJson(String str) => GetDeployKey.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDeployKey.fromJson(Map<String, dynamic> json) => GetDeployKey(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetDeployment {
    GetDeployment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetDeployment.fromRawJson(String str) => GetDeployment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDeployment.fromJson(Map<String, dynamic> json) => GetDeployment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with pull access can view a deployment status for a deployment:
 */
class GetDeploymentStatus {
    GetDeploymentStatus({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetDeploymentStatus.fromRawJson(String str) => GetDeploymentStatus.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDeploymentStatus.fromJson(Map<String, dynamic> json) => GetDeploymentStatus(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetDownload {
    GetDownload({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetDownload.fromRawJson(String str) => GetDownload.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDownload.fromJson(Map<String, dynamic> json) => GetDownload(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ReposGetHook {
    ReposGetHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposGetHook.fromRawJson(String str) => ReposGetHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposGetHook.fromJson(Map<String, dynamic> json) => ReposGetHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetLatestPagesBuild {
    GetLatestPagesBuild({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetLatestPagesBuild.fromRawJson(String str) => GetLatestPagesBuild.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetLatestPagesBuild.fromJson(Map<String, dynamic> json) => GetLatestPagesBuild(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * View the latest published full release for the repository.
 *
 * The latest release is the most recent non-prerelease, non-draft release, sorted by the
 * `created_at` attribute. The `created_at` attribute is the date of the commit used for the
 * release, and not the date when the release was drafted or published.
 */
class GetLatestRelease {
    GetLatestRelease({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetLatestRelease.fromRawJson(String str) => GetLatestRelease.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetLatestRelease.fromJson(Map<String, dynamic> json) => GetLatestRelease(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetPages {
    GetPages({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetPages.fromRawJson(String str) => GetPages.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetPages.fromJson(Map<String, dynamic> json) => GetPages(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class GetPagesBuild {
    GetPagesBuild({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetPagesBuild.fromRawJson(String str) => GetPagesBuild.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetPagesBuild.fromJson(Map<String, dynamic> json) => GetPagesBuild(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Returns the total commit counts for the `owner` and total commit counts in `all`. `all`
 * is everyone combined, including the `owner` in the last 52 weeks. If you'd like to get
 * the commit counts for non-owners, you can subtract `owner` from `all`.
 *
 * The array order is oldest week (index 0) to most recent week.
 */
class GetParticipationStats {
    GetParticipationStats({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetParticipationStats.fromRawJson(String str) => GetParticipationStats.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetParticipationStats.fromJson(Map<String, dynamic> json) => GetParticipationStats(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class GetProtectedBranchAdminEnforcement {
    GetProtectedBranchAdminEnforcement({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetProtectedBranchAdminEnforcement.fromRawJson(String str) => GetProtectedBranchAdminEnforcement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetProtectedBranchAdminEnforcement.fromJson(Map<String, dynamic> json) => GetProtectedBranchAdminEnforcement(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class GetProtectedBranchPullRequestReviewEnforcement {
    GetProtectedBranchPullRequestReviewEnforcement({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetProtectedBranchPullRequestReviewEnforcement.fromRawJson(String str) => GetProtectedBranchPullRequestReviewEnforcement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetProtectedBranchPullRequestReviewEnforcement.fromJson(Map<String, dynamic> json) => GetProtectedBranchPullRequestReviewEnforcement(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * When authenticated with admin or owner permissions to the repository, you can use this
 * endpoint to check whether a branch requires signed commits. An enabled status of `true`
 * indicates you must sign commits on this branch. For more information, see [Signing
 * commits with GPG](https://help.github.com/articles/signing-commits-with-gpg) in GitHub
 * Help.
 *
 * **Note**: You must enable branch protection to require signed commits.
 */
class GetProtectedBranchRequiredSignatures {
    GetProtectedBranchRequiredSignatures({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetProtectedBranchRequiredSignatures.fromRawJson(String str) => GetProtectedBranchRequiredSignatures.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetProtectedBranchRequiredSignatures.fromJson(Map<String, dynamic> json) => GetProtectedBranchRequiredSignatures(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class GetProtectedBranchRequiredStatusChecks {
    GetProtectedBranchRequiredStatusChecks({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetProtectedBranchRequiredStatusChecks.fromRawJson(String str) => GetProtectedBranchRequiredStatusChecks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetProtectedBranchRequiredStatusChecks.fromJson(Map<String, dynamic> json) => GetProtectedBranchRequiredStatusChecks(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Lists who has access to this protected branch. {{#note}}
 *
 * **Note**: Users, apps, and teams `restrictions` are only available for organization-owned
 * repositories.
 */
class GetProtectedBranchRestrictions {
    GetProtectedBranchRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetProtectedBranchRestrictions.fromRawJson(String str) => GetProtectedBranchRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetProtectedBranchRestrictions.fromJson(Map<String, dynamic> json) => GetProtectedBranchRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Each array contains the day number, hour number, and number of commits:
 *
 * *   `0-6`: Sunday - Saturday
 * *   `0-23`: Hour of day
 * *   Number of commits
 *
 * For example, `[2, 14, 25]` indicates that there were 25 total commits, during the 2:00pm
 * hour on Tuesdays. All times are based on the time zone of individual commits.
 */
class GetPunchCardStats {
    GetPunchCardStats({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetPunchCardStats.fromRawJson(String str) => GetPunchCardStats.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetPunchCardStats.fromJson(Map<String, dynamic> json) => GetPunchCardStats(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets the preferred README for a repository.
 *
 * READMEs support [custom media
 * types](https://developer.github.com/v3/repos/contents/#custom-media-types) for retrieving
 * the raw content or rendered HTML.
 */
class GetReadme {
    GetReadme({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetReadme.fromRawJson(String str) => GetReadme.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetReadme.fromJson(Map<String, dynamic> json) => GetReadme(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** This returns an `upload_url` key corresponding to the endpoint for uploading
 * release assets. This key is a [hypermedia
 * resource](https://developer.github.com/v3/#hypermedia).
 */
class GetRelease {
    GetRelease({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetRelease.fromRawJson(String str) => GetRelease.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetRelease.fromJson(Map<String, dynamic> json) => GetRelease(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * To download the asset's binary content, set the `Accept` header of the request to
 * [`application/octet-stream`](https://developer.github.com/v3/media/#media-types). The API
 * will either redirect the client to the location, or stream it directly if possible. API
 * clients should handle both a `200` or `302` response.
 */
class GetReleaseAsset {
    GetReleaseAsset({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetReleaseAsset.fromRawJson(String str) => GetReleaseAsset.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetReleaseAsset.fromJson(Map<String, dynamic> json) => GetReleaseAsset(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Get a published release with the specified tag.
 */
class GetReleaseByTag {
    GetReleaseByTag({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetReleaseByTag.fromRawJson(String str) => GetReleaseByTag.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetReleaseByTag.fromJson(Map<String, dynamic> json) => GetReleaseByTag(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Lists the teams who have push access to this branch. The list includes child teams.
 */
class GetTeamsWithAccessToProtectedBranch {
    GetTeamsWithAccessToProtectedBranch({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetTeamsWithAccessToProtectedBranch.fromRawJson(String str) => GetTeamsWithAccessToProtectedBranch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetTeamsWithAccessToProtectedBranch.fromJson(Map<String, dynamic> json) => GetTeamsWithAccessToProtectedBranch(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Get the top 10 popular contents over the last 14 days.
 */
class GetTopPaths {
    GetTopPaths({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetTopPaths.fromRawJson(String str) => GetTopPaths.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetTopPaths.fromJson(Map<String, dynamic> json) => GetTopPaths(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Get the top 10 referrers over the last 14 days.
 */
class GetTopReferrers {
    GetTopReferrers({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetTopReferrers.fromRawJson(String str) => GetTopReferrers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetTopReferrers.fromJson(Map<String, dynamic> json) => GetTopReferrers(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Lists the people who have push access to this branch.
 */
class GetUsersWithAccessToProtectedBranch {
    GetUsersWithAccessToProtectedBranch({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetUsersWithAccessToProtectedBranch.fromRawJson(String str) => GetUsersWithAccessToProtectedBranch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetUsersWithAccessToProtectedBranch.fromJson(Map<String, dynamic> json) => GetUsersWithAccessToProtectedBranch(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Get the total number of views and breakdown per day or week for the last 14 days.
 * Timestamps are aligned to UTC midnight of the beginning of the day or week. Week begins
 * on Monday.
 */
class GetViews {
    GetViews({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetViews.fromRawJson(String str) => GetViews.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetViews.fromJson(Map<String, dynamic> json) => GetViews(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists repositories that the authenticated user has explicit permission (`:read`,
 * `:write`, or `:admin`) to access.
 *
 * The authenticated user has explicit permission to access repositories they own,
 * repositories where they are a collaborator, and repositories that they can access through
 * an organization membership.
 */
class ReposList {
    ReposList({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposList.fromRawJson(String str) => ReposList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposList.fromJson(Map<String, dynamic> json) => ReposList(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Lists the GitHub Apps that have push access to this branch. Only installed GitHub Apps
 * with `write` access to the `contents` permission can be added as authorized actors on a
 * protected branch.
 */
class ListAppsWithAccessToProtectedBranch {
    ListAppsWithAccessToProtectedBranch({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListAppsWithAccessToProtectedBranch.fromRawJson(String str) => ListAppsWithAccessToProtectedBranch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListAppsWithAccessToProtectedBranch.fromJson(Map<String, dynamic> json) => ListAppsWithAccessToProtectedBranch(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListAssetsForRelease {
    ListAssetsForRelease({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListAssetsForRelease.fromRawJson(String str) => ListAssetsForRelease.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListAssetsForRelease.fromJson(Map<String, dynamic> json) => ListAssetsForRelease(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListBranches {
    ListBranches({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListBranches.fromRawJson(String str) => ListBranches.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListBranches.fromJson(Map<String, dynamic> json) => ListBranches(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Returns all branches where the given commit SHA is the HEAD, or latest commit for the
 * branch.
 */
class ListBranchesForHeadCommit {
    ListBranchesForHeadCommit({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListBranchesForHeadCommit.fromRawJson(String str) => ListBranchesForHeadCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListBranchesForHeadCommit.fromJson(Map<String, dynamic> json) => ListBranchesForHeadCommit(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * For organization-owned repositories, the list of collaborators includes outside
 * collaborators, organization members that are direct collaborators, organization members
 * with access through team memberships, organization members with access through default
 * organization permissions, and organization owners.
 *
 * Team members will include the members of child teams.
 */
class ReposListCollaborators {
    ReposListCollaborators({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposListCollaborators.fromRawJson(String str) => ReposListCollaborators.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposListCollaborators.fromJson(Map<String, dynamic> json) => ReposListCollaborators(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Use the `:commit_sha` to specify the commit that will have its comments listed.
 */
class ListCommentsForCommit {
    ListCommentsForCommit({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListCommentsForCommit.fromRawJson(String str) => ListCommentsForCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListCommentsForCommit.fromJson(Map<String, dynamic> json) => ListCommentsForCommit(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Commit Comments use [these custom media
 * types](https://developer.github.com/v3/repos/comments/#custom-media-types). You can read
 * more about the use of media types in the API
 * [here](https://developer.github.com/v3/media/).
 *
 * Comments are ordered by ascending ID.
 */
class ListCommitComments {
    ListCommitComments({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListCommitComments.fromRawJson(String str) => ListCommitComments.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListCommitComments.fromJson(Map<String, dynamic> json) => ListCommitComments(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Signature verification object**
 *
 * The response will include a `verification` object that describes the result of verifying
 * the commit's signature. The following fields are included in the `verification` object:
 *
 * These are the possible values for `reason` in the `verification` object:
 *
 * | Value                    |
 * Description
 * |
 * | ------------------------ |
 * ---------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `expired_key`            | The key that made the signature is
 * expired.
 * |
 * | `not_signing_key`        | The "signing" flag is not among the usage flags in the GPG
 * key that made the signature.                                           |
 * | `gpgverify_error`        | There was an error communicating with the signature
 * verification service.                                                         |
 * | `gpgverify_unavailable`  | The signature verification service is currently
 * unavailable.                                                                      |
 * | `unsigned`               | The object does not include a
 * signature.
 * |
 * | `unknown_signature_type` | A non-PGP signature was found in the
 * commit.
 * |
 * | `no_user`                | No user was associated with the `committer` email address in
 * the commit.                                                          |
 * | `unverified_email`       | The `committer` email address in the commit was associated
 * with a user, but the email address is not verified on her/his account. |
 * | `bad_email`              | The `committer` email address in the commit is not included
 * in the identities of the PGP key that made the signature.             |
 * | `unknown_key`            | The key that made the signature has not been registered with
 * any user's account.                                                  |
 * | `malformed_signature`    | There was an error parsing the
 * signature.
 * |
 * | `invalid`                | The signature could not be cryptographically verified using
 * the key whose key-id was found in the signature.                      |
 * | `valid`                  | None of the above errors applied, so the signature is
 * considered to be verified.                                                  |
 */
class ReposListCommits {
    ReposListCommits({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposListCommits.fromRawJson(String str) => ReposListCommits.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposListCommits.fromJson(Map<String, dynamic> json) => ReposListCommits(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists contributors to the specified repository and sorts them by the number of commits
 * per contributor in descending order. This endpoint may return information that is a few
 * hours old because the GitHub REST API v3 caches contributor data to improve performance.
 *
 * GitHub identifies contributors by author email address. This endpoint groups contribution
 * counts by GitHub user, which includes all associated email addresses. To improve
 * performance, only the first 500 author email addresses in the repository link to GitHub
 * users. The rest will appear as anonymous contributors without associated GitHub user
 * information.
 */
class ListContributors {
    ListContributors({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListContributors.fromRawJson(String str) => ListContributors.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListContributors.fromJson(Map<String, dynamic> json) => ListContributors(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListDeployKeys {
    ListDeployKeys({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDeployKeys.fromRawJson(String str) => ListDeployKeys.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDeployKeys.fromJson(Map<String, dynamic> json) => ListDeployKeys(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with pull access can view deployment statuses for a deployment:
 */
class ListDeploymentStatuses {
    ListDeploymentStatuses({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDeploymentStatuses.fromRawJson(String str) => ListDeploymentStatuses.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDeploymentStatuses.fromJson(Map<String, dynamic> json) => ListDeploymentStatuses(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Simple filtering of deployments is available via query parameters:
 */
class ListDeployments {
    ListDeployments({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDeployments.fromRawJson(String str) => ListDeployments.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDeployments.fromJson(Map<String, dynamic> json) => ListDeployments(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListDownloads {
    ListDownloads({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDownloads.fromRawJson(String str) => ListDownloads.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDownloads.fromJson(Map<String, dynamic> json) => ListDownloads(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists repositories for the specified organization.
 */
class ReposListForOrg {
    ReposListForOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposListForOrg.fromRawJson(String str) => ReposListForOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposListForOrg.fromJson(Map<String, dynamic> json) => ReposListForOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists public repositories for the specified user.
 */
class ReposListForUser {
    ReposListForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposListForUser.fromRawJson(String str) => ReposListForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposListForUser.fromJson(Map<String, dynamic> json) => ReposListForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ReposListForks {
    ReposListForks({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposListForks.fromRawJson(String str) => ReposListForks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposListForks.fromJson(Map<String, dynamic> json) => ReposListForks(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ReposListHooks {
    ReposListHooks({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposListHooks.fromRawJson(String str) => ReposListHooks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposListHooks.fromJson(Map<String, dynamic> json) => ReposListHooks(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * When authenticating as a user with admin rights to a repository, this endpoint will list
 * all currently open repository invitations.
 */
class ListInvitations {
    ListInvitations({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListInvitations.fromRawJson(String str) => ListInvitations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListInvitations.fromJson(Map<String, dynamic> json) => ListInvitations(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * When authenticating as a user, this endpoint will list all currently open repository
 * invitations for that user.
 */
class ListInvitationsForAuthenticatedUser {
    ListInvitationsForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListInvitationsForAuthenticatedUser.fromRawJson(String str) => ListInvitationsForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListInvitationsForAuthenticatedUser.fromJson(Map<String, dynamic> json) => ListInvitationsForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists languages for the specified repository. The value shown for each language is the
 * number of bytes of code written in that language.
 */
class ListLanguages {
    ListLanguages({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListLanguages.fromRawJson(String str) => ListLanguages.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListLanguages.fromJson(Map<String, dynamic> json) => ListLanguages(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListPagesBuilds {
    ListPagesBuilds({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPagesBuilds.fromRawJson(String str) => ListPagesBuilds.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPagesBuilds.fromJson(Map<String, dynamic> json) => ListPagesBuilds(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class ListProtectedBranchRequiredStatusChecksContexts {
    ListProtectedBranchRequiredStatusChecksContexts({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListProtectedBranchRequiredStatusChecksContexts.fromRawJson(String str) => ListProtectedBranchRequiredStatusChecksContexts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListProtectedBranchRequiredStatusChecksContexts.fromJson(Map<String, dynamic> json) => ListProtectedBranchRequiredStatusChecksContexts(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Lists the teams who have push access to this branch. The list includes child teams.
 */
class ListProtectedBranchTeamRestrictions {
    ListProtectedBranchTeamRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListProtectedBranchTeamRestrictions.fromRawJson(String str) => ListProtectedBranchTeamRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListProtectedBranchTeamRestrictions.fromJson(Map<String, dynamic> json) => ListProtectedBranchTeamRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Lists the people who have push access to this branch.
 */
class ListProtectedBranchUserRestrictions {
    ListProtectedBranchUserRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListProtectedBranchUserRestrictions.fromRawJson(String str) => ListProtectedBranchUserRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListProtectedBranchUserRestrictions.fromJson(Map<String, dynamic> json) => ListProtectedBranchUserRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all public repositories in the order that they were created.
 *
 * Note: Pagination is powered exclusively by the `since` parameter. Use the [Link
 * header](https://developer.github.com/v3/#link-header) to get the URL for the next page of
 * repositories.
 */
class ReposListPublic {
    ReposListPublic({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposListPublic.fromRawJson(String str) => ReposListPublic.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposListPublic.fromJson(Map<String, dynamic> json) => ReposListPublic(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all pull requests containing the provided commit SHA, which can be from any point
 * in the commit history. The results will include open and closed pull requests. Additional
 * preview headers may be required to see certain details for associated pull requests, such
 * as whether a pull request is in a draft state. For more information about previews that
 * might affect this endpoint, see the [List pull
 * requests](https://developer.github.com/v3/pulls/#list-pull-requests) endpoint.
 */
class ListPullRequestsAssociatedWithCommit {
    ListPullRequestsAssociatedWithCommit({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPullRequestsAssociatedWithCommit.fromRawJson(String str) => ListPullRequestsAssociatedWithCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPullRequestsAssociatedWithCommit.fromJson(Map<String, dynamic> json) => ListPullRequestsAssociatedWithCommit(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This returns a list of releases, which does not include regular Git tags that have not
 * been associated with a release. To get a list of Git tags, use the [Repository Tags
 * API](https://developer.github.com/v3/repos/#list-tags).
 *
 * Information about published releases are available to everyone. Only users with push
 * access will receive listings for draft releases.
 */
class ListReleases {
    ListReleases({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReleases.fromRawJson(String str) => ListReleases.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReleases.fromJson(Map<String, dynamic> json) => ListReleases(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with pull access in a repository can view commit statuses for a given ref. The ref
 * can be a SHA, a branch name, or a tag name. Statuses are returned in reverse
 * chronological order. The first status in the list will be the latest one.
 *
 * This resource is also available via a legacy route: `GET
 * /repos/:owner/:repo/statuses/:ref`.
 */
class ListStatusesForRef {
    ListStatusesForRef({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListStatusesForRef.fromRawJson(String str) => ListStatusesForRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListStatusesForRef.fromJson(Map<String, dynamic> json) => ListStatusesForRef(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListTags {
    ListTags({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListTags.fromRawJson(String str) => ListTags.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListTags.fromJson(Map<String, dynamic> json) => ListTags(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListTeams {
    ListTeams({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListTeams.fromRawJson(String str) => ListTeams.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListTeams.fromJson(Map<String, dynamic> json) => ListTeams(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Lists the teams who have push access to this branch. The list includes child teams.
 */
class ListTeamsWithAccessToProtectedBranch {
    ListTeamsWithAccessToProtectedBranch({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListTeamsWithAccessToProtectedBranch.fromRawJson(String str) => ListTeamsWithAccessToProtectedBranch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListTeamsWithAccessToProtectedBranch.fromJson(Map<String, dynamic> json) => ListTeamsWithAccessToProtectedBranch(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListTopics {
    ListTopics({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListTopics.fromRawJson(String str) => ListTopics.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListTopics.fromJson(Map<String, dynamic> json) => ListTopics(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Lists the people who have push access to this branch.
 */
class ListUsersWithAccessToProtectedBranch {
    ListUsersWithAccessToProtectedBranch({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListUsersWithAccessToProtectedBranch.fromRawJson(String str) => ListUsersWithAccessToProtectedBranch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListUsersWithAccessToProtectedBranch.fromJson(Map<String, dynamic> json) => ListUsersWithAccessToProtectedBranch(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ReposMerge {
    ReposMerge({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposMerge.fromRawJson(String str) => ReposMerge.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposMerge.fromJson(Map<String, dynamic> json) => ReposMerge(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This will trigger a [ping event](https://developer.github.com/webhooks/#ping-event) to be
 * sent to the hook.
 */
class ReposPingHook {
    ReposPingHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposPingHook.fromRawJson(String str) => ReposPingHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposPingHook.fromJson(Map<String, dynamic> json) => ReposPingHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class RemoveBranchProtection {
    RemoveBranchProtection({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveBranchProtection.fromRawJson(String str) => RemoveBranchProtection.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveBranchProtection.fromJson(Map<String, dynamic> json) => RemoveBranchProtection(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ReposRemoveCollaborator {
    ReposRemoveCollaborator({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposRemoveCollaborator.fromRawJson(String str) => ReposRemoveCollaborator.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposRemoveCollaborator.fromJson(Map<String, dynamic> json) => ReposRemoveCollaborator(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class RemoveDeployKey {
    RemoveDeployKey({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveDeployKey.fromRawJson(String str) => RemoveDeployKey.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveDeployKey.fromJson(Map<String, dynamic> json) => RemoveDeployKey(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Removing admin enforcement requires admin or owner permissions to the repository and
 * branch protection to be enabled.
 */
class RemoveProtectedBranchAdminEnforcement {
    RemoveProtectedBranchAdminEnforcement({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProtectedBranchAdminEnforcement.fromRawJson(String str) => RemoveProtectedBranchAdminEnforcement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProtectedBranchAdminEnforcement.fromJson(Map<String, dynamic> json) => RemoveProtectedBranchAdminEnforcement(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Removes the ability of an app to push to this branch. Only installed GitHub Apps with
 * `write` access to the `contents` permission can be added as authorized actors on a
 * protected branch.
 *
 * | Type    |
 * Description
 * |
 * | ------- |
 * ----------------------------------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `array` | The GitHub Apps that have push access to this branch. Use the app's `slug`.
 * **Note**: The list of users, apps, and teams in total is limited to 100 items. |
 */
class RemoveProtectedBranchAppRestrictions {
    RemoveProtectedBranchAppRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProtectedBranchAppRestrictions.fromRawJson(String str) => RemoveProtectedBranchAppRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProtectedBranchAppRestrictions.fromJson(Map<String, dynamic> json) => RemoveProtectedBranchAppRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class RemoveProtectedBranchPullRequestReviewEnforcement {
    RemoveProtectedBranchPullRequestReviewEnforcement({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProtectedBranchPullRequestReviewEnforcement.fromRawJson(String str) => RemoveProtectedBranchPullRequestReviewEnforcement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProtectedBranchPullRequestReviewEnforcement.fromJson(Map<String, dynamic> json) => RemoveProtectedBranchPullRequestReviewEnforcement(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * When authenticated with admin or owner permissions to the repository, you can use this
 * endpoint to disable required signed commits on a branch. You must enable branch
 * protection to require signed commits.
 */
class RemoveProtectedBranchRequiredSignatures {
    RemoveProtectedBranchRequiredSignatures({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProtectedBranchRequiredSignatures.fromRawJson(String str) => RemoveProtectedBranchRequiredSignatures.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProtectedBranchRequiredSignatures.fromJson(Map<String, dynamic> json) => RemoveProtectedBranchRequiredSignatures(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class RemoveProtectedBranchRequiredStatusChecks {
    RemoveProtectedBranchRequiredStatusChecks({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProtectedBranchRequiredStatusChecks.fromRawJson(String str) => RemoveProtectedBranchRequiredStatusChecks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProtectedBranchRequiredStatusChecks.fromJson(Map<String, dynamic> json) => RemoveProtectedBranchRequiredStatusChecks(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class RemoveProtectedBranchRequiredStatusChecksContexts {
    RemoveProtectedBranchRequiredStatusChecksContexts({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProtectedBranchRequiredStatusChecksContexts.fromRawJson(String str) => RemoveProtectedBranchRequiredStatusChecksContexts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProtectedBranchRequiredStatusChecksContexts.fromJson(Map<String, dynamic> json) => RemoveProtectedBranchRequiredStatusChecksContexts(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Disables the ability to restrict who can push to this branch.
 */
class RemoveProtectedBranchRestrictions {
    RemoveProtectedBranchRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProtectedBranchRestrictions.fromRawJson(String str) => RemoveProtectedBranchRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProtectedBranchRestrictions.fromJson(Map<String, dynamic> json) => RemoveProtectedBranchRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Removes the ability of a team to push to this branch. You can also remove push access for
 * child teams.
 *
 * | Type    |
 * Description
 * |
 * | ------- |
 * ---------------------------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `array` | Teams that should no longer have push access. Use the team's `slug`.
 * **Note**: The list of users, apps, and teams in total is limited to 100 items. |
 */
class RemoveProtectedBranchTeamRestrictions {
    RemoveProtectedBranchTeamRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProtectedBranchTeamRestrictions.fromRawJson(String str) => RemoveProtectedBranchTeamRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProtectedBranchTeamRestrictions.fromJson(Map<String, dynamic> json) => RemoveProtectedBranchTeamRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Removes the ability of a user to push to this branch.
 *
 * | Type    |
 * Description
 * |
 * | ------- |
 * ---------------------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `array` | Usernames of the people who should no longer have push access. **Note**: The
 * list of users, apps, and teams in total is limited to 100 items. |
 */
class RemoveProtectedBranchUserRestrictions {
    RemoveProtectedBranchUserRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProtectedBranchUserRestrictions.fromRawJson(String str) => RemoveProtectedBranchUserRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProtectedBranchUserRestrictions.fromJson(Map<String, dynamic> json) => RemoveProtectedBranchUserRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Replaces the list of apps that have push access to this branch. This removes all apps
 * that previously had push access and grants push access to the new list of apps. Only
 * installed GitHub Apps with `write` access to the `contents` permission can be added as
 * authorized actors on a protected branch.
 *
 * | Type    |
 * Description
 * |
 * | ------- |
 * ----------------------------------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `array` | The GitHub Apps that have push access to this branch. Use the app's `slug`.
 * **Note**: The list of users, apps, and teams in total is limited to 100 items. |
 */
class ReplaceProtectedBranchAppRestrictions {
    ReplaceProtectedBranchAppRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReplaceProtectedBranchAppRestrictions.fromRawJson(String str) => ReplaceProtectedBranchAppRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReplaceProtectedBranchAppRestrictions.fromJson(Map<String, dynamic> json) => ReplaceProtectedBranchAppRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 */
class ReplaceProtectedBranchRequiredStatusChecksContexts {
    ReplaceProtectedBranchRequiredStatusChecksContexts({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReplaceProtectedBranchRequiredStatusChecksContexts.fromRawJson(String str) => ReplaceProtectedBranchRequiredStatusChecksContexts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReplaceProtectedBranchRequiredStatusChecksContexts.fromJson(Map<String, dynamic> json) => ReplaceProtectedBranchRequiredStatusChecksContexts(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Replaces the list of teams that have push access to this branch. This removes all teams
 * that previously had push access and grants push access to the new list of teams. Team
 * restrictions include child teams.
 *
 * | Type    |
 * Description
 * |
 * | ------- |
 * ------------------------------------------------------------------------------------------------------------------------------------------
 * |
 * | `array` | The teams that can have push access. Use the team's `slug`. **Note**: The
 * list of users, apps, and teams in total is limited to 100 items. |
 */
class ReplaceProtectedBranchTeamRestrictions {
    ReplaceProtectedBranchTeamRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReplaceProtectedBranchTeamRestrictions.fromRawJson(String str) => ReplaceProtectedBranchTeamRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReplaceProtectedBranchTeamRestrictions.fromJson(Map<String, dynamic> json) => ReplaceProtectedBranchTeamRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Replaces the list of people that have push access to this branch. This removes all people
 * that previously had push access and grants push access to the new list of people.
 *
 * | Type    |
 * Description
 * |
 * | ------- |
 * -----------------------------------------------------------------------------------------------------------------------------
 * |
 * | `array` | Usernames for people who can have push access. **Note**: The list of users,
 * apps, and teams in total is limited to 100 items. |
 */
class ReplaceProtectedBranchUserRestrictions {
    ReplaceProtectedBranchUserRestrictions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReplaceProtectedBranchUserRestrictions.fromRawJson(String str) => ReplaceProtectedBranchUserRestrictions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReplaceProtectedBranchUserRestrictions.fromJson(Map<String, dynamic> json) => ReplaceProtectedBranchUserRestrictions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ReplaceTopics {
    ReplaceTopics({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReplaceTopics.fromRawJson(String str) => ReplaceTopics.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReplaceTopics.fromJson(Map<String, dynamic> json) => ReplaceTopics(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The `parent` and `source` objects are present when the repository is a fork. `parent` is
 * the repository this repository was forked from, `source` is the ultimate source for the
 * network.
 */
class ReposGet {
    ReposGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposGet.fromRawJson(String str) => ReposGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposGet.fromJson(Map<String, dynamic> json) => ReposGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * You can request that your site be built from the latest revision on the default branch.
 * This has the same effect as pushing a commit to your default branch, but does not require
 * an additional commit. Manually triggering page builds can be helpful when diagnosing
 * build warnings and failures.
 *
 * Build requests are limited to one concurrent build per repository and one concurrent
 * build per requester. If you request a build while another is still in progress, the
 * second request will be queued until the first completes.
 */
class RequestPageBuild {
    RequestPageBuild({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RequestPageBuild.fromRawJson(String str) => RequestPageBuild.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RequestPageBuild.fromJson(Map<String, dynamic> json) => RequestPageBuild(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This endpoint will return all community profile metrics, including an overall health
 * score, repository description, the presence of documentation, detected code of conduct,
 * detected license, and the presence of ISSUE\_TEMPLATE, PULL\_REQUEST\_TEMPLATE, README,
 * and CONTRIBUTING files.
 */
class RetrieveCommunityProfileMetrics {
    RetrieveCommunityProfileMetrics({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RetrieveCommunityProfileMetrics.fromRawJson(String str) => RetrieveCommunityProfileMetrics.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RetrieveCommunityProfileMetrics.fromJson(Map<String, dynamic> json) => RetrieveCommunityProfileMetrics(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This will trigger the hook with the latest push to the current repository if the hook is
 * subscribed to `push` events. If the hook is not subscribed to `push` events, the server
 * will respond with 204 but no test POST will be generated.
 *
 * **Note**: Previously `/repos/:owner/:repo/hooks/:hook_id/test`
 */
class TestPushHook {
    TestPushHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TestPushHook.fromRawJson(String str) => TestPushHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TestPushHook.fromJson(Map<String, dynamic> json) => TestPushHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * A transfer request will need to be accepted by the new owner when transferring a personal
 * repository to another user. The response will contain the original `owner`, and the
 * transfer will continue asynchronously. For more details on the requirements to transfer
 * personal and organization-owned repositories, see [about repository
 * transfers](https://help.github.com/articles/about-repository-transfers/).
 */
class Transfer {
    Transfer({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Transfer.fromRawJson(String str) => Transfer.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Transfer.fromJson(Map<String, dynamic> json) => Transfer(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note**: To edit a repository's topics, use the [`topics`
 * endpoint](https://developer.github.com/v3/repos/#replace-all-topics-for-a-repository).
 */
class ReposUpdate {
    ReposUpdate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposUpdate.fromRawJson(String str) => ReposUpdate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposUpdate.fromJson(Map<String, dynamic> json) => ReposUpdate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Protecting a branch requires admin or owner permissions to the repository.
 *
 * **Note**: Passing new arrays of `users` and `teams` replaces their previous values.
 *
 * **Note**: The list of users, apps, and teams in total is limited to 100 items.
 */
class UpdateBranchProtection {
    UpdateBranchProtection({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateBranchProtection.fromRawJson(String str) => UpdateBranchProtection.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateBranchProtection.fromJson(Map<String, dynamic> json) => UpdateBranchProtection(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class UpdateCommitComment {
    UpdateCommitComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateCommitComment.fromRawJson(String str) => UpdateCommitComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateCommitComment.fromJson(Map<String, dynamic> json) => UpdateCommitComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a new file or updates an existing file in a repository.
 */
class UpdateFile {
    UpdateFile({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateFile.fromRawJson(String str) => UpdateFile.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateFile.fromJson(Map<String, dynamic> json) => UpdateFile(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ReposUpdateHook {
    ReposUpdateHook({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposUpdateHook.fromRawJson(String str) => ReposUpdateHook.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposUpdateHook.fromJson(Map<String, dynamic> json) => ReposUpdateHook(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class UpdateInformationAboutPagesSite {
    UpdateInformationAboutPagesSite({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateInformationAboutPagesSite.fromRawJson(String str) => UpdateInformationAboutPagesSite.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateInformationAboutPagesSite.fromJson(Map<String, dynamic> json) => UpdateInformationAboutPagesSite(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class UpdateInvitation {
    UpdateInvitation({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateInvitation.fromRawJson(String str) => UpdateInvitation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateInvitation.fromJson(Map<String, dynamic> json) => UpdateInvitation(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Updating pull request review enforcement requires admin or owner permissions to the
 * repository and branch protection to be enabled.
 *
 * **Note**: Passing new arrays of `users` and `teams` replaces their previous values.
 */
class UpdateProtectedBranchPullRequestReviewEnforcement {
    UpdateProtectedBranchPullRequestReviewEnforcement({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateProtectedBranchPullRequestReviewEnforcement.fromRawJson(String str) => UpdateProtectedBranchPullRequestReviewEnforcement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateProtectedBranchPullRequestReviewEnforcement.fromJson(Map<String, dynamic> json) => UpdateProtectedBranchPullRequestReviewEnforcement(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Protected branches are available in public repositories with GitHub Free, and in public
 * and private repositories with GitHub Pro, GitHub Team, and GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Updating required status checks requires admin or owner permissions to the repository and
 * branch protection to be enabled.
 */
class UpdateProtectedBranchRequiredStatusChecks {
    UpdateProtectedBranchRequiredStatusChecks({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateProtectedBranchRequiredStatusChecks.fromRawJson(String str) => UpdateProtectedBranchRequiredStatusChecks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateProtectedBranchRequiredStatusChecks.fromJson(Map<String, dynamic> json) => UpdateProtectedBranchRequiredStatusChecks(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with push access to the repository can edit a release.
 */
class UpdateRelease {
    UpdateRelease({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateRelease.fromRawJson(String str) => UpdateRelease.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateRelease.fromJson(Map<String, dynamic> json) => UpdateRelease(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Users with push access to the repository can edit a release asset.
 */
class UpdateReleaseAsset {
    UpdateReleaseAsset({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateReleaseAsset.fromRawJson(String str) => UpdateReleaseAsset.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateReleaseAsset.fromJson(Map<String, dynamic> json) => UpdateReleaseAsset(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This endpoint makes use of [a Hypermedia
 * relation](https://developer.github.com/v3/#hypermedia) to determine which URL to access.
 * The endpoint you call to upload release assets is specific to your release. Use the
 * `upload_url` returned in the response of the [Create a release
 * endpoint](https://developer.github.com/v3/repos/releases/#create-a-release) to upload a
 * release asset.
 *
 * You need to use an HTTP client which supports
 * [SNI](http://en.wikipedia.org/wiki/Server_Name_Indication) to make calls to this
 * endpoint.
 *
 * Most libraries will set the required `Content-Length` header automatically. Use the
 * required `Content-Type` header to provide the media type of the asset. For a list of
 * media types, see [Media
 * Types](https://www.iana.org/assignments/media-types/media-types.xhtml). For example:
 *
 * `application/zip`
 *
 * GitHub expects the asset data in its raw binary form, rather than JSON. You will send the
 * raw binary content of the asset as the request body. Everything else about the endpoint
 * is the same as the rest of the API. For example, you'll still need to pass your
 * authentication to be able to upload an asset.
 */
class UploadReleaseAsset {
    UploadReleaseAsset({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UploadReleaseAsset.fromRawJson(String str) => UploadReleaseAsset.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UploadReleaseAsset.fromJson(Map<String, dynamic> json) => UploadReleaseAsset(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class OctokitRequest {
    OctokitRequest({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory OctokitRequest.fromRawJson(String str) => OctokitRequest.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OctokitRequest.fromJson(Map<String, dynamic> json) => OctokitRequest(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Search {
    Search({
        this.code,
        this.commits,
        this.emailLegacy,
        this.issues,
        this.issuesAndPullRequests,
        this.issuesLegacy,
        this.labels,
        this.repos,
        this.reposLegacy,
        this.topics,
        this.users,
        this.usersLegacy,
    });

    final Code code;
    final SearchCommits commits;
    final EmailLegacy emailLegacy;
    final SearchIssues issues;
    final IssuesAndPullRequests issuesAndPullRequests;
    final IssuesLegacy issuesLegacy;
    final Labels labels;
    final SearchRepos repos;
    final ReposLegacy reposLegacy;
    final Topics topics;
    final SearchUsers users;
    final UsersLegacy usersLegacy;

    factory Search.fromRawJson(String str) => Search.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        code: json["code"] == null ? null : Code.fromJson(json["code"]),
        commits: json["commits"] == null ? null : SearchCommits.fromJson(json["commits"]),
        emailLegacy: json["emailLegacy"] == null ? null : EmailLegacy.fromJson(json["emailLegacy"]),
        issues: json["issues"] == null ? null : SearchIssues.fromJson(json["issues"]),
        issuesAndPullRequests: json["issuesAndPullRequests"] == null ? null : IssuesAndPullRequests.fromJson(json["issuesAndPullRequests"]),
        issuesLegacy: json["issuesLegacy"] == null ? null : IssuesLegacy.fromJson(json["issuesLegacy"]),
        labels: json["labels"] == null ? null : Labels.fromJson(json["labels"]),
        repos: json["repos"] == null ? null : SearchRepos.fromJson(json["repos"]),
        reposLegacy: json["reposLegacy"] == null ? null : ReposLegacy.fromJson(json["reposLegacy"]),
        topics: json["topics"] == null ? null : Topics.fromJson(json["topics"]),
        users: json["users"] == null ? null : SearchUsers.fromJson(json["users"]),
        usersLegacy: json["usersLegacy"] == null ? null : UsersLegacy.fromJson(json["usersLegacy"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code.toJson(),
        "commits": commits == null ? null : commits.toJson(),
        "emailLegacy": emailLegacy == null ? null : emailLegacy.toJson(),
        "issues": issues == null ? null : issues.toJson(),
        "issuesAndPullRequests": issuesAndPullRequests == null ? null : issuesAndPullRequests.toJson(),
        "issuesLegacy": issuesLegacy == null ? null : issuesLegacy.toJson(),
        "labels": labels == null ? null : labels.toJson(),
        "repos": repos == null ? null : repos.toJson(),
        "reposLegacy": reposLegacy == null ? null : reposLegacy.toJson(),
        "topics": topics == null ? null : topics.toJson(),
        "users": users == null ? null : users.toJson(),
        "usersLegacy": usersLegacy == null ? null : usersLegacy.toJson(),
    };
}

/**
 * Find file contents via various criteria. This method returns up to 100 results [per
 * page](https://developer.github.com/v3/#pagination).
 *
 * When searching for code, you can get text match metadata for the file **content** and
 * file **path** fields when you pass the `text-match` media type. For more details about
 * how to receive highlighted search results, see [Text match
 * metadata](https://developer.github.com/v3/search/#text-match-metadata).
 *
 * **Note:** You must [authenticate](https://developer.github.com/v3/#authentication) to
 * search for code across all public repositories.
 *
 * **Considerations for code search**
 *
 * Due to the complexity of searching code, there are a few restrictions on how searches are
 * performed:
 *
 * *   Only the _default branch_ is considered. In most cases, this will be the `master`
 * branch.
 * *   Only files smaller than 384 KB are searchable.
 * *   You must always include at least one search term when searching source code. For
 * example, searching for
 * [`language:go`](https://github.com/search?utf8=%E2%9C%93&q=language%3Ago&type=Code) is
 * not valid, while [`amazing
 * language:go`](https://github.com/search?utf8=%E2%9C%93&q=amazing+language%3Ago&type=Code)
 * is.
 *
 * Suppose you want to find the definition of the `addClass` function inside
 * [jQuery](https://github.com/jquery/jquery). Your query would look something like this:
 *
 * Here, we're searching for the keyword `addClass` within a file's contents. We're making
 * sure that we're only looking in files where the language is JavaScript. And we're scoping
 * the search to the `repo:jquery/jquery` repository.
 */
class Code {
    Code({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Code.fromRawJson(String str) => Code.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Code.fromJson(Map<String, dynamic> json) => Code(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Find commits via various criteria. This method returns up to 100 results [per
 * page](https://developer.github.com/v3/#pagination).
 *
 * When searching for commits, you can get text match metadata for the **message** field
 * when you provide the `text-match` media type. For more details about how to receive
 * highlighted search results, see [Text match
 * metadata](https://developer.github.com/v3/search/#text-match-metadata).
 *
 * **Considerations for commit search**
 *
 * Only the _default branch_ is considered. In most cases, this will be the `master`
 * branch.
 *
 * Suppose you want to find commits related to CSS in the
 * [octocat/Spoon-Knife](https://github.com/octocat/Spoon-Knife) repository. Your query
 * would look something like this:
 */
class SearchCommits {
    SearchCommits({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory SearchCommits.fromRawJson(String str) => SearchCommits.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchCommits.fromJson(Map<String, dynamic> json) => SearchCommits(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This API call is added for compatibility reasons only. There's no guarantee that full
 * email searches will always be available. The `@` character in the address must be left
 * unencoded. Searches only against public email addresses (as configured on the user's
 * GitHub profile).
 */
class EmailLegacy {
    EmailLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory EmailLegacy.fromRawJson(String str) => EmailLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EmailLegacy.fromJson(Map<String, dynamic> json) => EmailLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Find issues by state and keyword. This method returns up to 100 results [per
 * page](https://developer.github.com/v3/#pagination).
 *
 * When searching for issues, you can get text match metadata for the issue **title**, issue
 * **body**, and issue **comment body** fields when you pass the `text-match` media type.
 * For more details about how to receive highlighted search results, see [Text match
 * metadata](https://developer.github.com/v3/search/#text-match-metadata).
 *
 * Let's say you want to find the oldest unresolved Python bugs on Windows. Your query might
 * look something like this.
 *
 * In this query, we're searching for the keyword `windows`, within any open issue that's
 * labeled as `bug`. The search runs across repositories whose primary language is Python.
 * We’re sorting by creation date in ascending order, so that the oldest issues appear first
 * in the search results.
 */
class SearchIssues {
    SearchIssues({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory SearchIssues.fromRawJson(String str) => SearchIssues.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchIssues.fromJson(Map<String, dynamic> json) => SearchIssues(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Find issues by state and keyword. This method returns up to 100 results [per
 * page](https://developer.github.com/v3/#pagination).
 *
 * When searching for issues, you can get text match metadata for the issue **title**, issue
 * **body**, and issue **comment body** fields when you pass the `text-match` media type.
 * For more details about how to receive highlighted search results, see [Text match
 * metadata](https://developer.github.com/v3/search/#text-match-metadata).
 *
 * Let's say you want to find the oldest unresolved Python bugs on Windows. Your query might
 * look something like this.
 *
 * In this query, we're searching for the keyword `windows`, within any open issue that's
 * labeled as `bug`. The search runs across repositories whose primary language is Python.
 * We’re sorting by creation date in ascending order, so that the oldest issues appear first
 * in the search results.
 */
class IssuesAndPullRequests {
    IssuesAndPullRequests({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesAndPullRequests.fromRawJson(String str) => IssuesAndPullRequests.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesAndPullRequests.fromJson(Map<String, dynamic> json) => IssuesAndPullRequests(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Find issues by state and keyword.
 */
class IssuesLegacy {
    IssuesLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory IssuesLegacy.fromRawJson(String str) => IssuesLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IssuesLegacy.fromJson(Map<String, dynamic> json) => IssuesLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Find labels in a repository with names or descriptions that match search keywords.
 * Returns up to 100 results [per page](https://developer.github.com/v3/#pagination).
 *
 * When searching for labels, you can get text match metadata for the label **name** and
 * **description** fields when you pass the `text-match` media type. For more details about
 * how to receive highlighted search results, see [Text match
 * metadata](https://developer.github.com/v3/search/#text-match-metadata).
 *
 * Suppose you want to find labels in the `linguist` repository that match `bug`, `defect`,
 * or `enhancement`. Your query might look like this:
 *
 * The labels that best match for the query appear first in the search results.
 */
class Labels {
    Labels({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Labels.fromRawJson(String str) => Labels.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Labels.fromJson(Map<String, dynamic> json) => Labels(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Find repositories via various criteria. This method returns up to 100 results [per
 * page](https://developer.github.com/v3/#pagination).
 *
 * When searching for repositories, you can get text match metadata for the **name** and
 * **description** fields when you pass the `text-match` media type. For more details about
 * how to receive highlighted search results, see [Text match
 * metadata](https://developer.github.com/v3/search/#text-match-metadata).
 *
 * Suppose you want to search for popular Tetris repositories written in Assembly. Your
 * query might look like this.
 *
 * You can search for multiple topics by adding more `topic:` instances, and including the
 * `mercy-preview` header. For example:
 *
 * In this request, we're searching for repositories with the word `tetris` in the name, the
 * description, or the README. We're limiting the results to only find repositories where
 * the primary language is Assembly. We're sorting by stars in descending order, so that the
 * most popular repositories appear first in the search results.
 */
class SearchRepos {
    SearchRepos({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory SearchRepos.fromRawJson(String str) => SearchRepos.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchRepos.fromJson(Map<String, dynamic> json) => SearchRepos(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Find repositories by keyword. Note, this legacy method does not follow the v3 pagination
 * pattern. This method returns up to 100 results per page and pages can be fetched using
 * the `start_page` parameter.
 */
class ReposLegacy {
    ReposLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReposLegacy.fromRawJson(String str) => ReposLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReposLegacy.fromJson(Map<String, dynamic> json) => ReposLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Find topics via various criteria. Results are sorted by best match. This method returns
 * up to 100 results [per page](https://developer.github.com/v3/#pagination).
 *
 * When searching for topics, you can get text match metadata for the topic's
 * **short\_description**, **description**, **name**, or **display\_name** field when you
 * pass the `text-match` media type. For more details about how to receive highlighted
 * search results, see [Text match
 * metadata](https://developer.github.com/v3/search/#text-match-metadata).
 *
 * See "[Searching topics](https://help.github.com/articles/searching-topics/)" for a
 * detailed list of qualifiers.
 *
 * Suppose you want to search for topics related to Ruby that are featured on
 * [https://github.com/topics](https://github.com/topics). Your query might look like this:
 *
 * In this request, we're searching for topics with the keyword `ruby`, and we're limiting
 * the results to find only topics that are featured. The topics that are the best match for
 * the query appear first in the search results.
 *
 * **Note:** A search for featured Ruby topics only has 6 total results, so a [Link
 * header](https://developer.github.com/v3/#link-header) indicating pagination is not
 * included in the response.
 */
class Topics {
    Topics({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Topics.fromRawJson(String str) => Topics.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Topics.fromJson(Map<String, dynamic> json) => Topics(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Find users via various criteria. This method returns up to 100 results [per
 * page](https://developer.github.com/v3/#pagination).
 *
 * When searching for users, you can get text match metadata for the issue **login**,
 * **email**, and **name** fields when you pass the `text-match` media type. For more
 * details about highlighting search results, see [Text match
 * metadata](https://developer.github.com/v3/search/#text-match-metadata). For more details
 * about how to receive highlighted search results, see [Text match
 * metadata](https://developer.github.com/v3/search/#text-match-metadata).
 *
 * Imagine you're looking for a list of popular users. You might try out this query:
 *
 * Here, we're looking at users with the name Tom. We're only interested in those with more
 * than 42 repositories, and only if they have over 1,000 followers.
 */
class SearchUsers {
    SearchUsers({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory SearchUsers.fromRawJson(String str) => SearchUsers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchUsers.fromJson(Map<String, dynamic> json) => SearchUsers(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Find users by keyword.
 */
class UsersLegacy {
    UsersLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UsersLegacy.fromRawJson(String str) => UsersLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UsersLegacy.fromJson(Map<String, dynamic> json) => UsersLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Teams {
    Teams({
        this.addMember,
        this.addMemberLegacy,
        this.addOrUpdateMembership,
        this.addOrUpdateMembershipInOrg,
        this.addOrUpdateMembershipLegacy,
        this.addOrUpdateProject,
        this.addOrUpdateProjectInOrg,
        this.addOrUpdateProjectLegacy,
        this.addOrUpdateRepo,
        this.addOrUpdateRepoInOrg,
        this.addOrUpdateRepoLegacy,
        this.checkManagesRepo,
        this.checkManagesRepoInOrg,
        this.checkManagesRepoLegacy,
        this.create,
        this.createDiscussion,
        this.createDiscussionComment,
        this.createDiscussionCommentInOrg,
        this.createDiscussionCommentLegacy,
        this.createDiscussionInOrg,
        this.createDiscussionLegacy,
        this.delete,
        this.deleteDiscussion,
        this.deleteDiscussionComment,
        this.deleteDiscussionCommentInOrg,
        this.deleteDiscussionCommentLegacy,
        this.deleteDiscussionInOrg,
        this.deleteDiscussionLegacy,
        this.deleteInOrg,
        this.deleteLegacy,
        this.teamsGet,
        this.getByName,
        this.getDiscussion,
        this.getDiscussionComment,
        this.getDiscussionCommentInOrg,
        this.getDiscussionCommentLegacy,
        this.getDiscussionInOrg,
        this.getDiscussionLegacy,
        this.getLegacy,
        this.getMember,
        this.getMemberLegacy,
        this.getMembership,
        this.getMembershipInOrg,
        this.getMembershipLegacy,
        this.list,
        this.listChild,
        this.listChildInOrg,
        this.listChildLegacy,
        this.listDiscussionComments,
        this.listDiscussionCommentsInOrg,
        this.listDiscussionCommentsLegacy,
        this.listDiscussions,
        this.listDiscussionsInOrg,
        this.listDiscussionsLegacy,
        this.listForAuthenticatedUser,
        this.listMembers,
        this.listMembersInOrg,
        this.listMembersLegacy,
        this.listPendingInvitations,
        this.listPendingInvitationsInOrg,
        this.listPendingInvitationsLegacy,
        this.listProjects,
        this.listProjectsInOrg,
        this.listProjectsLegacy,
        this.listRepos,
        this.listReposInOrg,
        this.listReposLegacy,
        this.removeMember,
        this.removeMemberLegacy,
        this.removeMembership,
        this.removeMembershipInOrg,
        this.removeMembershipLegacy,
        this.removeProject,
        this.removeProjectInOrg,
        this.removeProjectLegacy,
        this.removeRepo,
        this.removeRepoInOrg,
        this.removeRepoLegacy,
        this.reviewProject,
        this.reviewProjectInOrg,
        this.reviewProjectLegacy,
        this.update,
        this.updateDiscussion,
        this.updateDiscussionComment,
        this.updateDiscussionCommentInOrg,
        this.updateDiscussionCommentLegacy,
        this.updateDiscussionInOrg,
        this.updateDiscussionLegacy,
        this.updateInOrg,
        this.updateLegacy,
    });

    final AddMember addMember;
    final AddMemberLegacy addMemberLegacy;
    final TeamsAddOrUpdateMembership addOrUpdateMembership;
    final AddOrUpdateMembershipInOrg addOrUpdateMembershipInOrg;
    final AddOrUpdateMembershipLegacy addOrUpdateMembershipLegacy;
    final AddOrUpdateProject addOrUpdateProject;
    final AddOrUpdateProjectInOrg addOrUpdateProjectInOrg;
    final AddOrUpdateProjectLegacy addOrUpdateProjectLegacy;
    final AddOrUpdateRepo addOrUpdateRepo;
    final AddOrUpdateRepoInOrg addOrUpdateRepoInOrg;
    final AddOrUpdateRepoLegacy addOrUpdateRepoLegacy;
    final CheckManagesRepo checkManagesRepo;
    final CheckManagesRepoInOrg checkManagesRepoInOrg;
    final CheckManagesRepoLegacy checkManagesRepoLegacy;
    final TeamsCreate create;
    final CreateDiscussion createDiscussion;
    final CreateDiscussionComment createDiscussionComment;
    final CreateDiscussionCommentInOrg createDiscussionCommentInOrg;
    final CreateDiscussionCommentLegacy createDiscussionCommentLegacy;
    final CreateDiscussionInOrg createDiscussionInOrg;
    final CreateDiscussionLegacy createDiscussionLegacy;
    final TeamsDelete delete;
    final DeleteDiscussion deleteDiscussion;
    final DeleteDiscussionComment deleteDiscussionComment;
    final DeleteDiscussionCommentInOrg deleteDiscussionCommentInOrg;
    final DeleteDiscussionCommentLegacy deleteDiscussionCommentLegacy;
    final DeleteDiscussionInOrg deleteDiscussionInOrg;
    final DeleteDiscussionLegacy deleteDiscussionLegacy;
    final DeleteInOrg deleteInOrg;
    final DeleteLegacy deleteLegacy;
    final TeamsGet teamsGet;
    final GetByName getByName;
    final GetDiscussion getDiscussion;
    final GetDiscussionComment getDiscussionComment;
    final GetDiscussionCommentInOrg getDiscussionCommentInOrg;
    final GetDiscussionCommentLegacy getDiscussionCommentLegacy;
    final GetDiscussionInOrg getDiscussionInOrg;
    final GetDiscussionLegacy getDiscussionLegacy;
    final GetLegacy getLegacy;
    final GetMember getMember;
    final GetMemberLegacy getMemberLegacy;
    final TeamsGetMembership getMembership;
    final GetMembershipInOrg getMembershipInOrg;
    final GetMembershipLegacy getMembershipLegacy;
    final TeamsList list;
    final ListChild listChild;
    final ListChildInOrg listChildInOrg;
    final ListChildLegacy listChildLegacy;
    final ListDiscussionComments listDiscussionComments;
    final ListDiscussionCommentsInOrg listDiscussionCommentsInOrg;
    final ListDiscussionCommentsLegacy listDiscussionCommentsLegacy;
    final ListDiscussions listDiscussions;
    final ListDiscussionsInOrg listDiscussionsInOrg;
    final ListDiscussionsLegacy listDiscussionsLegacy;
    final TeamsListForAuthenticatedUser listForAuthenticatedUser;
    final TeamsListMembers listMembers;
    final ListMembersInOrg listMembersInOrg;
    final ListMembersLegacy listMembersLegacy;
    final TeamsListPendingInvitations listPendingInvitations;
    final ListPendingInvitationsInOrg listPendingInvitationsInOrg;
    final ListPendingInvitationsLegacy listPendingInvitationsLegacy;
    final ListProjects listProjects;
    final ListProjectsInOrg listProjectsInOrg;
    final ListProjectsLegacy listProjectsLegacy;
    final TeamsListRepos listRepos;
    final ListReposInOrg listReposInOrg;
    final ListReposLegacy listReposLegacy;
    final TeamsRemoveMember removeMember;
    final RemoveMemberLegacy removeMemberLegacy;
    final TeamsRemoveMembership removeMembership;
    final RemoveMembershipInOrg removeMembershipInOrg;
    final RemoveMembershipLegacy removeMembershipLegacy;
    final RemoveProject removeProject;
    final RemoveProjectInOrg removeProjectInOrg;
    final RemoveProjectLegacy removeProjectLegacy;
    final RemoveRepo removeRepo;
    final RemoveRepoInOrg removeRepoInOrg;
    final RemoveRepoLegacy removeRepoLegacy;
    final ReviewProject reviewProject;
    final ReviewProjectInOrg reviewProjectInOrg;
    final ReviewProjectLegacy reviewProjectLegacy;
    final TeamsUpdate update;
    final UpdateDiscussion updateDiscussion;
    final UpdateDiscussionComment updateDiscussionComment;
    final UpdateDiscussionCommentInOrg updateDiscussionCommentInOrg;
    final UpdateDiscussionCommentLegacy updateDiscussionCommentLegacy;
    final UpdateDiscussionInOrg updateDiscussionInOrg;
    final UpdateDiscussionLegacy updateDiscussionLegacy;
    final UpdateInOrg updateInOrg;
    final UpdateLegacy updateLegacy;

    factory Teams.fromRawJson(String str) => Teams.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        addMember: json["addMember"] == null ? null : AddMember.fromJson(json["addMember"]),
        addMemberLegacy: json["addMemberLegacy"] == null ? null : AddMemberLegacy.fromJson(json["addMemberLegacy"]),
        addOrUpdateMembership: json["addOrUpdateMembership"] == null ? null : TeamsAddOrUpdateMembership.fromJson(json["addOrUpdateMembership"]),
        addOrUpdateMembershipInOrg: json["addOrUpdateMembershipInOrg"] == null ? null : AddOrUpdateMembershipInOrg.fromJson(json["addOrUpdateMembershipInOrg"]),
        addOrUpdateMembershipLegacy: json["addOrUpdateMembershipLegacy"] == null ? null : AddOrUpdateMembershipLegacy.fromJson(json["addOrUpdateMembershipLegacy"]),
        addOrUpdateProject: json["addOrUpdateProject"] == null ? null : AddOrUpdateProject.fromJson(json["addOrUpdateProject"]),
        addOrUpdateProjectInOrg: json["addOrUpdateProjectInOrg"] == null ? null : AddOrUpdateProjectInOrg.fromJson(json["addOrUpdateProjectInOrg"]),
        addOrUpdateProjectLegacy: json["addOrUpdateProjectLegacy"] == null ? null : AddOrUpdateProjectLegacy.fromJson(json["addOrUpdateProjectLegacy"]),
        addOrUpdateRepo: json["addOrUpdateRepo"] == null ? null : AddOrUpdateRepo.fromJson(json["addOrUpdateRepo"]),
        addOrUpdateRepoInOrg: json["addOrUpdateRepoInOrg"] == null ? null : AddOrUpdateRepoInOrg.fromJson(json["addOrUpdateRepoInOrg"]),
        addOrUpdateRepoLegacy: json["addOrUpdateRepoLegacy"] == null ? null : AddOrUpdateRepoLegacy.fromJson(json["addOrUpdateRepoLegacy"]),
        checkManagesRepo: json["checkManagesRepo"] == null ? null : CheckManagesRepo.fromJson(json["checkManagesRepo"]),
        checkManagesRepoInOrg: json["checkManagesRepoInOrg"] == null ? null : CheckManagesRepoInOrg.fromJson(json["checkManagesRepoInOrg"]),
        checkManagesRepoLegacy: json["checkManagesRepoLegacy"] == null ? null : CheckManagesRepoLegacy.fromJson(json["checkManagesRepoLegacy"]),
        create: json["create"] == null ? null : TeamsCreate.fromJson(json["create"]),
        createDiscussion: json["createDiscussion"] == null ? null : CreateDiscussion.fromJson(json["createDiscussion"]),
        createDiscussionComment: json["createDiscussionComment"] == null ? null : CreateDiscussionComment.fromJson(json["createDiscussionComment"]),
        createDiscussionCommentInOrg: json["createDiscussionCommentInOrg"] == null ? null : CreateDiscussionCommentInOrg.fromJson(json["createDiscussionCommentInOrg"]),
        createDiscussionCommentLegacy: json["createDiscussionCommentLegacy"] == null ? null : CreateDiscussionCommentLegacy.fromJson(json["createDiscussionCommentLegacy"]),
        createDiscussionInOrg: json["createDiscussionInOrg"] == null ? null : CreateDiscussionInOrg.fromJson(json["createDiscussionInOrg"]),
        createDiscussionLegacy: json["createDiscussionLegacy"] == null ? null : CreateDiscussionLegacy.fromJson(json["createDiscussionLegacy"]),
        delete: json["delete"] == null ? null : TeamsDelete.fromJson(json["delete"]),
        deleteDiscussion: json["deleteDiscussion"] == null ? null : DeleteDiscussion.fromJson(json["deleteDiscussion"]),
        deleteDiscussionComment: json["deleteDiscussionComment"] == null ? null : DeleteDiscussionComment.fromJson(json["deleteDiscussionComment"]),
        deleteDiscussionCommentInOrg: json["deleteDiscussionCommentInOrg"] == null ? null : DeleteDiscussionCommentInOrg.fromJson(json["deleteDiscussionCommentInOrg"]),
        deleteDiscussionCommentLegacy: json["deleteDiscussionCommentLegacy"] == null ? null : DeleteDiscussionCommentLegacy.fromJson(json["deleteDiscussionCommentLegacy"]),
        deleteDiscussionInOrg: json["deleteDiscussionInOrg"] == null ? null : DeleteDiscussionInOrg.fromJson(json["deleteDiscussionInOrg"]),
        deleteDiscussionLegacy: json["deleteDiscussionLegacy"] == null ? null : DeleteDiscussionLegacy.fromJson(json["deleteDiscussionLegacy"]),
        deleteInOrg: json["deleteInOrg"] == null ? null : DeleteInOrg.fromJson(json["deleteInOrg"]),
        deleteLegacy: json["deleteLegacy"] == null ? null : DeleteLegacy.fromJson(json["deleteLegacy"]),
        teamsGet: json["get"] == null ? null : TeamsGet.fromJson(json["get"]),
        getByName: json["getByName"] == null ? null : GetByName.fromJson(json["getByName"]),
        getDiscussion: json["getDiscussion"] == null ? null : GetDiscussion.fromJson(json["getDiscussion"]),
        getDiscussionComment: json["getDiscussionComment"] == null ? null : GetDiscussionComment.fromJson(json["getDiscussionComment"]),
        getDiscussionCommentInOrg: json["getDiscussionCommentInOrg"] == null ? null : GetDiscussionCommentInOrg.fromJson(json["getDiscussionCommentInOrg"]),
        getDiscussionCommentLegacy: json["getDiscussionCommentLegacy"] == null ? null : GetDiscussionCommentLegacy.fromJson(json["getDiscussionCommentLegacy"]),
        getDiscussionInOrg: json["getDiscussionInOrg"] == null ? null : GetDiscussionInOrg.fromJson(json["getDiscussionInOrg"]),
        getDiscussionLegacy: json["getDiscussionLegacy"] == null ? null : GetDiscussionLegacy.fromJson(json["getDiscussionLegacy"]),
        getLegacy: json["getLegacy"] == null ? null : GetLegacy.fromJson(json["getLegacy"]),
        getMember: json["getMember"] == null ? null : GetMember.fromJson(json["getMember"]),
        getMemberLegacy: json["getMemberLegacy"] == null ? null : GetMemberLegacy.fromJson(json["getMemberLegacy"]),
        getMembership: json["getMembership"] == null ? null : TeamsGetMembership.fromJson(json["getMembership"]),
        getMembershipInOrg: json["getMembershipInOrg"] == null ? null : GetMembershipInOrg.fromJson(json["getMembershipInOrg"]),
        getMembershipLegacy: json["getMembershipLegacy"] == null ? null : GetMembershipLegacy.fromJson(json["getMembershipLegacy"]),
        list: json["list"] == null ? null : TeamsList.fromJson(json["list"]),
        listChild: json["listChild"] == null ? null : ListChild.fromJson(json["listChild"]),
        listChildInOrg: json["listChildInOrg"] == null ? null : ListChildInOrg.fromJson(json["listChildInOrg"]),
        listChildLegacy: json["listChildLegacy"] == null ? null : ListChildLegacy.fromJson(json["listChildLegacy"]),
        listDiscussionComments: json["listDiscussionComments"] == null ? null : ListDiscussionComments.fromJson(json["listDiscussionComments"]),
        listDiscussionCommentsInOrg: json["listDiscussionCommentsInOrg"] == null ? null : ListDiscussionCommentsInOrg.fromJson(json["listDiscussionCommentsInOrg"]),
        listDiscussionCommentsLegacy: json["listDiscussionCommentsLegacy"] == null ? null : ListDiscussionCommentsLegacy.fromJson(json["listDiscussionCommentsLegacy"]),
        listDiscussions: json["listDiscussions"] == null ? null : ListDiscussions.fromJson(json["listDiscussions"]),
        listDiscussionsInOrg: json["listDiscussionsInOrg"] == null ? null : ListDiscussionsInOrg.fromJson(json["listDiscussionsInOrg"]),
        listDiscussionsLegacy: json["listDiscussionsLegacy"] == null ? null : ListDiscussionsLegacy.fromJson(json["listDiscussionsLegacy"]),
        listForAuthenticatedUser: json["listForAuthenticatedUser"] == null ? null : TeamsListForAuthenticatedUser.fromJson(json["listForAuthenticatedUser"]),
        listMembers: json["listMembers"] == null ? null : TeamsListMembers.fromJson(json["listMembers"]),
        listMembersInOrg: json["listMembersInOrg"] == null ? null : ListMembersInOrg.fromJson(json["listMembersInOrg"]),
        listMembersLegacy: json["listMembersLegacy"] == null ? null : ListMembersLegacy.fromJson(json["listMembersLegacy"]),
        listPendingInvitations: json["listPendingInvitations"] == null ? null : TeamsListPendingInvitations.fromJson(json["listPendingInvitations"]),
        listPendingInvitationsInOrg: json["listPendingInvitationsInOrg"] == null ? null : ListPendingInvitationsInOrg.fromJson(json["listPendingInvitationsInOrg"]),
        listPendingInvitationsLegacy: json["listPendingInvitationsLegacy"] == null ? null : ListPendingInvitationsLegacy.fromJson(json["listPendingInvitationsLegacy"]),
        listProjects: json["listProjects"] == null ? null : ListProjects.fromJson(json["listProjects"]),
        listProjectsInOrg: json["listProjectsInOrg"] == null ? null : ListProjectsInOrg.fromJson(json["listProjectsInOrg"]),
        listProjectsLegacy: json["listProjectsLegacy"] == null ? null : ListProjectsLegacy.fromJson(json["listProjectsLegacy"]),
        listRepos: json["listRepos"] == null ? null : TeamsListRepos.fromJson(json["listRepos"]),
        listReposInOrg: json["listReposInOrg"] == null ? null : ListReposInOrg.fromJson(json["listReposInOrg"]),
        listReposLegacy: json["listReposLegacy"] == null ? null : ListReposLegacy.fromJson(json["listReposLegacy"]),
        removeMember: json["removeMember"] == null ? null : TeamsRemoveMember.fromJson(json["removeMember"]),
        removeMemberLegacy: json["removeMemberLegacy"] == null ? null : RemoveMemberLegacy.fromJson(json["removeMemberLegacy"]),
        removeMembership: json["removeMembership"] == null ? null : TeamsRemoveMembership.fromJson(json["removeMembership"]),
        removeMembershipInOrg: json["removeMembershipInOrg"] == null ? null : RemoveMembershipInOrg.fromJson(json["removeMembershipInOrg"]),
        removeMembershipLegacy: json["removeMembershipLegacy"] == null ? null : RemoveMembershipLegacy.fromJson(json["removeMembershipLegacy"]),
        removeProject: json["removeProject"] == null ? null : RemoveProject.fromJson(json["removeProject"]),
        removeProjectInOrg: json["removeProjectInOrg"] == null ? null : RemoveProjectInOrg.fromJson(json["removeProjectInOrg"]),
        removeProjectLegacy: json["removeProjectLegacy"] == null ? null : RemoveProjectLegacy.fromJson(json["removeProjectLegacy"]),
        removeRepo: json["removeRepo"] == null ? null : RemoveRepo.fromJson(json["removeRepo"]),
        removeRepoInOrg: json["removeRepoInOrg"] == null ? null : RemoveRepoInOrg.fromJson(json["removeRepoInOrg"]),
        removeRepoLegacy: json["removeRepoLegacy"] == null ? null : RemoveRepoLegacy.fromJson(json["removeRepoLegacy"]),
        reviewProject: json["reviewProject"] == null ? null : ReviewProject.fromJson(json["reviewProject"]),
        reviewProjectInOrg: json["reviewProjectInOrg"] == null ? null : ReviewProjectInOrg.fromJson(json["reviewProjectInOrg"]),
        reviewProjectLegacy: json["reviewProjectLegacy"] == null ? null : ReviewProjectLegacy.fromJson(json["reviewProjectLegacy"]),
        update: json["update"] == null ? null : TeamsUpdate.fromJson(json["update"]),
        updateDiscussion: json["updateDiscussion"] == null ? null : UpdateDiscussion.fromJson(json["updateDiscussion"]),
        updateDiscussionComment: json["updateDiscussionComment"] == null ? null : UpdateDiscussionComment.fromJson(json["updateDiscussionComment"]),
        updateDiscussionCommentInOrg: json["updateDiscussionCommentInOrg"] == null ? null : UpdateDiscussionCommentInOrg.fromJson(json["updateDiscussionCommentInOrg"]),
        updateDiscussionCommentLegacy: json["updateDiscussionCommentLegacy"] == null ? null : UpdateDiscussionCommentLegacy.fromJson(json["updateDiscussionCommentLegacy"]),
        updateDiscussionInOrg: json["updateDiscussionInOrg"] == null ? null : UpdateDiscussionInOrg.fromJson(json["updateDiscussionInOrg"]),
        updateDiscussionLegacy: json["updateDiscussionLegacy"] == null ? null : UpdateDiscussionLegacy.fromJson(json["updateDiscussionLegacy"]),
        updateInOrg: json["updateInOrg"] == null ? null : UpdateInOrg.fromJson(json["updateInOrg"]),
        updateLegacy: json["updateLegacy"] == null ? null : UpdateLegacy.fromJson(json["updateLegacy"]),
    );

    Map<String, dynamic> toJson() => {
        "addMember": addMember == null ? null : addMember.toJson(),
        "addMemberLegacy": addMemberLegacy == null ? null : addMemberLegacy.toJson(),
        "addOrUpdateMembership": addOrUpdateMembership == null ? null : addOrUpdateMembership.toJson(),
        "addOrUpdateMembershipInOrg": addOrUpdateMembershipInOrg == null ? null : addOrUpdateMembershipInOrg.toJson(),
        "addOrUpdateMembershipLegacy": addOrUpdateMembershipLegacy == null ? null : addOrUpdateMembershipLegacy.toJson(),
        "addOrUpdateProject": addOrUpdateProject == null ? null : addOrUpdateProject.toJson(),
        "addOrUpdateProjectInOrg": addOrUpdateProjectInOrg == null ? null : addOrUpdateProjectInOrg.toJson(),
        "addOrUpdateProjectLegacy": addOrUpdateProjectLegacy == null ? null : addOrUpdateProjectLegacy.toJson(),
        "addOrUpdateRepo": addOrUpdateRepo == null ? null : addOrUpdateRepo.toJson(),
        "addOrUpdateRepoInOrg": addOrUpdateRepoInOrg == null ? null : addOrUpdateRepoInOrg.toJson(),
        "addOrUpdateRepoLegacy": addOrUpdateRepoLegacy == null ? null : addOrUpdateRepoLegacy.toJson(),
        "checkManagesRepo": checkManagesRepo == null ? null : checkManagesRepo.toJson(),
        "checkManagesRepoInOrg": checkManagesRepoInOrg == null ? null : checkManagesRepoInOrg.toJson(),
        "checkManagesRepoLegacy": checkManagesRepoLegacy == null ? null : checkManagesRepoLegacy.toJson(),
        "create": create == null ? null : create.toJson(),
        "createDiscussion": createDiscussion == null ? null : createDiscussion.toJson(),
        "createDiscussionComment": createDiscussionComment == null ? null : createDiscussionComment.toJson(),
        "createDiscussionCommentInOrg": createDiscussionCommentInOrg == null ? null : createDiscussionCommentInOrg.toJson(),
        "createDiscussionCommentLegacy": createDiscussionCommentLegacy == null ? null : createDiscussionCommentLegacy.toJson(),
        "createDiscussionInOrg": createDiscussionInOrg == null ? null : createDiscussionInOrg.toJson(),
        "createDiscussionLegacy": createDiscussionLegacy == null ? null : createDiscussionLegacy.toJson(),
        "delete": delete == null ? null : delete.toJson(),
        "deleteDiscussion": deleteDiscussion == null ? null : deleteDiscussion.toJson(),
        "deleteDiscussionComment": deleteDiscussionComment == null ? null : deleteDiscussionComment.toJson(),
        "deleteDiscussionCommentInOrg": deleteDiscussionCommentInOrg == null ? null : deleteDiscussionCommentInOrg.toJson(),
        "deleteDiscussionCommentLegacy": deleteDiscussionCommentLegacy == null ? null : deleteDiscussionCommentLegacy.toJson(),
        "deleteDiscussionInOrg": deleteDiscussionInOrg == null ? null : deleteDiscussionInOrg.toJson(),
        "deleteDiscussionLegacy": deleteDiscussionLegacy == null ? null : deleteDiscussionLegacy.toJson(),
        "deleteInOrg": deleteInOrg == null ? null : deleteInOrg.toJson(),
        "deleteLegacy": deleteLegacy == null ? null : deleteLegacy.toJson(),
        "get": teamsGet == null ? null : teamsGet.toJson(),
        "getByName": getByName == null ? null : getByName.toJson(),
        "getDiscussion": getDiscussion == null ? null : getDiscussion.toJson(),
        "getDiscussionComment": getDiscussionComment == null ? null : getDiscussionComment.toJson(),
        "getDiscussionCommentInOrg": getDiscussionCommentInOrg == null ? null : getDiscussionCommentInOrg.toJson(),
        "getDiscussionCommentLegacy": getDiscussionCommentLegacy == null ? null : getDiscussionCommentLegacy.toJson(),
        "getDiscussionInOrg": getDiscussionInOrg == null ? null : getDiscussionInOrg.toJson(),
        "getDiscussionLegacy": getDiscussionLegacy == null ? null : getDiscussionLegacy.toJson(),
        "getLegacy": getLegacy == null ? null : getLegacy.toJson(),
        "getMember": getMember == null ? null : getMember.toJson(),
        "getMemberLegacy": getMemberLegacy == null ? null : getMemberLegacy.toJson(),
        "getMembership": getMembership == null ? null : getMembership.toJson(),
        "getMembershipInOrg": getMembershipInOrg == null ? null : getMembershipInOrg.toJson(),
        "getMembershipLegacy": getMembershipLegacy == null ? null : getMembershipLegacy.toJson(),
        "list": list == null ? null : list.toJson(),
        "listChild": listChild == null ? null : listChild.toJson(),
        "listChildInOrg": listChildInOrg == null ? null : listChildInOrg.toJson(),
        "listChildLegacy": listChildLegacy == null ? null : listChildLegacy.toJson(),
        "listDiscussionComments": listDiscussionComments == null ? null : listDiscussionComments.toJson(),
        "listDiscussionCommentsInOrg": listDiscussionCommentsInOrg == null ? null : listDiscussionCommentsInOrg.toJson(),
        "listDiscussionCommentsLegacy": listDiscussionCommentsLegacy == null ? null : listDiscussionCommentsLegacy.toJson(),
        "listDiscussions": listDiscussions == null ? null : listDiscussions.toJson(),
        "listDiscussionsInOrg": listDiscussionsInOrg == null ? null : listDiscussionsInOrg.toJson(),
        "listDiscussionsLegacy": listDiscussionsLegacy == null ? null : listDiscussionsLegacy.toJson(),
        "listForAuthenticatedUser": listForAuthenticatedUser == null ? null : listForAuthenticatedUser.toJson(),
        "listMembers": listMembers == null ? null : listMembers.toJson(),
        "listMembersInOrg": listMembersInOrg == null ? null : listMembersInOrg.toJson(),
        "listMembersLegacy": listMembersLegacy == null ? null : listMembersLegacy.toJson(),
        "listPendingInvitations": listPendingInvitations == null ? null : listPendingInvitations.toJson(),
        "listPendingInvitationsInOrg": listPendingInvitationsInOrg == null ? null : listPendingInvitationsInOrg.toJson(),
        "listPendingInvitationsLegacy": listPendingInvitationsLegacy == null ? null : listPendingInvitationsLegacy.toJson(),
        "listProjects": listProjects == null ? null : listProjects.toJson(),
        "listProjectsInOrg": listProjectsInOrg == null ? null : listProjectsInOrg.toJson(),
        "listProjectsLegacy": listProjectsLegacy == null ? null : listProjectsLegacy.toJson(),
        "listRepos": listRepos == null ? null : listRepos.toJson(),
        "listReposInOrg": listReposInOrg == null ? null : listReposInOrg.toJson(),
        "listReposLegacy": listReposLegacy == null ? null : listReposLegacy.toJson(),
        "removeMember": removeMember == null ? null : removeMember.toJson(),
        "removeMemberLegacy": removeMemberLegacy == null ? null : removeMemberLegacy.toJson(),
        "removeMembership": removeMembership == null ? null : removeMembership.toJson(),
        "removeMembershipInOrg": removeMembershipInOrg == null ? null : removeMembershipInOrg.toJson(),
        "removeMembershipLegacy": removeMembershipLegacy == null ? null : removeMembershipLegacy.toJson(),
        "removeProject": removeProject == null ? null : removeProject.toJson(),
        "removeProjectInOrg": removeProjectInOrg == null ? null : removeProjectInOrg.toJson(),
        "removeProjectLegacy": removeProjectLegacy == null ? null : removeProjectLegacy.toJson(),
        "removeRepo": removeRepo == null ? null : removeRepo.toJson(),
        "removeRepoInOrg": removeRepoInOrg == null ? null : removeRepoInOrg.toJson(),
        "removeRepoLegacy": removeRepoLegacy == null ? null : removeRepoLegacy.toJson(),
        "reviewProject": reviewProject == null ? null : reviewProject.toJson(),
        "reviewProjectInOrg": reviewProjectInOrg == null ? null : reviewProjectInOrg.toJson(),
        "reviewProjectLegacy": reviewProjectLegacy == null ? null : reviewProjectLegacy.toJson(),
        "update": update == null ? null : update.toJson(),
        "updateDiscussion": updateDiscussion == null ? null : updateDiscussion.toJson(),
        "updateDiscussionComment": updateDiscussionComment == null ? null : updateDiscussionComment.toJson(),
        "updateDiscussionCommentInOrg": updateDiscussionCommentInOrg == null ? null : updateDiscussionCommentInOrg.toJson(),
        "updateDiscussionCommentLegacy": updateDiscussionCommentLegacy == null ? null : updateDiscussionCommentLegacy.toJson(),
        "updateDiscussionInOrg": updateDiscussionInOrg == null ? null : updateDiscussionInOrg.toJson(),
        "updateDiscussionLegacy": updateDiscussionLegacy == null ? null : updateDiscussionLegacy.toJson(),
        "updateInOrg": updateInOrg == null ? null : updateInOrg.toJson(),
        "updateLegacy": updateLegacy == null ? null : updateLegacy.toJson(),
    };
}

/**
 * The "Add team member" endpoint (described below) is deprecated.
 *
 * We recommend using the [Add team
 * membership](https://developer.github.com/v3/teams/members/#add-or-update-team-membership)
 * endpoint instead. It allows you to invite new organization members to your teams.
 *
 * Team synchronization is available for organizations using GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * To add someone to a team, the authenticated user must be an organization owner or a team
 * maintainer in the team they're changing. The person being added to the team must be a
 * member of the team's organization.
 *
 * **Note:** When you have team synchronization set up for a team with your organization's
 * identity provider (IdP), you will see an error if you attempt to use the API for making
 * changes to the team's membership. If you have access to manage group membership in your
 * IdP, you can manage GitHub team membership through your identity provider, which
 * automatically adds and removes team members in an organization. For more information, see
 * "[Synchronizing teams between your identity provider and
 * GitHub](https://help.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
 *
 * Note that you'll need to set `Content-Length` to zero when calling out to this endpoint.
 * For more information, see "[HTTP verbs](https://developer.github.com/v3/#http-verbs)."
 */
class AddMember {
    AddMember({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddMember.fromRawJson(String str) => AddMember.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddMember.fromJson(Map<String, dynamic> json) => AddMember(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The "Add team member" endpoint (described below) is deprecated.
 *
 * We recommend using the [Add team
 * membership](https://developer.github.com/v3/teams/members/#add-or-update-team-membership)
 * endpoint instead. It allows you to invite new organization members to your teams.
 *
 * Team synchronization is available for organizations using GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * To add someone to a team, the authenticated user must be an organization owner or a team
 * maintainer in the team they're changing. The person being added to the team must be a
 * member of the team's organization.
 *
 * **Note:** When you have team synchronization set up for a team with your organization's
 * identity provider (IdP), you will see an error if you attempt to use the API for making
 * changes to the team's membership. If you have access to manage group membership in your
 * IdP, you can manage GitHub team membership through your identity provider, which
 * automatically adds and removes team members in an organization. For more information, see
 * "[Synchronizing teams between your identity provider and
 * GitHub](https://help.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
 *
 * Note that you'll need to set `Content-Length` to zero when calling out to this endpoint.
 * For more information, see "[HTTP verbs](https://developer.github.com/v3/#http-verbs)."
 */
class AddMemberLegacy {
    AddMemberLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddMemberLegacy.fromRawJson(String str) => AddMemberLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddMemberLegacy.fromJson(Map<String, dynamic> json) => AddMemberLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Add or update team
 * membership`](https://developer.github.com/v3/teams/members/#add-or-update-team-membership)
 * endpoint.
 *
 * Team synchronization is available for organizations using GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * If the user is already a member of the team's organization, this endpoint will add the
 * user to the team. To add a membership between an organization member and a team, the
 * authenticated user must be an organization owner or a team maintainer.
 *
 * **Note:** When you have team synchronization set up for a team with your organization's
 * identity provider (IdP), you will see an error if you attempt to use the API for making
 * changes to the team's membership. If you have access to manage group membership in your
 * IdP, you can manage GitHub team membership through your identity provider, which
 * automatically adds and removes team members in an organization. For more information, see
 * "[Synchronizing teams between your identity provider and
 * GitHub](https://help.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
 *
 * If the user is unaffiliated with the team's organization, this endpoint will send an
 * invitation to the user via email. This newly-created membership will be in the "pending"
 * state until the user accepts the invitation, at which point the membership will
 * transition to the "active" state and the user will be added as a member of the team. To
 * add a membership between an unaffiliated user and a team, the authenticated user must be
 * an organization owner.
 *
 * If the user is already a member of the team, this endpoint will update the role of the
 * team member's role. To update the membership of a team member, the authenticated user
 * must be an organization owner or a team maintainer.
 */
class TeamsAddOrUpdateMembership {
    TeamsAddOrUpdateMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsAddOrUpdateMembership.fromRawJson(String str) => TeamsAddOrUpdateMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsAddOrUpdateMembership.fromJson(Map<String, dynamic> json) => TeamsAddOrUpdateMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Team synchronization is available for organizations using GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * Adds an organization member to a team. An authenticated organization owner or team
 * maintainer can add organization members to a team.
 *
 * **Note:** When you have team synchronization set up for a team with your organization's
 * identity provider (IdP), you will see an error if you attempt to use the API for making
 * changes to the team's membership. If you have access to manage group membership in your
 * IdP, you can manage GitHub team membership through your identity provider, which
 * automatically adds and removes team members in an organization. For more information, see
 * "[Synchronizing teams between your identity provider and
 * GitHub](https://help.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
 *
 * An organization owner can add someone who is not part of the team's organization to a
 * team. When an organization owner adds someone to a team who is not an organization
 * member, this endpoint will send an invitation to the person via email. This newly-created
 * membership will be in the "pending" state until the person accepts the invitation, at
 * which point the membership will transition to the "active" state and the user will be
 * added as a member of the team.
 *
 * If the user is already a member of the team, this endpoint will update the role of the
 * team member's role. To update the membership of a team member, the authenticated user
 * must be an organization owner or a team maintainer.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `PUT
 * /organizations/:org_id/team/:team_id/memberships/:username`.
 */
class AddOrUpdateMembershipInOrg {
    AddOrUpdateMembershipInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddOrUpdateMembershipInOrg.fromRawJson(String str) => AddOrUpdateMembershipInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddOrUpdateMembershipInOrg.fromJson(Map<String, dynamic> json) => AddOrUpdateMembershipInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Add or update team
 * membership`](https://developer.github.com/v3/teams/members/#add-or-update-team-membership)
 * endpoint.
 *
 * Team synchronization is available for organizations using GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * If the user is already a member of the team's organization, this endpoint will add the
 * user to the team. To add a membership between an organization member and a team, the
 * authenticated user must be an organization owner or a team maintainer.
 *
 * **Note:** When you have team synchronization set up for a team with your organization's
 * identity provider (IdP), you will see an error if you attempt to use the API for making
 * changes to the team's membership. If you have access to manage group membership in your
 * IdP, you can manage GitHub team membership through your identity provider, which
 * automatically adds and removes team members in an organization. For more information, see
 * "[Synchronizing teams between your identity provider and
 * GitHub](https://help.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
 *
 * If the user is unaffiliated with the team's organization, this endpoint will send an
 * invitation to the user via email. This newly-created membership will be in the "pending"
 * state until the user accepts the invitation, at which point the membership will
 * transition to the "active" state and the user will be added as a member of the team. To
 * add a membership between an unaffiliated user and a team, the authenticated user must be
 * an organization owner.
 *
 * If the user is already a member of the team, this endpoint will update the role of the
 * team member's role. To update the membership of a team member, the authenticated user
 * must be an organization owner or a team maintainer.
 */
class AddOrUpdateMembershipLegacy {
    AddOrUpdateMembershipLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddOrUpdateMembershipLegacy.fromRawJson(String str) => AddOrUpdateMembershipLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddOrUpdateMembershipLegacy.fromJson(Map<String, dynamic> json) => AddOrUpdateMembershipLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Add or update team
 * project`](https://developer.github.com/v3/teams/#add-or-update-team-project) endpoint.
 *
 * Adds an organization project to a team. To add a project to a team or update the team's
 * permission on a project, the authenticated user must have `admin` permissions for the
 * project. The project and team must be part of the same organization.
 */
class AddOrUpdateProject {
    AddOrUpdateProject({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddOrUpdateProject.fromRawJson(String str) => AddOrUpdateProject.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddOrUpdateProject.fromJson(Map<String, dynamic> json) => AddOrUpdateProject(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Adds an organization project to a team. To add a project to a team or update the team's
 * permission on a project, the authenticated user must have `admin` permissions for the
 * project. The project and team must be part of the same organization.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `PUT
 * /organizations/:org_id/team/:team_id/projects/:project_id`.
 */
class AddOrUpdateProjectInOrg {
    AddOrUpdateProjectInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddOrUpdateProjectInOrg.fromRawJson(String str) => AddOrUpdateProjectInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddOrUpdateProjectInOrg.fromJson(Map<String, dynamic> json) => AddOrUpdateProjectInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Add or update team
 * project`](https://developer.github.com/v3/teams/#add-or-update-team-project) endpoint.
 *
 * Adds an organization project to a team. To add a project to a team or update the team's
 * permission on a project, the authenticated user must have `admin` permissions for the
 * project. The project and team must be part of the same organization.
 */
class AddOrUpdateProjectLegacy {
    AddOrUpdateProjectLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddOrUpdateProjectLegacy.fromRawJson(String str) => AddOrUpdateProjectLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddOrUpdateProjectLegacy.fromJson(Map<String, dynamic> json) => AddOrUpdateProjectLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Add or update team
 * repository`](https://developer.github.com/v3/teams/#add-or-update-team-repository)
 * endpoint.
 *
 * To add a repository to a team or update the team's permission on a repository, the
 * authenticated user must have admin access to the repository, and must be able to see the
 * team. The repository must be owned by the organization, or a direct fork of a repository
 * owned by the organization. You will get a `422 Unprocessable Entity` status if you
 * attempt to add a repository to a team that is not owned by the organization.
 *
 * Note that, if you choose not to pass any parameters, you'll need to set `Content-Length`
 * to zero when calling out to this endpoint. For more information, see "[HTTP
 * verbs](https://developer.github.com/v3/#http-verbs)."
 */
class AddOrUpdateRepo {
    AddOrUpdateRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddOrUpdateRepo.fromRawJson(String str) => AddOrUpdateRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddOrUpdateRepo.fromJson(Map<String, dynamic> json) => AddOrUpdateRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * To add a repository to a team or update the team's permission on a repository, the
 * authenticated user must have admin access to the repository, and must be able to see the
 * team. The repository must be owned by the organization, or a direct fork of a repository
 * owned by the organization. You will get a `422 Unprocessable Entity` status if you
 * attempt to add a repository to a team that is not owned by the organization. Note that,
 * if you choose not to pass any parameters, you'll need to set `Content-Length` to zero
 * when calling out to this endpoint. For more information, see "[HTTP
 * verbs](https://developer.github.com/v3/#http-verbs)."
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `PUT
 * /organizations/:org_id/team/:team_id/repos/:owner/:repo`.
 */
class AddOrUpdateRepoInOrg {
    AddOrUpdateRepoInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddOrUpdateRepoInOrg.fromRawJson(String str) => AddOrUpdateRepoInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddOrUpdateRepoInOrg.fromJson(Map<String, dynamic> json) => AddOrUpdateRepoInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Add or update team
 * repository`](https://developer.github.com/v3/teams/#add-or-update-team-repository)
 * endpoint.
 *
 * To add a repository to a team or update the team's permission on a repository, the
 * authenticated user must have admin access to the repository, and must be able to see the
 * team. The repository must be owned by the organization, or a direct fork of a repository
 * owned by the organization. You will get a `422 Unprocessable Entity` status if you
 * attempt to add a repository to a team that is not owned by the organization.
 *
 * Note that, if you choose not to pass any parameters, you'll need to set `Content-Length`
 * to zero when calling out to this endpoint. For more information, see "[HTTP
 * verbs](https://developer.github.com/v3/#http-verbs)."
 */
class AddOrUpdateRepoLegacy {
    AddOrUpdateRepoLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddOrUpdateRepoLegacy.fromRawJson(String str) => AddOrUpdateRepoLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddOrUpdateRepoLegacy.fromJson(Map<String, dynamic> json) => AddOrUpdateRepoLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note**: Repositories inherited through a parent team will also be checked.
 *
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Check if a team
 * manages a
 * repository`](https://developer.github.com/v3/teams/#check-if-a-team-manages-a-repository)
 * endpoint.
 *
 * You can also get information about the specified repository, including what permissions
 * the team grants on it, by passing the following custom [media
 * type](https://developer.github.com/v3/media/) via the `Accept` header:
 */
class CheckManagesRepo {
    CheckManagesRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckManagesRepo.fromRawJson(String str) => CheckManagesRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckManagesRepo.fromJson(Map<String, dynamic> json) => CheckManagesRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Checks whether a team has `admin`, `push`, or `pull` permission for a repository.
 * Repositories inherited through a parent team will also be checked.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/repos/:owner/:repo`.
 *
 * You can also get information about the specified repository, including what permissions
 * the team grants on it, by passing the following custom [media
 * type](https://developer.github.com/v3/media/) via the `Accept` header:
 */
class CheckManagesRepoInOrg {
    CheckManagesRepoInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckManagesRepoInOrg.fromRawJson(String str) => CheckManagesRepoInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckManagesRepoInOrg.fromJson(Map<String, dynamic> json) => CheckManagesRepoInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note**: Repositories inherited through a parent team will also be checked.
 *
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Check if a team
 * manages a
 * repository`](https://developer.github.com/v3/teams/#check-if-a-team-manages-a-repository)
 * endpoint.
 *
 * You can also get information about the specified repository, including what permissions
 * the team grants on it, by passing the following custom [media
 * type](https://developer.github.com/v3/media/) via the `Accept` header:
 */
class CheckManagesRepoLegacy {
    CheckManagesRepoLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckManagesRepoLegacy.fromRawJson(String str) => CheckManagesRepoLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckManagesRepoLegacy.fromJson(Map<String, dynamic> json) => CheckManagesRepoLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * To create a team, the authenticated user must be a member or owner of `:org`. By default,
 * organization members can create teams. Organization owners can limit team creation to
 * organization owners. For more information, see "[Setting team creation
 * permissions](https://help.github.com/en/articles/setting-team-creation-permissions-in-your-organization)."
 *
 * When you create a new team, you automatically become a team maintainer without explicitly
 * adding yourself to the optional array of `maintainers`. For more information, see "[About
 * teams](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/about-teams)"
 * in the GitHub Help documentation.
 */
class TeamsCreate {
    TeamsCreate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsCreate.fromRawJson(String str) => TeamsCreate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsCreate.fromJson(Map<String, dynamic> json) => TeamsCreate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Create a
 * discussion`](https://developer.github.com/v3/teams/discussions/#create-a-discussion)
 * endpoint.
 *
 * Creates a new discussion post on a team's page. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class CreateDiscussion {
    CreateDiscussion({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateDiscussion.fromRawJson(String str) => CreateDiscussion.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateDiscussion.fromJson(Map<String, dynamic> json) => CreateDiscussion(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Create a
 * comment`](https://developer.github.com/v3/teams/discussion_comments/#create-a-comment)
 * endpoint.
 *
 * Creates a new comment on a team discussion. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class CreateDiscussionComment {
    CreateDiscussionComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateDiscussionComment.fromRawJson(String str) => CreateDiscussionComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateDiscussionComment.fromJson(Map<String, dynamic> json) => CreateDiscussionComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a new comment on a team discussion. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `POST
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments`.
 */
class CreateDiscussionCommentInOrg {
    CreateDiscussionCommentInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateDiscussionCommentInOrg.fromRawJson(String str) => CreateDiscussionCommentInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateDiscussionCommentInOrg.fromJson(Map<String, dynamic> json) => CreateDiscussionCommentInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Create a
 * comment`](https://developer.github.com/v3/teams/discussion_comments/#create-a-comment)
 * endpoint.
 *
 * Creates a new comment on a team discussion. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class CreateDiscussionCommentLegacy {
    CreateDiscussionCommentLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateDiscussionCommentLegacy.fromRawJson(String str) => CreateDiscussionCommentLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateDiscussionCommentLegacy.fromJson(Map<String, dynamic> json) => CreateDiscussionCommentLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Creates a new discussion post on a team's page. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `POST
 * /organizations/:org_id/team/:team_id/discussions`.
 */
class CreateDiscussionInOrg {
    CreateDiscussionInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateDiscussionInOrg.fromRawJson(String str) => CreateDiscussionInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateDiscussionInOrg.fromJson(Map<String, dynamic> json) => CreateDiscussionInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Create a
 * discussion`](https://developer.github.com/v3/teams/discussions/#create-a-discussion)
 * endpoint.
 *
 * Creates a new discussion post on a team's page. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * This endpoint triggers
 * [notifications](https://help.github.com/articles/about-notifications/). Creating content
 * too quickly using this endpoint may result in abuse rate limiting. See "[Abuse rate
 * limits](https://developer.github.com/v3/#abuse-rate-limits)" and "[Dealing with abuse
 * rate
 * limits](https://developer.github.com/v3/guides/best-practices-for-integrators/#dealing-with-abuse-rate-limits)"
 * for details.
 */
class CreateDiscussionLegacy {
    CreateDiscussionLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateDiscussionLegacy.fromRawJson(String str) => CreateDiscussionLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateDiscussionLegacy.fromJson(Map<String, dynamic> json) => CreateDiscussionLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Delete
 * team`](https://developer.github.com/v3/teams/#delete-team) endpoint.
 *
 * To delete a team, the authenticated user must be an organization owner or team
 * maintainer.
 *
 * If you are an organization owner, deleting a parent team will delete all of its child
 * teams as well.
 */
class TeamsDelete {
    TeamsDelete({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsDelete.fromRawJson(String str) => TeamsDelete.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsDelete.fromJson(Map<String, dynamic> json) => TeamsDelete(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Delete a
 * discussion`](https://developer.github.com/v3/teams/discussions/#delete-a-discussion)
 * endpoint.
 *
 * Delete a discussion from a team's page. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class DeleteDiscussion {
    DeleteDiscussion({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteDiscussion.fromRawJson(String str) => DeleteDiscussion.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteDiscussion.fromJson(Map<String, dynamic> json) => DeleteDiscussion(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Delete a
 * comment`](https://developer.github.com/v3/teams/discussion_comments/#delete-a-comment)
 * endpoint.
 *
 * Deletes a comment on a team discussion. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class DeleteDiscussionComment {
    DeleteDiscussionComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteDiscussionComment.fromRawJson(String str) => DeleteDiscussionComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteDiscussionComment.fromJson(Map<String, dynamic> json) => DeleteDiscussionComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Deletes a comment on a team discussion. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number`.
 */
class DeleteDiscussionCommentInOrg {
    DeleteDiscussionCommentInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteDiscussionCommentInOrg.fromRawJson(String str) => DeleteDiscussionCommentInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteDiscussionCommentInOrg.fromJson(Map<String, dynamic> json) => DeleteDiscussionCommentInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Delete a
 * comment`](https://developer.github.com/v3/teams/discussion_comments/#delete-a-comment)
 * endpoint.
 *
 * Deletes a comment on a team discussion. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class DeleteDiscussionCommentLegacy {
    DeleteDiscussionCommentLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteDiscussionCommentLegacy.fromRawJson(String str) => DeleteDiscussionCommentLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteDiscussionCommentLegacy.fromJson(Map<String, dynamic> json) => DeleteDiscussionCommentLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Delete a discussion from a team's page. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number`.
 */
class DeleteDiscussionInOrg {
    DeleteDiscussionInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteDiscussionInOrg.fromRawJson(String str) => DeleteDiscussionInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteDiscussionInOrg.fromJson(Map<String, dynamic> json) => DeleteDiscussionInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Delete a
 * discussion`](https://developer.github.com/v3/teams/discussions/#delete-a-discussion)
 * endpoint.
 *
 * Delete a discussion from a team's page. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class DeleteDiscussionLegacy {
    DeleteDiscussionLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteDiscussionLegacy.fromRawJson(String str) => DeleteDiscussionLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteDiscussionLegacy.fromJson(Map<String, dynamic> json) => DeleteDiscussionLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * To delete a team, the authenticated user must be an organization owner or team
 * maintainer.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE
 * /organizations/:org_id/team/:team_id`.
 *
 * If you are an organization owner, deleting a parent team will delete all of its child
 * teams as well.
 */
class DeleteInOrg {
    DeleteInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteInOrg.fromRawJson(String str) => DeleteInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteInOrg.fromJson(Map<String, dynamic> json) => DeleteInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Delete
 * team`](https://developer.github.com/v3/teams/#delete-team) endpoint.
 *
 * To delete a team, the authenticated user must be an organization owner or team
 * maintainer.
 *
 * If you are an organization owner, deleting a parent team will delete all of its child
 * teams as well.
 */
class DeleteLegacy {
    DeleteLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteLegacy.fromRawJson(String str) => DeleteLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteLegacy.fromJson(Map<String, dynamic> json) => DeleteLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Gets a team using the team's `slug`. GitHub generates the `slug` from the team `name`.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id`.
 */
class GetByName {
    GetByName({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetByName.fromRawJson(String str) => GetByName.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetByName.fromJson(Map<String, dynamic> json) => GetByName(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Get a single
 * discussion`](https://developer.github.com/v3/teams/discussions/#get-a-single-discussion)
 * endpoint.
 *
 * Get a specific discussion on a team's page. OAuth access tokens require the
 * `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class GetDiscussion {
    GetDiscussion({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetDiscussion.fromRawJson(String str) => GetDiscussion.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDiscussion.fromJson(Map<String, dynamic> json) => GetDiscussion(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Get a single
 * comment`](https://developer.github.com/v3/teams/discussion_comments/#get-a-single-comment)
 * endpoint.
 *
 * Get a specific comment on a team discussion. OAuth access tokens require the
 * `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class GetDiscussionComment {
    GetDiscussionComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetDiscussionComment.fromRawJson(String str) => GetDiscussionComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDiscussionComment.fromJson(Map<String, dynamic> json) => GetDiscussionComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Get a specific comment on a team discussion. OAuth access tokens require the
 * `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number`.
 */
class GetDiscussionCommentInOrg {
    GetDiscussionCommentInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetDiscussionCommentInOrg.fromRawJson(String str) => GetDiscussionCommentInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDiscussionCommentInOrg.fromJson(Map<String, dynamic> json) => GetDiscussionCommentInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Get a single
 * comment`](https://developer.github.com/v3/teams/discussion_comments/#get-a-single-comment)
 * endpoint.
 *
 * Get a specific comment on a team discussion. OAuth access tokens require the
 * `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class GetDiscussionCommentLegacy {
    GetDiscussionCommentLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetDiscussionCommentLegacy.fromRawJson(String str) => GetDiscussionCommentLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDiscussionCommentLegacy.fromJson(Map<String, dynamic> json) => GetDiscussionCommentLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Get a specific discussion on a team's page. OAuth access tokens require the
 * `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number`.
 */
class GetDiscussionInOrg {
    GetDiscussionInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetDiscussionInOrg.fromRawJson(String str) => GetDiscussionInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDiscussionInOrg.fromJson(Map<String, dynamic> json) => GetDiscussionInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Get a single
 * discussion`](https://developer.github.com/v3/teams/discussions/#get-a-single-discussion)
 * endpoint.
 *
 * Get a specific discussion on a team's page. OAuth access tokens require the
 * `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class GetDiscussionLegacy {
    GetDiscussionLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetDiscussionLegacy.fromRawJson(String str) => GetDiscussionLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDiscussionLegacy.fromJson(Map<String, dynamic> json) => GetDiscussionLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the [`Get team by
 * name`](https://developer.github.com/v3/teams/#get-team-by-name) endpoint.
 */
class GetLegacy {
    GetLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetLegacy.fromRawJson(String str) => GetLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetLegacy.fromJson(Map<String, dynamic> json) => GetLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The "Get team member" endpoint (described below) is deprecated.
 *
 * We recommend using the [Get team
 * membership](https://developer.github.com/v3/teams/members/#get-team-membership) endpoint
 * instead. It allows you to get both active and pending memberships.
 *
 * To list members in a team, the team must be visible to the authenticated user.
 */
class GetMember {
    GetMember({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetMember.fromRawJson(String str) => GetMember.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetMember.fromJson(Map<String, dynamic> json) => GetMember(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The "Get team member" endpoint (described below) is deprecated.
 *
 * We recommend using the [Get team
 * membership](https://developer.github.com/v3/teams/members/#get-team-membership) endpoint
 * instead. It allows you to get both active and pending memberships.
 *
 * To list members in a team, the team must be visible to the authenticated user.
 */
class GetMemberLegacy {
    GetMemberLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetMemberLegacy.fromRawJson(String str) => GetMemberLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetMemberLegacy.fromJson(Map<String, dynamic> json) => GetMemberLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Get team
 * membership`](https://developer.github.com/v3/teams/members/#get-team-membership)
 * endpoint.
 *
 * Team members will include the members of child teams.
 *
 * To get a user's membership with a team, the team must be visible to the authenticated
 * user.
 *
 * **Note:** The `role` for organization owners returns as `maintainer`. For more
 * information about `maintainer` roles, see [Create
 * team](https://developer.github.com/v3/teams#create-team).
 */
class TeamsGetMembership {
    TeamsGetMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsGetMembership.fromRawJson(String str) => TeamsGetMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsGetMembership.fromJson(Map<String, dynamic> json) => TeamsGetMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Team members will include the members of child teams.
 *
 * To get a user's membership with a team, the team must be visible to the authenticated
 * user.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/memberships/:username`.
 *
 * **Note:** The `role` for organization owners returns as `maintainer`. For more
 * information about `maintainer` roles, see [Create
 * team](https://developer.github.com/v3/teams#create-team).
 */
class GetMembershipInOrg {
    GetMembershipInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetMembershipInOrg.fromRawJson(String str) => GetMembershipInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetMembershipInOrg.fromJson(Map<String, dynamic> json) => GetMembershipInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Get team
 * membership`](https://developer.github.com/v3/teams/members/#get-team-membership)
 * endpoint.
 *
 * Team members will include the members of child teams.
 *
 * To get a user's membership with a team, the team must be visible to the authenticated
 * user.
 *
 * **Note:** The `role` for organization owners returns as `maintainer`. For more
 * information about `maintainer` roles, see [Create
 * team](https://developer.github.com/v3/teams#create-team).
 */
class GetMembershipLegacy {
    GetMembershipLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetMembershipLegacy.fromRawJson(String str) => GetMembershipLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetMembershipLegacy.fromJson(Map<String, dynamic> json) => GetMembershipLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all teams in an organization that are visible to the authenticated user.
 */
class TeamsList {
    TeamsList({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsList.fromRawJson(String str) => TeamsList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsList.fromJson(Map<String, dynamic> json) => TeamsList(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List child
 * teams`](https://developer.github.com/v3/teams/#list-child-teams) endpoint.
 */
class ListChild {
    ListChild({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListChild.fromRawJson(String str) => ListChild.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListChild.fromJson(Map<String, dynamic> json) => ListChild(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the child teams of the team requested by `:team_slug`.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/teams`.
 */
class ListChildInOrg {
    ListChildInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListChildInOrg.fromRawJson(String str) => ListChildInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListChildInOrg.fromJson(Map<String, dynamic> json) => ListChildInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List child
 * teams`](https://developer.github.com/v3/teams/#list-child-teams) endpoint.
 */
class ListChildLegacy {
    ListChildLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListChildLegacy.fromRawJson(String str) => ListChildLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListChildLegacy.fromJson(Map<String, dynamic> json) => ListChildLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List
 * comments`](https://developer.github.com/v3/teams/discussion_comments/#list-comments)
 * endpoint.
 *
 * List all comments on a team discussion. OAuth access tokens require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class ListDiscussionComments {
    ListDiscussionComments({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDiscussionComments.fromRawJson(String str) => ListDiscussionComments.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDiscussionComments.fromJson(Map<String, dynamic> json) => ListDiscussionComments(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all comments on a team discussion. OAuth access tokens require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments`.
 */
class ListDiscussionCommentsInOrg {
    ListDiscussionCommentsInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDiscussionCommentsInOrg.fromRawJson(String str) => ListDiscussionCommentsInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDiscussionCommentsInOrg.fromJson(Map<String, dynamic> json) => ListDiscussionCommentsInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List
 * comments`](https://developer.github.com/v3/teams/discussion_comments/#list-comments)
 * endpoint.
 *
 * List all comments on a team discussion. OAuth access tokens require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class ListDiscussionCommentsLegacy {
    ListDiscussionCommentsLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDiscussionCommentsLegacy.fromRawJson(String str) => ListDiscussionCommentsLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDiscussionCommentsLegacy.fromJson(Map<String, dynamic> json) => ListDiscussionCommentsLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List
 * discussions`](https://developer.github.com/v3/teams/discussions/#list-discussions)
 * endpoint.
 *
 * List all discussions on a team's page. OAuth access tokens require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class ListDiscussions {
    ListDiscussions({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDiscussions.fromRawJson(String str) => ListDiscussions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDiscussions.fromJson(Map<String, dynamic> json) => ListDiscussions(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all discussions on a team's page. OAuth access tokens require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/discussions`.
 */
class ListDiscussionsInOrg {
    ListDiscussionsInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDiscussionsInOrg.fromRawJson(String str) => ListDiscussionsInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDiscussionsInOrg.fromJson(Map<String, dynamic> json) => ListDiscussionsInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List
 * discussions`](https://developer.github.com/v3/teams/discussions/#list-discussions)
 * endpoint.
 *
 * List all discussions on a team's page. OAuth access tokens require the `read:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class ListDiscussionsLegacy {
    ListDiscussionsLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListDiscussionsLegacy.fromRawJson(String str) => ListDiscussionsLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListDiscussionsLegacy.fromJson(Map<String, dynamic> json) => ListDiscussionsLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List all of the teams across all of the organizations to which the authenticated user
 * belongs. This method requires `user`, `repo`, or `read:org`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/)
 * when authenticating via [OAuth](https://developer.github.com/apps/building-oauth-apps/).
 */
class TeamsListForAuthenticatedUser {
    TeamsListForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsListForAuthenticatedUser.fromRawJson(String str) => TeamsListForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsListForAuthenticatedUser.fromJson(Map<String, dynamic> json) => TeamsListForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List team
 * members`](https://developer.github.com/v3/teams/members/#list-team-members) endpoint.
 *
 * Team members will include the members of child teams.
 */
class TeamsListMembers {
    TeamsListMembers({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsListMembers.fromRawJson(String str) => TeamsListMembers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsListMembers.fromJson(Map<String, dynamic> json) => TeamsListMembers(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Team members will include the members of child teams.
 *
 * To list members in a team, the team must be visible to the authenticated user.
 */
class ListMembersInOrg {
    ListMembersInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListMembersInOrg.fromRawJson(String str) => ListMembersInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListMembersInOrg.fromJson(Map<String, dynamic> json) => ListMembersInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List team
 * members`](https://developer.github.com/v3/teams/members/#list-team-members) endpoint.
 *
 * Team members will include the members of child teams.
 */
class ListMembersLegacy {
    ListMembersLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListMembersLegacy.fromRawJson(String str) => ListMembersLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListMembersLegacy.fromJson(Map<String, dynamic> json) => ListMembersLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List pending team
 * invitations`](https://developer.github.com/v3/teams/members/#list-pending-team-invitations)
 * endpoint.
 *
 * The return hash contains a `role` field which refers to the Organization Invitation role
 * and will be one of the following values: `direct_member`, `admin`, `billing_manager`,
 * `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login`
 * field in the return hash will be `null`.
 */
class TeamsListPendingInvitations {
    TeamsListPendingInvitations({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsListPendingInvitations.fromRawJson(String str) => TeamsListPendingInvitations.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsListPendingInvitations.fromJson(Map<String, dynamic> json) => TeamsListPendingInvitations(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The return hash contains a `role` field which refers to the Organization Invitation role
 * and will be one of the following values: `direct_member`, `admin`, `billing_manager`,
 * `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login`
 * field in the return hash will be `null`.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/invitations`.
 */
class ListPendingInvitationsInOrg {
    ListPendingInvitationsInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPendingInvitationsInOrg.fromRawJson(String str) => ListPendingInvitationsInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPendingInvitationsInOrg.fromJson(Map<String, dynamic> json) => ListPendingInvitationsInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List pending team
 * invitations`](https://developer.github.com/v3/teams/members/#list-pending-team-invitations)
 * endpoint.
 *
 * The return hash contains a `role` field which refers to the Organization Invitation role
 * and will be one of the following values: `direct_member`, `admin`, `billing_manager`,
 * `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login`
 * field in the return hash will be `null`.
 */
class ListPendingInvitationsLegacy {
    ListPendingInvitationsLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPendingInvitationsLegacy.fromRawJson(String str) => ListPendingInvitationsLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPendingInvitationsLegacy.fromJson(Map<String, dynamic> json) => ListPendingInvitationsLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List team
 * projects`](https://developer.github.com/v3/teams/#list-team-projects) endpoint.
 *
 * Lists the organization projects for a team.
 */
class ListProjects {
    ListProjects({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListProjects.fromRawJson(String str) => ListProjects.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListProjects.fromJson(Map<String, dynamic> json) => ListProjects(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the organization projects for a team.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/projects`.
 */
class ListProjectsInOrg {
    ListProjectsInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListProjectsInOrg.fromRawJson(String str) => ListProjectsInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListProjectsInOrg.fromJson(Map<String, dynamic> json) => ListProjectsInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List team
 * projects`](https://developer.github.com/v3/teams/#list-team-projects) endpoint.
 *
 * Lists the organization projects for a team.
 */
class ListProjectsLegacy {
    ListProjectsLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListProjectsLegacy.fromRawJson(String str) => ListProjectsLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListProjectsLegacy.fromJson(Map<String, dynamic> json) => ListProjectsLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List team
 * repos`](https://developer.github.com/v3/teams/#list-team-repos) endpoint.
 */
class TeamsListRepos {
    TeamsListRepos({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsListRepos.fromRawJson(String str) => TeamsListRepos.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsListRepos.fromJson(Map<String, dynamic> json) => TeamsListRepos(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists a team's repositories visible to the authenticated user.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/repos`.
 */
class ListReposInOrg {
    ListReposInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReposInOrg.fromRawJson(String str) => ListReposInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReposInOrg.fromJson(Map<String, dynamic> json) => ListReposInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`List team
 * repos`](https://developer.github.com/v3/teams/#list-team-repos) endpoint.
 */
class ListReposLegacy {
    ListReposLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListReposLegacy.fromRawJson(String str) => ListReposLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListReposLegacy.fromJson(Map<String, dynamic> json) => ListReposLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The "Remove team member" endpoint (described below) is deprecated.
 *
 * We recommend using the [Remove team
 * membership](https://developer.github.com/v3/teams/members/#remove-team-membership)
 * endpoint instead. It allows you to remove both active and pending memberships.
 *
 * Team synchronization is available for organizations using GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * To remove a team member, the authenticated user must have 'admin' permissions to the team
 * or be an owner of the org that the team is associated with. Removing a team member does
 * not delete the user, it just removes them from the team.
 *
 * **Note:** When you have team synchronization set up for a team with your organization's
 * identity provider (IdP), you will see an error if you attempt to use the API for making
 * changes to the team's membership. If you have access to manage group membership in your
 * IdP, you can manage GitHub team membership through your identity provider, which
 * automatically adds and removes team members in an organization. For more information, see
 * "[Synchronizing teams between your identity provider and
 * GitHub](https://help.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
 */
class TeamsRemoveMember {
    TeamsRemoveMember({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsRemoveMember.fromRawJson(String str) => TeamsRemoveMember.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsRemoveMember.fromJson(Map<String, dynamic> json) => TeamsRemoveMember(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * The "Remove team member" endpoint (described below) is deprecated.
 *
 * We recommend using the [Remove team
 * membership](https://developer.github.com/v3/teams/members/#remove-team-membership)
 * endpoint instead. It allows you to remove both active and pending memberships.
 *
 * Team synchronization is available for organizations using GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * To remove a team member, the authenticated user must have 'admin' permissions to the team
 * or be an owner of the org that the team is associated with. Removing a team member does
 * not delete the user, it just removes them from the team.
 *
 * **Note:** When you have team synchronization set up for a team with your organization's
 * identity provider (IdP), you will see an error if you attempt to use the API for making
 * changes to the team's membership. If you have access to manage group membership in your
 * IdP, you can manage GitHub team membership through your identity provider, which
 * automatically adds and removes team members in an organization. For more information, see
 * "[Synchronizing teams between your identity provider and
 * GitHub](https://help.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
 */
class RemoveMemberLegacy {
    RemoveMemberLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveMemberLegacy.fromRawJson(String str) => RemoveMemberLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveMemberLegacy.fromJson(Map<String, dynamic> json) => RemoveMemberLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Remove team
 * membership`](https://developer.github.com/v3/teams/members/#remove-team-membership)
 * endpoint.
 *
 * Team synchronization is available for organizations using GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * To remove a membership between a user and a team, the authenticated user must have
 * 'admin' permissions to the team or be an owner of the organization that the team is
 * associated with. Removing team membership does not delete the user, it just removes their
 * membership from the team.
 *
 * **Note:** When you have team synchronization set up for a team with your organization's
 * identity provider (IdP), you will see an error if you attempt to use the API for making
 * changes to the team's membership. If you have access to manage group membership in your
 * IdP, you can manage GitHub team membership through your identity provider, which
 * automatically adds and removes team members in an organization. For more information, see
 * "[Synchronizing teams between your identity provider and
 * GitHub](https://help.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
 */
class TeamsRemoveMembership {
    TeamsRemoveMembership({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsRemoveMembership.fromRawJson(String str) => TeamsRemoveMembership.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsRemoveMembership.fromJson(Map<String, dynamic> json) => TeamsRemoveMembership(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Team synchronization is available for organizations using GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * To remove a membership between a user and a team, the authenticated user must have
 * 'admin' permissions to the team or be an owner of the organization that the team is
 * associated with. Removing team membership does not delete the user, it just removes their
 * membership from the team.
 *
 * **Note:** When you have team synchronization set up for a team with your organization's
 * identity provider (IdP), you will see an error if you attempt to use the API for making
 * changes to the team's membership. If you have access to manage group membership in your
 * IdP, you can manage GitHub team membership through your identity provider, which
 * automatically adds and removes team members in an organization. For more information, see
 * "[Synchronizing teams between your identity provider and
 * GitHub](https://help.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE
 * /organizations/:org_id/team/:team_id/memberships/:username`.
 */
class RemoveMembershipInOrg {
    RemoveMembershipInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveMembershipInOrg.fromRawJson(String str) => RemoveMembershipInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveMembershipInOrg.fromJson(Map<String, dynamic> json) => RemoveMembershipInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Remove team
 * membership`](https://developer.github.com/v3/teams/members/#remove-team-membership)
 * endpoint.
 *
 * Team synchronization is available for organizations using GitHub Enterprise Cloud. For
 * more information, see [GitHub's
 * products](https://help.github.com/github/getting-started-with-github/githubs-products) in
 * the GitHub Help documentation.
 *
 * To remove a membership between a user and a team, the authenticated user must have
 * 'admin' permissions to the team or be an owner of the organization that the team is
 * associated with. Removing team membership does not delete the user, it just removes their
 * membership from the team.
 *
 * **Note:** When you have team synchronization set up for a team with your organization's
 * identity provider (IdP), you will see an error if you attempt to use the API for making
 * changes to the team's membership. If you have access to manage group membership in your
 * IdP, you can manage GitHub team membership through your identity provider, which
 * automatically adds and removes team members in an organization. For more information, see
 * "[Synchronizing teams between your identity provider and
 * GitHub](https://help.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
 */
class RemoveMembershipLegacy {
    RemoveMembershipLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveMembershipLegacy.fromRawJson(String str) => RemoveMembershipLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveMembershipLegacy.fromJson(Map<String, dynamic> json) => RemoveMembershipLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Remove team
 * project`](https://developer.github.com/v3/teams/#remove-team-project) endpoint.
 *
 * Removes an organization project from a team. An organization owner or a team maintainer
 * can remove any project from the team. To remove a project from a team as an organization
 * member, the authenticated user must have `read` access to both the team and project, or
 * `admin` access to the team or project. **Note:** This endpoint removes the project from
 * the team, but does not delete it.
 */
class RemoveProject {
    RemoveProject({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProject.fromRawJson(String str) => RemoveProject.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProject.fromJson(Map<String, dynamic> json) => RemoveProject(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Removes an organization project from a team. An organization owner or a team maintainer
 * can remove any project from the team. To remove a project from a team as an organization
 * member, the authenticated user must have `read` access to both the team and project, or
 * `admin` access to the team or project. This endpoint removes the project from the team,
 * but does not delete the project.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE
 * /organizations/:org_id/team/:team_id/projects/:project_id`.
 */
class RemoveProjectInOrg {
    RemoveProjectInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProjectInOrg.fromRawJson(String str) => RemoveProjectInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProjectInOrg.fromJson(Map<String, dynamic> json) => RemoveProjectInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Remove team
 * project`](https://developer.github.com/v3/teams/#remove-team-project) endpoint.
 *
 * Removes an organization project from a team. An organization owner or a team maintainer
 * can remove any project from the team. To remove a project from a team as an organization
 * member, the authenticated user must have `read` access to both the team and project, or
 * `admin` access to the team or project. **Note:** This endpoint removes the project from
 * the team, but does not delete it.
 */
class RemoveProjectLegacy {
    RemoveProjectLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveProjectLegacy.fromRawJson(String str) => RemoveProjectLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveProjectLegacy.fromJson(Map<String, dynamic> json) => RemoveProjectLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Remove team
 * repository`](https://developer.github.com/v3/teams/#remove-team-repository) endpoint.
 *
 * If the authenticated user is an organization owner or a team maintainer, they can remove
 * any repositories from the team. To remove a repository from a team as an organization
 * member, the authenticated user must have admin access to the repository and must be able
 * to see the team. NOTE: This does not delete the repository, it just removes it from the
 * team.
 */
class RemoveRepo {
    RemoveRepo({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveRepo.fromRawJson(String str) => RemoveRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveRepo.fromJson(Map<String, dynamic> json) => RemoveRepo(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * If the authenticated user is an organization owner or a team maintainer, they can remove
 * any repositories from the team. To remove a repository from a team as an organization
 * member, the authenticated user must have admin access to the repository and must be able
 * to see the team. This does not delete the repository, it just removes it from the team.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `DELETE
 * /organizations/:org_id/team/:team_id/repos/:owner/:repo`.
 */
class RemoveRepoInOrg {
    RemoveRepoInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveRepoInOrg.fromRawJson(String str) => RemoveRepoInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveRepoInOrg.fromJson(Map<String, dynamic> json) => RemoveRepoInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Remove team
 * repository`](https://developer.github.com/v3/teams/#remove-team-repository) endpoint.
 *
 * If the authenticated user is an organization owner or a team maintainer, they can remove
 * any repositories from the team. To remove a repository from a team as an organization
 * member, the authenticated user must have admin access to the repository and must be able
 * to see the team. NOTE: This does not delete the repository, it just removes it from the
 * team.
 */
class RemoveRepoLegacy {
    RemoveRepoLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory RemoveRepoLegacy.fromRawJson(String str) => RemoveRepoLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RemoveRepoLegacy.fromJson(Map<String, dynamic> json) => RemoveRepoLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Review a team
 * project`](https://developer.github.com/v3/teams/#review-a-team-project) endpoint.
 *
 * Checks whether a team has `read`, `write`, or `admin` permissions for an organization
 * project. The response includes projects inherited from a parent team.
 */
class ReviewProject {
    ReviewProject({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReviewProject.fromRawJson(String str) => ReviewProject.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReviewProject.fromJson(Map<String, dynamic> json) => ReviewProject(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Checks whether a team has `read`, `write`, or `admin` permissions for an organization
 * project. The response includes projects inherited from a parent team.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `GET
 * /organizations/:org_id/team/:team_id/projects/:project_id`.
 */
class ReviewProjectInOrg {
    ReviewProjectInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReviewProjectInOrg.fromRawJson(String str) => ReviewProjectInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReviewProjectInOrg.fromJson(Map<String, dynamic> json) => ReviewProjectInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Review a team
 * project`](https://developer.github.com/v3/teams/#review-a-team-project) endpoint.
 *
 * Checks whether a team has `read`, `write`, or `admin` permissions for an organization
 * project. The response includes projects inherited from a parent team.
 */
class ReviewProjectLegacy {
    ReviewProjectLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ReviewProjectLegacy.fromRawJson(String str) => ReviewProjectLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReviewProjectLegacy.fromJson(Map<String, dynamic> json) => ReviewProjectLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the [`Get team by
 * name`](https://developer.github.com/v3/teams/#get-team-by-name) endpoint.
 */
class TeamsGet {
    TeamsGet({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsGet.fromRawJson(String str) => TeamsGet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsGet.fromJson(Map<String, dynamic> json) => TeamsGet(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Edit
 * team`](https://developer.github.com/v3/teams/#edit-team) endpoint.
 *
 * To edit a team, the authenticated user must either be an organization owner or a team
 * maintainer.
 *
 * **Note:** With nested teams, the `privacy` for parent teams cannot be `secret`.
 */
class TeamsUpdate {
    TeamsUpdate({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TeamsUpdate.fromRawJson(String str) => TeamsUpdate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TeamsUpdate.fromJson(Map<String, dynamic> json) => TeamsUpdate(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Edit a
 * discussion`](https://developer.github.com/v3/teams/discussions/#edit-a-discussion)
 * endpoint.
 *
 * Edits the title and body text of a discussion post. Only the parameters you provide are
 * updated. OAuth access tokens require the `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class UpdateDiscussion {
    UpdateDiscussion({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateDiscussion.fromRawJson(String str) => UpdateDiscussion.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateDiscussion.fromJson(Map<String, dynamic> json) => UpdateDiscussion(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Edit a
 * comment`](https://developer.github.com/v3/teams/discussion_comments/#edit-a-comment)
 * endpoint.
 *
 * Edits the body text of a discussion comment. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class UpdateDiscussionComment {
    UpdateDiscussionComment({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateDiscussionComment.fromRawJson(String str) => UpdateDiscussionComment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateDiscussionComment.fromJson(Map<String, dynamic> json) => UpdateDiscussionComment(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Edits the body text of a discussion comment. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `PATCH
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number`.
 */
class UpdateDiscussionCommentInOrg {
    UpdateDiscussionCommentInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateDiscussionCommentInOrg.fromRawJson(String str) => UpdateDiscussionCommentInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateDiscussionCommentInOrg.fromJson(Map<String, dynamic> json) => UpdateDiscussionCommentInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Edit a
 * comment`](https://developer.github.com/v3/teams/discussion_comments/#edit-a-comment)
 * endpoint.
 *
 * Edits the body text of a discussion comment. OAuth access tokens require the
 * `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class UpdateDiscussionCommentLegacy {
    UpdateDiscussionCommentLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateDiscussionCommentLegacy.fromRawJson(String str) => UpdateDiscussionCommentLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateDiscussionCommentLegacy.fromJson(Map<String, dynamic> json) => UpdateDiscussionCommentLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Edits the title and body text of a discussion post. Only the parameters you provide are
 * updated. OAuth access tokens require the `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `PATCH
 * /organizations/:org_id/team/:team_id/discussions/:discussion_number`.
 */
class UpdateDiscussionInOrg {
    UpdateDiscussionInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateDiscussionInOrg.fromRawJson(String str) => UpdateDiscussionInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateDiscussionInOrg.fromJson(Map<String, dynamic> json) => UpdateDiscussionInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Edit a
 * discussion`](https://developer.github.com/v3/teams/discussions/#edit-a-discussion)
 * endpoint.
 *
 * Edits the title and body text of a discussion post. Only the parameters you provide are
 * updated. OAuth access tokens require the `write:discussion`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class UpdateDiscussionLegacy {
    UpdateDiscussionLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateDiscussionLegacy.fromRawJson(String str) => UpdateDiscussionLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateDiscussionLegacy.fromJson(Map<String, dynamic> json) => UpdateDiscussionLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * To edit a team, the authenticated user must either be an organization owner or a team
 * maintainer.
 *
 * **Note:** You can also specify a team by `org_id` and `team_id` using the route `PATCH
 * /organizations/:org_id/team/:team_id`.
 */
class UpdateInOrg {
    UpdateInOrg({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateInOrg.fromRawJson(String str) => UpdateInOrg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateInOrg.fromJson(Map<String, dynamic> json) => UpdateInOrg(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Deprecation Notice:** This endpoint route is deprecated and will be removed from the
 * Teams API. We recommend migrating your existing code to use the new [`Edit
 * team`](https://developer.github.com/v3/teams/#edit-team) endpoint.
 *
 * To edit a team, the authenticated user must either be an organization owner or a team
 * maintainer.
 *
 * **Note:** With nested teams, the `privacy` for parent teams cannot be `secret`.
 */
class UpdateLegacy {
    UpdateLegacy({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateLegacy.fromRawJson(String str) => UpdateLegacy.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateLegacy.fromJson(Map<String, dynamic> json) => UpdateLegacy(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ApiUsers {
    ApiUsers({
        this.addEmails,
        this.block,
        this.checkBlocked,
        this.checkFollowing,
        this.checkFollowingForUser,
        this.createGpgKey,
        this.createPublicKey,
        this.deleteEmails,
        this.deleteGpgKey,
        this.deletePublicKey,
        this.follow,
        this.getAuthenticated,
        this.getByUsername,
        this.getContextForUser,
        this.getGpgKey,
        this.getPublicKey,
        this.list,
        this.listBlocked,
        this.listEmails,
        this.listFollowersForAuthenticatedUser,
        this.listFollowersForUser,
        this.listFollowingForAuthenticatedUser,
        this.listFollowingForUser,
        this.listGpgKeys,
        this.listGpgKeysForUser,
        this.listPublicEmails,
        this.listPublicKeys,
        this.listPublicKeysForUser,
        this.togglePrimaryEmailVisibility,
        this.unblock,
        this.unfollow,
        this.updateAuthenticated,
    });

    final AddEmails addEmails;
    final Block block;
    final CheckBlocked checkBlocked;
    final CheckFollowing checkFollowing;
    final CheckFollowingForUser checkFollowingForUser;
    final CreateGpgKey createGpgKey;
    final CreatePublicKey createPublicKey;
    final DeleteEmails deleteEmails;
    final DeleteGpgKey deleteGpgKey;
    final DeletePublicKey deletePublicKey;
    final Follow follow;
    final UsersGetAuthenticated getAuthenticated;
    final GetByUsername getByUsername;
    final GetContextForUser getContextForUser;
    final GetGpgKey getGpgKey;
    final UsersGetPublicKey getPublicKey;
    final UsersList list;
    final ListBlocked listBlocked;
    final ListEmails listEmails;
    final ListFollowersForAuthenticatedUser listFollowersForAuthenticatedUser;
    final ListFollowersForUser listFollowersForUser;
    final ListFollowingForAuthenticatedUser listFollowingForAuthenticatedUser;
    final ListFollowingForUser listFollowingForUser;
    final ListGpgKeys listGpgKeys;
    final ListGpgKeysForUser listGpgKeysForUser;
    final ListPublicEmails listPublicEmails;
    final ListPublicKeys listPublicKeys;
    final ListPublicKeysForUser listPublicKeysForUser;
    final TogglePrimaryEmailVisibility togglePrimaryEmailVisibility;
    final Unblock unblock;
    final Unfollow unfollow;
    final UpdateAuthenticated updateAuthenticated;

    factory ApiUsers.fromRawJson(String str) => ApiUsers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ApiUsers.fromJson(Map<String, dynamic> json) => ApiUsers(
        addEmails: json["addEmails"] == null ? null : AddEmails.fromJson(json["addEmails"]),
        block: json["block"] == null ? null : Block.fromJson(json["block"]),
        checkBlocked: json["checkBlocked"] == null ? null : CheckBlocked.fromJson(json["checkBlocked"]),
        checkFollowing: json["checkFollowing"] == null ? null : CheckFollowing.fromJson(json["checkFollowing"]),
        checkFollowingForUser: json["checkFollowingForUser"] == null ? null : CheckFollowingForUser.fromJson(json["checkFollowingForUser"]),
        createGpgKey: json["createGpgKey"] == null ? null : CreateGpgKey.fromJson(json["createGpgKey"]),
        createPublicKey: json["createPublicKey"] == null ? null : CreatePublicKey.fromJson(json["createPublicKey"]),
        deleteEmails: json["deleteEmails"] == null ? null : DeleteEmails.fromJson(json["deleteEmails"]),
        deleteGpgKey: json["deleteGpgKey"] == null ? null : DeleteGpgKey.fromJson(json["deleteGpgKey"]),
        deletePublicKey: json["deletePublicKey"] == null ? null : DeletePublicKey.fromJson(json["deletePublicKey"]),
        follow: json["follow"] == null ? null : Follow.fromJson(json["follow"]),
        getAuthenticated: json["getAuthenticated"] == null ? null : UsersGetAuthenticated.fromJson(json["getAuthenticated"]),
        getByUsername: json["getByUsername"] == null ? null : GetByUsername.fromJson(json["getByUsername"]),
        getContextForUser: json["getContextForUser"] == null ? null : GetContextForUser.fromJson(json["getContextForUser"]),
        getGpgKey: json["getGpgKey"] == null ? null : GetGpgKey.fromJson(json["getGpgKey"]),
        getPublicKey: json["getPublicKey"] == null ? null : UsersGetPublicKey.fromJson(json["getPublicKey"]),
        list: json["list"] == null ? null : UsersList.fromJson(json["list"]),
        listBlocked: json["listBlocked"] == null ? null : ListBlocked.fromJson(json["listBlocked"]),
        listEmails: json["listEmails"] == null ? null : ListEmails.fromJson(json["listEmails"]),
        listFollowersForAuthenticatedUser: json["listFollowersForAuthenticatedUser"] == null ? null : ListFollowersForAuthenticatedUser.fromJson(json["listFollowersForAuthenticatedUser"]),
        listFollowersForUser: json["listFollowersForUser"] == null ? null : ListFollowersForUser.fromJson(json["listFollowersForUser"]),
        listFollowingForAuthenticatedUser: json["listFollowingForAuthenticatedUser"] == null ? null : ListFollowingForAuthenticatedUser.fromJson(json["listFollowingForAuthenticatedUser"]),
        listFollowingForUser: json["listFollowingForUser"] == null ? null : ListFollowingForUser.fromJson(json["listFollowingForUser"]),
        listGpgKeys: json["listGpgKeys"] == null ? null : ListGpgKeys.fromJson(json["listGpgKeys"]),
        listGpgKeysForUser: json["listGpgKeysForUser"] == null ? null : ListGpgKeysForUser.fromJson(json["listGpgKeysForUser"]),
        listPublicEmails: json["listPublicEmails"] == null ? null : ListPublicEmails.fromJson(json["listPublicEmails"]),
        listPublicKeys: json["listPublicKeys"] == null ? null : ListPublicKeys.fromJson(json["listPublicKeys"]),
        listPublicKeysForUser: json["listPublicKeysForUser"] == null ? null : ListPublicKeysForUser.fromJson(json["listPublicKeysForUser"]),
        togglePrimaryEmailVisibility: json["togglePrimaryEmailVisibility"] == null ? null : TogglePrimaryEmailVisibility.fromJson(json["togglePrimaryEmailVisibility"]),
        unblock: json["unblock"] == null ? null : Unblock.fromJson(json["unblock"]),
        unfollow: json["unfollow"] == null ? null : Unfollow.fromJson(json["unfollow"]),
        updateAuthenticated: json["updateAuthenticated"] == null ? null : UpdateAuthenticated.fromJson(json["updateAuthenticated"]),
    );

    Map<String, dynamic> toJson() => {
        "addEmails": addEmails == null ? null : addEmails.toJson(),
        "block": block == null ? null : block.toJson(),
        "checkBlocked": checkBlocked == null ? null : checkBlocked.toJson(),
        "checkFollowing": checkFollowing == null ? null : checkFollowing.toJson(),
        "checkFollowingForUser": checkFollowingForUser == null ? null : checkFollowingForUser.toJson(),
        "createGpgKey": createGpgKey == null ? null : createGpgKey.toJson(),
        "createPublicKey": createPublicKey == null ? null : createPublicKey.toJson(),
        "deleteEmails": deleteEmails == null ? null : deleteEmails.toJson(),
        "deleteGpgKey": deleteGpgKey == null ? null : deleteGpgKey.toJson(),
        "deletePublicKey": deletePublicKey == null ? null : deletePublicKey.toJson(),
        "follow": follow == null ? null : follow.toJson(),
        "getAuthenticated": getAuthenticated == null ? null : getAuthenticated.toJson(),
        "getByUsername": getByUsername == null ? null : getByUsername.toJson(),
        "getContextForUser": getContextForUser == null ? null : getContextForUser.toJson(),
        "getGpgKey": getGpgKey == null ? null : getGpgKey.toJson(),
        "getPublicKey": getPublicKey == null ? null : getPublicKey.toJson(),
        "list": list == null ? null : list.toJson(),
        "listBlocked": listBlocked == null ? null : listBlocked.toJson(),
        "listEmails": listEmails == null ? null : listEmails.toJson(),
        "listFollowersForAuthenticatedUser": listFollowersForAuthenticatedUser == null ? null : listFollowersForAuthenticatedUser.toJson(),
        "listFollowersForUser": listFollowersForUser == null ? null : listFollowersForUser.toJson(),
        "listFollowingForAuthenticatedUser": listFollowingForAuthenticatedUser == null ? null : listFollowingForAuthenticatedUser.toJson(),
        "listFollowingForUser": listFollowingForUser == null ? null : listFollowingForUser.toJson(),
        "listGpgKeys": listGpgKeys == null ? null : listGpgKeys.toJson(),
        "listGpgKeysForUser": listGpgKeysForUser == null ? null : listGpgKeysForUser.toJson(),
        "listPublicEmails": listPublicEmails == null ? null : listPublicEmails.toJson(),
        "listPublicKeys": listPublicKeys == null ? null : listPublicKeys.toJson(),
        "listPublicKeysForUser": listPublicKeysForUser == null ? null : listPublicKeysForUser.toJson(),
        "togglePrimaryEmailVisibility": togglePrimaryEmailVisibility == null ? null : togglePrimaryEmailVisibility.toJson(),
        "unblock": unblock == null ? null : unblock.toJson(),
        "unfollow": unfollow == null ? null : unfollow.toJson(),
        "updateAuthenticated": updateAuthenticated == null ? null : updateAuthenticated.toJson(),
    };
}

/**
 * This endpoint is accessible with the `user` scope.
 */
class AddEmails {
    AddEmails({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory AddEmails.fromRawJson(String str) => AddEmails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddEmails.fromJson(Map<String, dynamic> json) => AddEmails(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Block {
    Block({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Block.fromRawJson(String str) => Block.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Block.fromJson(Map<String, dynamic> json) => Block(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * If the user is blocked:
 *
 * If the user is not blocked:
 */
class CheckBlocked {
    CheckBlocked({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckBlocked.fromRawJson(String str) => CheckBlocked.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckBlocked.fromJson(Map<String, dynamic> json) => CheckBlocked(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class CheckFollowing {
    CheckFollowing({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckFollowing.fromRawJson(String str) => CheckFollowing.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckFollowing.fromJson(Map<String, dynamic> json) => CheckFollowing(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class CheckFollowingForUser {
    CheckFollowingForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CheckFollowingForUser.fromRawJson(String str) => CheckFollowingForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CheckFollowingForUser.fromJson(Map<String, dynamic> json) => CheckFollowingForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Adds a GPG key to the authenticated user's GitHub account. Requires that you are
 * authenticated via Basic Auth, or OAuth with at least `write:gpg_key`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class CreateGpgKey {
    CreateGpgKey({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreateGpgKey.fromRawJson(String str) => CreateGpgKey.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateGpgKey.fromJson(Map<String, dynamic> json) => CreateGpgKey(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Adds a public SSH key to the authenticated user's GitHub account. Requires that you are
 * authenticated via Basic Auth, or OAuth with at least `write:public_key`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class CreatePublicKey {
    CreatePublicKey({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory CreatePublicKey.fromRawJson(String str) => CreatePublicKey.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreatePublicKey.fromJson(Map<String, dynamic> json) => CreatePublicKey(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * This endpoint is accessible with the `user` scope.
 */
class DeleteEmails {
    DeleteEmails({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteEmails.fromRawJson(String str) => DeleteEmails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteEmails.fromJson(Map<String, dynamic> json) => DeleteEmails(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Removes a GPG key from the authenticated user's GitHub account. Requires that you are
 * authenticated via Basic Auth or via OAuth with at least `admin:gpg_key`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class DeleteGpgKey {
    DeleteGpgKey({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeleteGpgKey.fromRawJson(String str) => DeleteGpgKey.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeleteGpgKey.fromJson(Map<String, dynamic> json) => DeleteGpgKey(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Removes a public SSH key from the authenticated user's GitHub account. Requires that you
 * are authenticated via Basic Auth or via OAuth with at least `admin:public_key`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class DeletePublicKey {
    DeletePublicKey({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory DeletePublicKey.fromRawJson(String str) => DeletePublicKey.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeletePublicKey.fromJson(Map<String, dynamic> json) => DeletePublicKey(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Note that you'll need to set `Content-Length` to zero when calling out to this endpoint.
 * For more information, see "[HTTP verbs](https://developer.github.com/v3/#http-verbs)."
 *
 * Following a user requires the user to be logged in and authenticated with basic auth or
 * OAuth with the `user:follow` scope.
 */
class Follow {
    Follow({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Follow.fromRawJson(String str) => Follow.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists public and private profile information when authenticated through basic auth or
 * OAuth with the `user` scope.
 *
 * Lists public profile information when authenticated through OAuth without the `user`
 * scope.
 */
class UsersGetAuthenticated {
    UsersGetAuthenticated({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UsersGetAuthenticated.fromRawJson(String str) => UsersGetAuthenticated.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UsersGetAuthenticated.fromJson(Map<String, dynamic> json) => UsersGetAuthenticated(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Provides publicly available information about someone with a GitHub account.
 *
 * GitHub Apps with the `Plan` user permission can use this endpoint to retrieve information
 * about a user's GitHub plan. The GitHub App must be authenticated as a user. See
 * "[Identifying and authorizing users for GitHub
 * Apps](https://developer.github.com/apps/building-github-apps/identifying-and-authorizing-users-for-github-apps/)"
 * for details about authentication. For an example response, see "[Response with GitHub
 * plan
 * information](https://developer.github.com/v3/users/#response-with-github-plan-information)."
 *
 * The `email` key in the following response is the publicly visible email address from your
 * GitHub [profile page](https://github.com/settings/profile). When setting up your profile,
 * you can select a primary email address to be “public” which provides an email entry for
 * this endpoint. If you do not set a public email address for `email`, then it will have a
 * value of `null`. You only see publicly visible email addresses when authenticated with
 * GitHub. For more information, see
 * [Authentication](https://developer.github.com/v3/#authentication).
 *
 * The Emails API enables you to list all of your email addresses, and toggle a primary
 * email to be visible publicly. For more information, see "[Emails
 * API](https://developer.github.com/v3/users/emails/)".
 */
class GetByUsername {
    GetByUsername({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetByUsername.fromRawJson(String str) => GetByUsername.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetByUsername.fromJson(Map<String, dynamic> json) => GetByUsername(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Provides hovercard information when authenticated through basic auth or OAuth with the
 * `repo` scope. You can find out more about someone in relation to their pull requests,
 * issues, repositories, and organizations.
 *
 * The `subject_type` and `subject_id` parameters provide context for the person's
 * hovercard, which returns more information than without the parameters. For example, if
 * you wanted to find out more about `octocat` who owns the `Spoon-Knife` repository via
 * cURL, it would look like this:
 */
class GetContextForUser {
    GetContextForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetContextForUser.fromRawJson(String str) => GetContextForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetContextForUser.fromJson(Map<String, dynamic> json) => GetContextForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * View extended details for a single GPG key. Requires that you are authenticated via Basic
 * Auth or via OAuth with at least `read:gpg_key`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class GetGpgKey {
    GetGpgKey({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory GetGpgKey.fromRawJson(String str) => GetGpgKey.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetGpgKey.fromJson(Map<String, dynamic> json) => GetGpgKey(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * View extended details for a single public SSH key. Requires that you are authenticated
 * via Basic Auth or via OAuth with at least `read:public_key`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class UsersGetPublicKey {
    UsersGetPublicKey({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UsersGetPublicKey.fromRawJson(String str) => UsersGetPublicKey.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UsersGetPublicKey.fromJson(Map<String, dynamic> json) => UsersGetPublicKey(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all users, in the order that they signed up on GitHub. This list includes personal
 * user accounts and organization accounts.
 *
 * Note: Pagination is powered exclusively by the `since` parameter. Use the [Link
 * header](https://developer.github.com/v3/#link-header) to get the URL for the next page of
 * users.
 */
class UsersList {
    UsersList({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UsersList.fromRawJson(String str) => UsersList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UsersList.fromJson(Map<String, dynamic> json) => UsersList(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * List the users you've blocked on your personal account.
 */
class ListBlocked {
    ListBlocked({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListBlocked.fromRawJson(String str) => ListBlocked.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListBlocked.fromJson(Map<String, dynamic> json) => ListBlocked(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists all of your email addresses, and specifies which one is visible to the public. This
 * endpoint is accessible with the `user:email` scope.
 */
class ListEmails {
    ListEmails({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListEmails.fromRawJson(String str) => ListEmails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListEmails.fromJson(Map<String, dynamic> json) => ListEmails(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListFollowersForAuthenticatedUser {
    ListFollowersForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListFollowersForAuthenticatedUser.fromRawJson(String str) => ListFollowersForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListFollowersForAuthenticatedUser.fromJson(Map<String, dynamic> json) => ListFollowersForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListFollowersForUser {
    ListFollowersForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListFollowersForUser.fromRawJson(String str) => ListFollowersForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListFollowersForUser.fromJson(Map<String, dynamic> json) => ListFollowersForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListFollowingForAuthenticatedUser {
    ListFollowingForAuthenticatedUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListFollowingForAuthenticatedUser.fromRawJson(String str) => ListFollowingForAuthenticatedUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListFollowingForAuthenticatedUser.fromJson(Map<String, dynamic> json) => ListFollowingForAuthenticatedUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class ListFollowingForUser {
    ListFollowingForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListFollowingForUser.fromRawJson(String str) => ListFollowingForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListFollowingForUser.fromJson(Map<String, dynamic> json) => ListFollowingForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the current user's GPG keys. Requires that you are authenticated via Basic Auth or
 * via OAuth with at least `read:gpg_key`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class ListGpgKeys {
    ListGpgKeys({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListGpgKeys.fromRawJson(String str) => ListGpgKeys.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListGpgKeys.fromJson(Map<String, dynamic> json) => ListGpgKeys(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the GPG keys for a user. This information is accessible by anyone.
 */
class ListGpgKeysForUser {
    ListGpgKeysForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListGpgKeysForUser.fromRawJson(String str) => ListGpgKeysForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListGpgKeysForUser.fromJson(Map<String, dynamic> json) => ListGpgKeysForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists your publicly visible email address, which you can set with the [Toggle primary
 * email
 * visibility](https://developer.github.com/v3/users/emails/#toggle-primary-email-visibility)
 * endpoint. This endpoint is accessible with the `user:email` scope.
 */
class ListPublicEmails {
    ListPublicEmails({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPublicEmails.fromRawJson(String str) => ListPublicEmails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPublicEmails.fromJson(Map<String, dynamic> json) => ListPublicEmails(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the public SSH keys for the authenticated user's GitHub account. Requires that you
 * are authenticated via Basic Auth or via OAuth with at least `read:public_key`
 * [scope](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/).
 */
class ListPublicKeys {
    ListPublicKeys({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPublicKeys.fromRawJson(String str) => ListPublicKeys.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPublicKeys.fromJson(Map<String, dynamic> json) => ListPublicKeys(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Lists the _verified_ public SSH keys for a user. This is accessible by anyone.
 */
class ListPublicKeysForUser {
    ListPublicKeysForUser({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory ListPublicKeysForUser.fromRawJson(String str) => ListPublicKeysForUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListPublicKeysForUser.fromJson(Map<String, dynamic> json) => ListPublicKeysForUser(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Sets the visibility for your primary email addresses.
 */
class TogglePrimaryEmailVisibility {
    TogglePrimaryEmailVisibility({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory TogglePrimaryEmailVisibility.fromRawJson(String str) => TogglePrimaryEmailVisibility.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TogglePrimaryEmailVisibility.fromJson(Map<String, dynamic> json) => TogglePrimaryEmailVisibility(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

class Unblock {
    Unblock({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Unblock.fromRawJson(String str) => Unblock.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Unblock.fromJson(Map<String, dynamic> json) => Unblock(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * Unfollowing a user requires the user to be logged in and authenticated with basic auth or
 * OAuth with the `user:follow` scope.
 */
class Unfollow {
    Unfollow({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory Unfollow.fromRawJson(String str) => Unfollow.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Unfollow.fromJson(Map<String, dynamic> json) => Unfollow(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * **Note:** If your email is set to private and you send an `email` parameter as part of
 * this request to update your profile, your privacy settings are still enforced: the email
 * address will not be displayed on your public profile or via the API.
 */
class UpdateAuthenticated {
    UpdateAuthenticated({
        this.endpoint,
    });

    final OctokitEndpoint endpoint;

    factory UpdateAuthenticated.fromRawJson(String str) => UpdateAuthenticated.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateAuthenticated.fromJson(Map<String, dynamic> json) => UpdateAuthenticated(
        endpoint: json["endpoint"] == null ? null : OctokitEndpoint.fromJson(json["endpoint"]),
    );

    Map<String, dynamic> toJson() => {
        "endpoint": endpoint == null ? null : endpoint.toJson(),
    };
}

/**
 * A GitHub specific implementation of a git commit, it has GitHub user names instead of an
 * email.
 */
class GitHubCommit {
    GitHubCommit({
        this.author,
        this.commit,
        this.committer,
        this.parents,
        this.sha,
        this.url,
    });

    final GitHubUser author;
    final GitCommit commit;
    final GitHubUser committer;
    final List<dynamic> parents;
    final String sha;
    final String url;

    factory GitHubCommit.fromRawJson(String str) => GitHubCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubCommit.fromJson(Map<String, dynamic> json) => GitHubCommit(
        author: json["author"] == null ? null : GitHubUser.fromJson(json["author"]),
        commit: json["commit"] == null ? null : GitCommit.fromJson(json["commit"]),
        committer: json["committer"] == null ? null : GitHubUser.fromJson(json["committer"]),
        parents: json["parents"] == null ? null : List<dynamic>.from(json["parents"].map((x) => x)),
        sha: json["sha"] == null ? null : json["sha"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "author": author == null ? null : author.toJson(),
        "commit": commit == null ? null : commit.toJson(),
        "committer": committer == null ? null : committer.toJson(),
        "parents": parents == null ? null : List<dynamic>.from(parents.map((x) => x)),
        "sha": sha == null ? null : sha,
        "url": url == null ? null : url,
    };
}

/**
 * The GitHub user who wrote the code
 *
 * A GitHub user account.
 *
 * The GitHub user who shipped the code
 *
 * The User who is assigned the PR
 *
 * Is someone assigned to this PR?
 *
 * The owner of the repo
 *
 * The user that owns the merge reference e.g. "artsy"
 *
 * The User who submitted the PR
 *
 * The user requested to review, or the user who has completed the review
 */
class GitHubUser {
    GitHubUser({
        this.avatarUrl,
        this.href,
        this.id,
        this.login,
        this.type,
    });

    final String avatarUrl;
    final String href;
    final double id;
    final String login;
    final AssigneeType type;

    factory GitHubUser.fromRawJson(String str) => GitHubUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubUser.fromJson(Map<String, dynamic> json) => GitHubUser(
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        login: json["login"] == null ? null : json["login"],
        type: json["type"] == null ? null : assigneeTypeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "href": href == null ? null : href,
        "id": id == null ? null : id,
        "login": login == null ? null : login,
        "type": type == null ? null : assigneeTypeValues.reverse[type],
    };
}

/**
 * Whether the user is an org, or a user
 */
enum AssigneeType { BOT, ORGANIZATION, USER }

final assigneeTypeValues = EnumValues({
    "Bot": AssigneeType.BOT,
    "Organization": AssigneeType.ORGANIZATION,
    "User": AssigneeType.USER
});

/**
 * The issue metadata for a code review session
 *
 * This is `danger.github.issue` It refers to the issue that makes up the Pull Request.
 * GitHub treats all pull requests as a special type of issue. This DSL contains only parts
 * of the issue that are
 * not found in the PR DSL, however it does contain the full JSON structure.
 *
 * A GitHub Issue
 */
class GitHubIssue {
    GitHubIssue({
        this.labels,
    });

    final List<GitHubIssueLabel> labels;

    factory GitHubIssue.fromRawJson(String str) => GitHubIssue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubIssue.fromJson(Map<String, dynamic> json) => GitHubIssue(
        labels: json["labels"] == null ? null : List<GitHubIssueLabel>.from(json["labels"].map((x) => GitHubIssueLabel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "labels": labels == null ? null : List<dynamic>.from(labels.map((x) => x.toJson())),
    };
}

class GitHubIssueLabel {
    GitHubIssueLabel({
        this.color,
        this.id,
        this.name,
        this.url,
    });

    final String color;
    final double id;
    final String name;
    final String url;

    factory GitHubIssueLabel.fromRawJson(String str) => GitHubIssueLabel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubIssueLabel.fromJson(Map<String, dynamic> json) => GitHubIssueLabel(
        color: json["color"] == null ? null : json["color"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "color": color == null ? null : color,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}

/**
 * The PR metadata for a code review session
 *
 * An exact copy of the PR's reference JSON. This interface has type'd the majority
 * of it for tooling's sake, but any extra metadata which GitHub send will still be
 * inside the JS object.
 */
class GitHubPrdsl {
    GitHubPrdsl({
        this.additions,
        this.assignee,
        this.assignees,
        this.authorAssociation,
        this.base,
        this.body,
        this.changedFiles,
        this.closedAt,
        this.comments,
        this.commits,
        this.createdAt,
        this.deletions,
        this.head,
        this.htmlUrl,
        this.locked,
        this.merged,
        this.mergedAt,
        this.number,
        this.reviewComments,
        this.state,
        this.title,
        this.updatedAt,
        this.user,
    });

    final double additions;
    final GitHubUser assignee;
    final List<GitHubUser> assignees;
    final AuthorAssociation authorAssociation;
    final GitHubMergeRef base;
    final String body;
    final double changedFiles;
    final String closedAt;
    final double comments;
    final double commits;
    final String createdAt;
    final double deletions;
    final GitHubMergeRef head;
    final String htmlUrl;
    final bool locked;
    final bool merged;
    final String mergedAt;
    final double number;
    final double reviewComments;
    final ApprovalsState state;
    final String title;
    final String updatedAt;
    final GitHubUser user;

    factory GitHubPrdsl.fromRawJson(String str) => GitHubPrdsl.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubPrdsl.fromJson(Map<String, dynamic> json) => GitHubPrdsl(
        additions: json["additions"] == null ? null : json["additions"].toDouble(),
        assignee: json["assignee"] == null ? null : GitHubUser.fromJson(json["assignee"]),
        assignees: json["assignees"] == null ? null : List<GitHubUser>.from(json["assignees"].map((x) => GitHubUser.fromJson(x))),
        authorAssociation: json["author_association"] == null ? null : authorAssociationValues.map[json["author_association"]],
        base: json["base"] == null ? null : GitHubMergeRef.fromJson(json["base"]),
        body: json["body"] == null ? null : json["body"],
        changedFiles: json["changed_files"] == null ? null : json["changed_files"].toDouble(),
        closedAt: json["closed_at"] == null ? null : json["closed_at"],
        comments: json["comments"] == null ? null : json["comments"].toDouble(),
        commits: json["commits"] == null ? null : json["commits"].toDouble(),
        createdAt: json["created_at"] == null ? null : json["created_at"],
        deletions: json["deletions"] == null ? null : json["deletions"].toDouble(),
        head: json["head"] == null ? null : GitHubMergeRef.fromJson(json["head"]),
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        locked: json["locked"] == null ? null : json["locked"],
        merged: json["merged"] == null ? null : json["merged"],
        mergedAt: json["merged_at"] == null ? null : json["merged_at"],
        number: json["number"] == null ? null : json["number"].toDouble(),
        reviewComments: json["review_comments"] == null ? null : json["review_comments"].toDouble(),
        state: json["state"] == null ? null : approvalsStateValues.map[json["state"]],
        title: json["title"] == null ? null : json["title"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        user: json["user"] == null ? null : GitHubUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "additions": additions == null ? null : additions,
        "assignee": assignee == null ? null : assignee.toJson(),
        "assignees": assignees == null ? null : List<dynamic>.from(assignees.map((x) => x.toJson())),
        "author_association": authorAssociation == null ? null : authorAssociationValues.reverse[authorAssociation],
        "base": base == null ? null : base.toJson(),
        "body": body == null ? null : body,
        "changed_files": changedFiles == null ? null : changedFiles,
        "closed_at": closedAt == null ? null : closedAt,
        "comments": comments == null ? null : comments,
        "commits": commits == null ? null : commits,
        "created_at": createdAt == null ? null : createdAt,
        "deletions": deletions == null ? null : deletions,
        "head": head == null ? null : head.toJson(),
        "html_url": htmlUrl == null ? null : htmlUrl,
        "locked": locked == null ? null : locked,
        "merged": merged == null ? null : merged,
        "merged_at": mergedAt == null ? null : mergedAt,
        "number": number == null ? null : number,
        "review_comments": reviewComments == null ? null : reviewComments,
        "state": state == null ? null : approvalsStateValues.reverse[state],
        "title": title == null ? null : title,
        "updated_at": updatedAt == null ? null : updatedAt,
        "user": user == null ? null : user.toJson(),
    };
}

/**
 * How does the PR author relate to this repo/org?
 */
enum AuthorAssociation { COLLABORATOR, CONTRIBUTOR, FIRST_TIMER, FIRST_TIME_CONTRIBUTOR, MEMBER, NONE, OWNER }

final authorAssociationValues = EnumValues({
    "COLLABORATOR": AuthorAssociation.COLLABORATOR,
    "CONTRIBUTOR": AuthorAssociation.CONTRIBUTOR,
    "FIRST_TIMER": AuthorAssociation.FIRST_TIMER,
    "FIRST_TIME_CONTRIBUTOR": AuthorAssociation.FIRST_TIME_CONTRIBUTOR,
    "MEMBER": AuthorAssociation.MEMBER,
    "NONE": AuthorAssociation.NONE,
    "OWNER": AuthorAssociation.OWNER
});

/**
 * Merge reference for _this_ repo.
 *
 * Merge reference for the _other_ repo.
 */
class GitHubMergeRef {
    GitHubMergeRef({
        this.label,
        this.ref,
        this.repo,
        this.sha,
        this.user,
    });

    final String label;
    final String ref;
    final GitHubRepo repo;
    final String sha;
    final GitHubUser user;

    factory GitHubMergeRef.fromRawJson(String str) => GitHubMergeRef.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubMergeRef.fromJson(Map<String, dynamic> json) => GitHubMergeRef(
        label: json["label"] == null ? null : json["label"],
        ref: json["ref"] == null ? null : json["ref"],
        repo: json["repo"] == null ? null : GitHubRepo.fromJson(json["repo"]),
        sha: json["sha"] == null ? null : json["sha"],
        user: json["user"] == null ? null : GitHubUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "label": label == null ? null : label,
        "ref": ref == null ? null : ref,
        "repo": repo == null ? null : repo.toJson(),
        "sha": sha == null ? null : sha,
        "user": user == null ? null : user.toJson(),
    };
}

/**
 * The repo from whch the reference comes from
 *
 * A GitHub Repo
 */
class GitHubRepo {
    GitHubRepo({
        this.assignee,
        this.assignees,
        this.description,
        this.fork,
        this.fullName,
        this.htmlUrl,
        this.id,
        this.name,
        this.owner,
        this.private,
    });

    final GitHubUser assignee;
    final List<GitHubUser> assignees;
    final String description;
    final bool fork;
    final String fullName;
    final String htmlUrl;
    final double id;
    final String name;
    final GitHubUser owner;
    final bool private;

    factory GitHubRepo.fromRawJson(String str) => GitHubRepo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubRepo.fromJson(Map<String, dynamic> json) => GitHubRepo(
        assignee: json["assignee"] == null ? null : GitHubUser.fromJson(json["assignee"]),
        assignees: json["assignees"] == null ? null : List<GitHubUser>.from(json["assignees"].map((x) => GitHubUser.fromJson(x))),
        description: json["description"] == null ? null : json["description"],
        fork: json["fork"] == null ? null : json["fork"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        name: json["name"] == null ? null : json["name"],
        owner: json["owner"] == null ? null : GitHubUser.fromJson(json["owner"]),
        private: json["private"] == null ? null : json["private"],
    );

    Map<String, dynamic> toJson() => {
        "assignee": assignee == null ? null : assignee.toJson(),
        "assignees": assignees == null ? null : List<dynamic>.from(assignees.map((x) => x.toJson())),
        "description": description == null ? null : description,
        "fork": fork == null ? null : fork,
        "full_name": fullName == null ? null : fullName,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "owner": owner == null ? null : owner.toJson(),
        "private": private == null ? null : private,
    };
}

/**
 * The state for the PR
 *
 * The MR's current availability
 */
enum ApprovalsState { CLOSED, LOCKED, MERGED, OPEN }

final approvalsStateValues = EnumValues({
    "closed": ApprovalsState.CLOSED,
    "locked": ApprovalsState.LOCKED,
    "merged": ApprovalsState.MERGED,
    "open": ApprovalsState.OPEN
});

/**
 * The people/teams requested to review this PR
 */
class GitHubReviewers {
    GitHubReviewers({
        this.teams,
        this.users,
    });

    final List<dynamic> teams;
    final List<GitHubUser> users;

    factory GitHubReviewers.fromRawJson(String str) => GitHubReviewers.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubReviewers.fromJson(Map<String, dynamic> json) => GitHubReviewers(
        teams: json["teams"] == null ? null : List<dynamic>.from(json["teams"].map((x) => x)),
        users: json["users"] == null ? null : List<GitHubUser>.from(json["users"].map((x) => GitHubUser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "teams": teams == null ? null : List<dynamic>.from(teams.map((x) => x)),
        "users": users == null ? null : List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

/**
 * GitHubReview
 * While a review is pending, it will only have a user.  Once a review is complete, the rest
 * of
 * the review attributes will be present
 */
class GitHubReview {
    GitHubReview({
        this.body,
        this.commitId,
        this.id,
        this.state,
        this.user,
    });

    final String body;
    final String commitId;
    final double id;
    final ReviewState state;
    final GitHubUser user;

    factory GitHubReview.fromRawJson(String str) => GitHubReview.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubReview.fromJson(Map<String, dynamic> json) => GitHubReview(
        body: json["body"] == null ? null : json["body"],
        commitId: json["commit_id"] == null ? null : json["commit_id"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        state: json["state"] == null ? null : reviewStateValues.map[json["state"]],
        user: json["user"] == null ? null : GitHubUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "body": body == null ? null : body,
        "commit_id": commitId == null ? null : commitId,
        "id": id == null ? null : id,
        "state": state == null ? null : reviewStateValues.reverse[state],
        "user": user == null ? null : user.toJson(),
    };
}

/**
 * The state of the review
 * APPROVED, REQUEST_CHANGES, COMMENT or PENDING
 */
enum ReviewState { APPROVED, COMMENT, PENDING, REQUEST_CHANGES }

final reviewStateValues = EnumValues({
    "APPROVED": ReviewState.APPROVED,
    "COMMENT": ReviewState.COMMENT,
    "PENDING": ReviewState.PENDING,
    "REQUEST_CHANGES": ReviewState.REQUEST_CHANGES
});

/**
 * The PR metadata specifically formatted for using with the GitHub API client
 *
 * Provides the current PR in an easily used way for params in `github.api` calls
 */
class GitHubApipr {
    GitHubApipr({
        this.number,
        this.owner,
        this.repo,
    });

    final double number;
    final String owner;
    final String repo;

    factory GitHubApipr.fromRawJson(String str) => GitHubApipr.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubApipr.fromJson(Map<String, dynamic> json) => GitHubApipr(
        number: json["number"] == null ? null : json["number"].toDouble(),
        owner: json["owner"] == null ? null : json["owner"],
        repo: json["repo"] == null ? null : json["repo"],
    );

    Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "owner": owner == null ? null : owner,
        "repo": repo == null ? null : repo,
    };
}

/**
 * A scope for useful functions related to GitHub
 *
 * Useful functions for GitHub related work
 */
class GitHubUtilsDsl {
    GitHubUtilsDsl({
        this.createOrAddLabel,
        this.createOrUpdatePr,
        this.createUpdatedIssueWithId,
    });

    final Map<String, dynamic> createOrAddLabel;
    final Map<String, dynamic> createOrUpdatePr;
    final Map<String, dynamic> createUpdatedIssueWithId;

    factory GitHubUtilsDsl.fromRawJson(String str) => GitHubUtilsDsl.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitHubUtilsDsl.fromJson(Map<String, dynamic> json) => GitHubUtilsDsl(
        createOrAddLabel: json["createOrAddLabel"] == null ? null : Map.from(json["createOrAddLabel"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        createOrUpdatePr: json["createOrUpdatePR"] == null ? null : Map.from(json["createOrUpdatePR"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
        createUpdatedIssueWithId: json["createUpdatedIssueWithID"] == null ? null : Map.from(json["createUpdatedIssueWithID"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "createOrAddLabel": createOrAddLabel == null ? null : Map.from(createOrAddLabel).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "createOrUpdatePR": createOrUpdatePr == null ? null : Map.from(createOrUpdatePr).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "createUpdatedIssueWithID": createUpdatedIssueWithId == null ? null : Map.from(createUpdatedIssueWithId).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

/**
 * The data only version of GitLab DSL
 *
 * The GitLab metadata for your MR
 */
class GitLabDsl {
    GitLabDsl({
        this.approvals,
        this.commits,
        this.metadata,
        this.mr,
        this.utils,
    });

    final GitLabApproval approvals;
    final List<GitLabMrCommit> commits;
    final RepoMetaData metadata;
    final GitLabMr mr;
    final Map<String, dynamic> utils;

    factory GitLabDsl.fromRawJson(String str) => GitLabDsl.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitLabDsl.fromJson(Map<String, dynamic> json) => GitLabDsl(
        approvals: json["approvals"] == null ? null : GitLabApproval.fromJson(json["approvals"]),
        commits: json["commits"] == null ? null : List<GitLabMrCommit>.from(json["commits"].map((x) => GitLabMrCommit.fromJson(x))),
        metadata: json["metadata"] == null ? null : RepoMetaData.fromJson(json["metadata"]),
        mr: json["mr"] == null ? null : GitLabMr.fromJson(json["mr"]),
        utils: json["utils"] == null ? null : Map.from(json["utils"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "approvals": approvals == null ? null : approvals.toJson(),
        "commits": commits == null ? null : List<dynamic>.from(commits.map((x) => x.toJson())),
        "metadata": metadata == null ? null : metadata.toJson(),
        "mr": mr == null ? null : mr.toJson(),
        "utils": utils == null ? null : Map.from(utils).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

/**
 * Merge Request-level MR approvals Configuration
 */
class GitLabApproval {
    GitLabApproval({
        this.approvalsLeft,
        this.approvalsRequired,
        this.approvedBy,
        this.createdAt,
        this.description,
        this.id,
        this.iid,
        this.mergeStatus,
        this.projectId,
        this.state,
        this.title,
        this.updatedAt,
    });

    final double approvalsLeft;
    final double approvalsRequired;
    final List<ApprovedByElement> approvedBy;
    final String createdAt;
    final String description;
    final double id;
    final double iid;
    final MergeStatus mergeStatus;
    final double projectId;
    final ApprovalsState state;
    final String title;
    final String updatedAt;

    factory GitLabApproval.fromRawJson(String str) => GitLabApproval.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitLabApproval.fromJson(Map<String, dynamic> json) => GitLabApproval(
        approvalsLeft: json["approvals_left"] == null ? null : json["approvals_left"].toDouble(),
        approvalsRequired: json["approvals_required"] == null ? null : json["approvals_required"].toDouble(),
        approvedBy: json["approved_by"] == null ? null : List<ApprovedByElement>.from(json["approved_by"].map((x) => ApprovedByElement.fromJson(x))),
        createdAt: json["created_at"] == null ? null : json["created_at"],
        description: json["description"] == null ? null : json["description"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        iid: json["iid"] == null ? null : json["iid"].toDouble(),
        mergeStatus: json["merge_status"] == null ? null : mergeStatusValues.map[json["merge_status"]],
        projectId: json["project_id"] == null ? null : json["project_id"].toDouble(),
        state: json["state"] == null ? null : approvalsStateValues.map[json["state"]],
        title: json["title"] == null ? null : json["title"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "approvals_left": approvalsLeft == null ? null : approvalsLeft,
        "approvals_required": approvalsRequired == null ? null : approvalsRequired,
        "approved_by": approvedBy == null ? null : List<dynamic>.from(approvedBy.map((x) => x.toJson())),
        "created_at": createdAt == null ? null : createdAt,
        "description": description == null ? null : description,
        "id": id == null ? null : id,
        "iid": iid == null ? null : iid,
        "merge_status": mergeStatus == null ? null : mergeStatusValues.reverse[mergeStatus],
        "project_id": projectId == null ? null : projectId,
        "state": state == null ? null : approvalsStateValues.reverse[state],
        "title": title == null ? null : title,
        "updated_at": updatedAt == null ? null : updatedAt,
    };
}

/**
 * Who was assigned as the person to review
 *
 * Who made it
 */
class ApprovedByElement {
    ApprovedByElement({
        this.user,
        this.avatarUrl,
        this.id,
        this.name,
        this.state,
        this.username,
        this.webUrl,
    });

    final GitLabUser user;
    final String avatarUrl;
    final double id;
    final String name;
    final ApprovedByState state;
    final String username;
    final String webUrl;

    factory ApprovedByElement.fromRawJson(String str) => ApprovedByElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ApprovedByElement.fromJson(Map<String, dynamic> json) => ApprovedByElement(
        user: json["user"] == null ? null : GitLabUser.fromJson(json["user"]),
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        name: json["name"] == null ? null : json["name"],
        state: json["state"] == null ? null : approvedByStateValues.map[json["state"]],
        username: json["username"] == null ? null : json["username"],
        webUrl: json["web_url"] == null ? null : json["web_url"],
    );

    Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "state": state == null ? null : approvedByStateValues.reverse[state],
        "username": username == null ? null : username,
        "web_url": webUrl == null ? null : webUrl,
    };
}

enum ApprovedByState { ACTIVE, BLOCKED }

final approvedByStateValues = EnumValues({
    "active": ApprovedByState.ACTIVE,
    "blocked": ApprovedByState.BLOCKED
});

/**
 * Who was assigned as the person to review
 *
 * Who made it
 */
class GitLabUser {
    GitLabUser({
        this.avatarUrl,
        this.id,
        this.name,
        this.state,
        this.username,
        this.webUrl,
    });

    final String avatarUrl;
    final double id;
    final String name;
    final ApprovedByState state;
    final String username;
    final String webUrl;

    factory GitLabUser.fromRawJson(String str) => GitLabUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitLabUser.fromJson(Map<String, dynamic> json) => GitLabUser(
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        name: json["name"] == null ? null : json["name"],
        state: json["state"] == null ? null : approvedByStateValues.map[json["state"]],
        username: json["username"] == null ? null : json["username"],
        webUrl: json["web_url"] == null ? null : json["web_url"],
    );

    Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "state": state == null ? null : approvedByStateValues.reverse[state],
        "username": username == null ? null : username,
        "web_url": webUrl == null ? null : webUrl,
    };
}

enum MergeStatus { CAN_BE_MERGED }

final mergeStatusValues = EnumValues({
    "can_be_merged": MergeStatus.CAN_BE_MERGED
});

class GitLabMrCommit {
    GitLabMrCommit({
        this.authorEmail,
        this.authorName,
        this.authoredDate,
        this.committedDate,
        this.committerEmail,
        this.committerName,
        this.createdAt,
        this.id,
        this.message,
        this.parentIds,
        this.shortId,
        this.title,
    });

    final String authorEmail;
    final String authorName;
    final String authoredDate;
    final String committedDate;
    final String committerEmail;
    final String committerName;
    final String createdAt;
    final String id;
    final String message;
    final List<String> parentIds;
    final String shortId;
    final String title;

    factory GitLabMrCommit.fromRawJson(String str) => GitLabMrCommit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitLabMrCommit.fromJson(Map<String, dynamic> json) => GitLabMrCommit(
        authorEmail: json["author_email"] == null ? null : json["author_email"],
        authorName: json["author_name"] == null ? null : json["author_name"],
        authoredDate: json["authored_date"] == null ? null : json["authored_date"],
        committedDate: json["committed_date"] == null ? null : json["committed_date"],
        committerEmail: json["committer_email"] == null ? null : json["committer_email"],
        committerName: json["committer_name"] == null ? null : json["committer_name"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        id: json["id"] == null ? null : json["id"],
        message: json["message"] == null ? null : json["message"],
        parentIds: json["parent_ids"] == null ? null : List<String>.from(json["parent_ids"].map((x) => x)),
        shortId: json["short_id"] == null ? null : json["short_id"],
        title: json["title"] == null ? null : json["title"],
    );

    Map<String, dynamic> toJson() => {
        "author_email": authorEmail == null ? null : authorEmail,
        "author_name": authorName == null ? null : authorName,
        "authored_date": authoredDate == null ? null : authoredDate,
        "committed_date": committedDate == null ? null : committedDate,
        "committer_email": committerEmail == null ? null : committerEmail,
        "committer_name": committerName == null ? null : committerName,
        "created_at": createdAt == null ? null : createdAt,
        "id": id == null ? null : id,
        "message": message == null ? null : message,
        "parent_ids": parentIds == null ? null : List<dynamic>.from(parentIds.map((x) => x)),
        "short_id": shortId == null ? null : shortId,
        "title": title == null ? null : title,
    };
}

/**
 * Info about the merge request
 *
 * TODO: These need more comments from someone who uses GitLab, see GitLabDSL.ts in the
 * danger-js repo
 */
class GitLabMr {
    GitLabMr({
        this.allowCollaboration,
        this.allowMaintainerToPush,
        this.approvalsBeforeMerge,
        this.assignee,
        this.author,
        this.changesCount,
        this.closedAt,
        this.closedBy,
        this.createdAt,
        this.description,
        this.diffRefs,
        this.discussionLocked,
        this.divergedCommitsCount,
        this.downvotes,
        this.firstDeployedToProductionAt,
        this.forceRemoveSourceBranch,
        this.id,
        this.iid,
        this.labels,
        this.latestBuildFinishedAt,
        this.latestBuildStartedAt,
        this.mergeCommitSha,
        this.mergeError,
        this.mergeStatus,
        this.mergeWhenPipelineSucceeds,
        this.mergedAt,
        this.mergedBy,
        this.milestone,
        this.pipeline,
        this.projectId,
        this.rebaseInProgress,
        this.sha,
        this.shouldRemoveSourceBranch,
        this.sourceBranch,
        this.sourceProjectId,
        this.squash,
        this.state,
        this.subscribed,
        this.targetBranch,
        this.targetProjectId,
        this.timeStats,
        this.title,
        this.updatedAt,
        this.upvotes,
        this.user,
        this.userNotesCount,
        this.webUrl,
        this.workInProgress,
    });

    final bool allowCollaboration;
    final bool allowMaintainerToPush;
    final dynamic approvalsBeforeMerge;
    final GitLabUser assignee;
    final GitLabUser author;
    final String changesCount;
    final String closedAt;
    final GitLabUser closedBy;
    final String createdAt;
    final String description;
    final DiffRefs diffRefs;
    final dynamic discussionLocked;
    final double divergedCommitsCount;
    final double downvotes;
    final String firstDeployedToProductionAt;
    final bool forceRemoveSourceBranch;
    final double id;
    final double iid;
    final List<String> labels;
    final String latestBuildFinishedAt;
    final String latestBuildStartedAt;
    final String mergeCommitSha;
    final dynamic mergeError;
    final MergeStatus mergeStatus;
    final bool mergeWhenPipelineSucceeds;
    final String mergedAt;
    final GitLabUser mergedBy;
    final Milestone milestone;
    final Pipeline pipeline;
    final double projectId;
    final bool rebaseInProgress;
    final String sha;
    final bool shouldRemoveSourceBranch;
    final String sourceBranch;
    final double sourceProjectId;
    final bool squash;
    final ApprovalsState state;
    final bool subscribed;
    final String targetBranch;
    final double targetProjectId;
    final TimeStats timeStats;
    final String title;
    final String updatedAt;
    final double upvotes;
    final User user;
    final double userNotesCount;
    final String webUrl;
    final bool workInProgress;

    factory GitLabMr.fromRawJson(String str) => GitLabMr.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GitLabMr.fromJson(Map<String, dynamic> json) => GitLabMr(
        allowCollaboration: json["allow_collaboration"] == null ? null : json["allow_collaboration"],
        allowMaintainerToPush: json["allow_maintainer_to_push"] == null ? null : json["allow_maintainer_to_push"],
        approvalsBeforeMerge: json["approvals_before_merge"],
        assignee: json["assignee"] == null ? null : GitLabUser.fromJson(json["assignee"]),
        author: json["author"] == null ? null : GitLabUser.fromJson(json["author"]),
        changesCount: json["changes_count"] == null ? null : json["changes_count"],
        closedAt: json["closed_at"] == null ? null : json["closed_at"],
        closedBy: json["closed_by"] == null ? null : GitLabUser.fromJson(json["closed_by"]),
        createdAt: json["created_at"] == null ? null : json["created_at"],
        description: json["description"] == null ? null : json["description"],
        diffRefs: json["diff_refs"] == null ? null : DiffRefs.fromJson(json["diff_refs"]),
        discussionLocked: json["discussion_locked"],
        divergedCommitsCount: json["diverged_commits_count"] == null ? null : json["diverged_commits_count"].toDouble(),
        downvotes: json["downvotes"] == null ? null : json["downvotes"].toDouble(),
        firstDeployedToProductionAt: json["first_deployed_to_production_at"] == null ? null : json["first_deployed_to_production_at"],
        forceRemoveSourceBranch: json["force_remove_source_branch"] == null ? null : json["force_remove_source_branch"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        iid: json["iid"] == null ? null : json["iid"].toDouble(),
        labels: json["labels"] == null ? null : List<String>.from(json["labels"].map((x) => x)),
        latestBuildFinishedAt: json["latest_build_finished_at"] == null ? null : json["latest_build_finished_at"],
        latestBuildStartedAt: json["latest_build_started_at"] == null ? null : json["latest_build_started_at"],
        mergeCommitSha: json["merge_commit_sha"] == null ? null : json["merge_commit_sha"],
        mergeError: json["merge_error"],
        mergeStatus: json["merge_status"] == null ? null : mergeStatusValues.map[json["merge_status"]],
        mergeWhenPipelineSucceeds: json["merge_when_pipeline_succeeds"] == null ? null : json["merge_when_pipeline_succeeds"],
        mergedAt: json["merged_at"] == null ? null : json["merged_at"],
        mergedBy: json["merged_by"] == null ? null : GitLabUser.fromJson(json["merged_by"]),
        milestone: json["milestone"] == null ? null : Milestone.fromJson(json["milestone"]),
        pipeline: json["pipeline"] == null ? null : Pipeline.fromJson(json["pipeline"]),
        projectId: json["project_id"] == null ? null : json["project_id"].toDouble(),
        rebaseInProgress: json["rebase_in_progress"] == null ? null : json["rebase_in_progress"],
        sha: json["sha"] == null ? null : json["sha"],
        shouldRemoveSourceBranch: json["should_remove_source_branch"] == null ? null : json["should_remove_source_branch"],
        sourceBranch: json["source_branch"] == null ? null : json["source_branch"],
        sourceProjectId: json["source_project_id"] == null ? null : json["source_project_id"].toDouble(),
        squash: json["squash"] == null ? null : json["squash"],
        state: json["state"] == null ? null : approvalsStateValues.map[json["state"]],
        subscribed: json["subscribed"] == null ? null : json["subscribed"],
        targetBranch: json["target_branch"] == null ? null : json["target_branch"],
        targetProjectId: json["target_project_id"] == null ? null : json["target_project_id"].toDouble(),
        timeStats: json["time_stats"] == null ? null : TimeStats.fromJson(json["time_stats"]),
        title: json["title"] == null ? null : json["title"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        upvotes: json["upvotes"] == null ? null : json["upvotes"].toDouble(),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        userNotesCount: json["user_notes_count"] == null ? null : json["user_notes_count"].toDouble(),
        webUrl: json["web_url"] == null ? null : json["web_url"],
        workInProgress: json["work_in_progress"] == null ? null : json["work_in_progress"],
    );

    Map<String, dynamic> toJson() => {
        "allow_collaboration": allowCollaboration == null ? null : allowCollaboration,
        "allow_maintainer_to_push": allowMaintainerToPush == null ? null : allowMaintainerToPush,
        "approvals_before_merge": approvalsBeforeMerge,
        "assignee": assignee == null ? null : assignee.toJson(),
        "author": author == null ? null : author.toJson(),
        "changes_count": changesCount == null ? null : changesCount,
        "closed_at": closedAt == null ? null : closedAt,
        "closed_by": closedBy == null ? null : closedBy.toJson(),
        "created_at": createdAt == null ? null : createdAt,
        "description": description == null ? null : description,
        "diff_refs": diffRefs == null ? null : diffRefs.toJson(),
        "discussion_locked": discussionLocked,
        "diverged_commits_count": divergedCommitsCount == null ? null : divergedCommitsCount,
        "downvotes": downvotes == null ? null : downvotes,
        "first_deployed_to_production_at": firstDeployedToProductionAt == null ? null : firstDeployedToProductionAt,
        "force_remove_source_branch": forceRemoveSourceBranch == null ? null : forceRemoveSourceBranch,
        "id": id == null ? null : id,
        "iid": iid == null ? null : iid,
        "labels": labels == null ? null : List<dynamic>.from(labels.map((x) => x)),
        "latest_build_finished_at": latestBuildFinishedAt == null ? null : latestBuildFinishedAt,
        "latest_build_started_at": latestBuildStartedAt == null ? null : latestBuildStartedAt,
        "merge_commit_sha": mergeCommitSha == null ? null : mergeCommitSha,
        "merge_error": mergeError,
        "merge_status": mergeStatus == null ? null : mergeStatusValues.reverse[mergeStatus],
        "merge_when_pipeline_succeeds": mergeWhenPipelineSucceeds == null ? null : mergeWhenPipelineSucceeds,
        "merged_at": mergedAt == null ? null : mergedAt,
        "merged_by": mergedBy == null ? null : mergedBy.toJson(),
        "milestone": milestone == null ? null : milestone.toJson(),
        "pipeline": pipeline == null ? null : pipeline.toJson(),
        "project_id": projectId == null ? null : projectId,
        "rebase_in_progress": rebaseInProgress == null ? null : rebaseInProgress,
        "sha": sha == null ? null : sha,
        "should_remove_source_branch": shouldRemoveSourceBranch == null ? null : shouldRemoveSourceBranch,
        "source_branch": sourceBranch == null ? null : sourceBranch,
        "source_project_id": sourceProjectId == null ? null : sourceProjectId,
        "squash": squash == null ? null : squash,
        "state": state == null ? null : approvalsStateValues.reverse[state],
        "subscribed": subscribed == null ? null : subscribed,
        "target_branch": targetBranch == null ? null : targetBranch,
        "target_project_id": targetProjectId == null ? null : targetProjectId,
        "time_stats": timeStats == null ? null : timeStats.toJson(),
        "title": title == null ? null : title,
        "updated_at": updatedAt == null ? null : updatedAt,
        "upvotes": upvotes == null ? null : upvotes,
        "user": user == null ? null : user.toJson(),
        "user_notes_count": userNotesCount == null ? null : userNotesCount,
        "web_url": webUrl == null ? null : webUrl,
        "work_in_progress": workInProgress == null ? null : workInProgress,
    };
}

class DiffRefs {
    DiffRefs({
        this.baseSha,
        this.headSha,
        this.startSha,
    });

    final String baseSha;
    final String headSha;
    final String startSha;

    factory DiffRefs.fromRawJson(String str) => DiffRefs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DiffRefs.fromJson(Map<String, dynamic> json) => DiffRefs(
        baseSha: json["base_sha"] == null ? null : json["base_sha"],
        headSha: json["head_sha"] == null ? null : json["head_sha"],
        startSha: json["start_sha"] == null ? null : json["start_sha"],
    );

    Map<String, dynamic> toJson() => {
        "base_sha": baseSha == null ? null : baseSha,
        "head_sha": headSha == null ? null : headSha,
        "start_sha": startSha == null ? null : startSha,
    };
}

class Milestone {
    Milestone({
        this.createdAt,
        this.description,
        this.dueDate,
        this.id,
        this.iid,
        this.projectId,
        this.startDate,
        this.state,
        this.title,
        this.updatedAt,
        this.webUrl,
    });

    final String createdAt;
    final String description;
    final String dueDate;
    final double id;
    final double iid;
    final double projectId;
    final String startDate;
    final MilestoneState state;
    final String title;
    final String updatedAt;
    final String webUrl;

    factory Milestone.fromRawJson(String str) => Milestone.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Milestone.fromJson(Map<String, dynamic> json) => Milestone(
        createdAt: json["created_at"] == null ? null : json["created_at"],
        description: json["description"] == null ? null : json["description"],
        dueDate: json["due_date"] == null ? null : json["due_date"],
        id: json["id"] == null ? null : json["id"].toDouble(),
        iid: json["iid"] == null ? null : json["iid"].toDouble(),
        projectId: json["project_id"] == null ? null : json["project_id"].toDouble(),
        startDate: json["start_date"] == null ? null : json["start_date"],
        state: json["state"] == null ? null : milestoneStateValues.map[json["state"]],
        title: json["title"] == null ? null : json["title"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        webUrl: json["web_url"] == null ? null : json["web_url"],
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt,
        "description": description == null ? null : description,
        "due_date": dueDate == null ? null : dueDate,
        "id": id == null ? null : id,
        "iid": iid == null ? null : iid,
        "project_id": projectId == null ? null : projectId,
        "start_date": startDate == null ? null : startDate,
        "state": state == null ? null : milestoneStateValues.reverse[state],
        "title": title == null ? null : title,
        "updated_at": updatedAt == null ? null : updatedAt,
        "web_url": webUrl == null ? null : webUrl,
    };
}

enum MilestoneState { ACTIVE, CLOSED }

final milestoneStateValues = EnumValues({
    "active": MilestoneState.ACTIVE,
    "closed": MilestoneState.CLOSED
});

class Pipeline {
    Pipeline({
        this.id,
        this.ref,
        this.sha,
        this.status,
        this.webUrl,
    });

    final double id;
    final String ref;
    final String sha;
    final PipelineStatus status;
    final String webUrl;

    factory Pipeline.fromRawJson(String str) => Pipeline.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Pipeline.fromJson(Map<String, dynamic> json) => Pipeline(
        id: json["id"] == null ? null : json["id"].toDouble(),
        ref: json["ref"] == null ? null : json["ref"],
        sha: json["sha"] == null ? null : json["sha"],
        status: json["status"] == null ? null : pipelineStatusValues.map[json["status"]],
        webUrl: json["web_url"] == null ? null : json["web_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "ref": ref == null ? null : ref,
        "sha": sha == null ? null : sha,
        "status": status == null ? null : pipelineStatusValues.reverse[status],
        "web_url": webUrl == null ? null : webUrl,
    };
}

enum PipelineStatus { CANCELED, FAILED, PENDING, RUNNING, SKIPPED, SUCCESS }

final pipelineStatusValues = EnumValues({
    "canceled": PipelineStatus.CANCELED,
    "failed": PipelineStatus.FAILED,
    "pending": PipelineStatus.PENDING,
    "running": PipelineStatus.RUNNING,
    "skipped": PipelineStatus.SKIPPED,
    "success": PipelineStatus.SUCCESS
});

class TimeStats {
    TimeStats({
        this.humanTimeEstimate,
        this.humanTotalTimeSpent,
        this.timeEstimate,
        this.totalTimeSpent,
    });

    final double humanTimeEstimate;
    final double humanTotalTimeSpent;
    final double timeEstimate;
    final double totalTimeSpent;

    factory TimeStats.fromRawJson(String str) => TimeStats.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TimeStats.fromJson(Map<String, dynamic> json) => TimeStats(
        humanTimeEstimate: json["human_time_estimate"] == null ? null : json["human_time_estimate"].toDouble(),
        humanTotalTimeSpent: json["human_total_time_spent"] == null ? null : json["human_total_time_spent"].toDouble(),
        timeEstimate: json["time_estimate"] == null ? null : json["time_estimate"].toDouble(),
        totalTimeSpent: json["total_time_spent"] == null ? null : json["total_time_spent"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "human_time_estimate": humanTimeEstimate == null ? null : humanTimeEstimate,
        "human_total_time_spent": humanTotalTimeSpent == null ? null : humanTotalTimeSpent,
        "time_estimate": timeEstimate == null ? null : timeEstimate,
        "total_time_spent": totalTimeSpent == null ? null : totalTimeSpent,
    };
}

/**
 * Access rights for the user who created the MR
 */
class User {
    User({
        this.canMerge,
    });

    final bool canMerge;

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        canMerge: json["can_merge"] == null ? null : json["can_merge"],
    );

    Map<String, dynamic> toJson() => {
        "can_merge": canMerge == null ? null : canMerge,
    };
}

/**
 * Used in the Danger JSON DSL to pass metadata between
 * processes. It will be undefined when used inside the Danger DSL
 */
class Settings {
    Settings({
        this.cliArgs,
        this.github,
    });

    final CliArgs cliArgs;
    final Github github;

    factory Settings.fromRawJson(String str) => Settings.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        cliArgs: json["cliArgs"] == null ? null : CliArgs.fromJson(json["cliArgs"]),
        github: json["github"] == null ? null : Github.fromJson(json["github"]),
    );

    Map<String, dynamic> toJson() => {
        "cliArgs": cliArgs == null ? null : cliArgs.toJson(),
        "github": github == null ? null : github.toJson(),
    };
}

/**
 * This is still a bit of a WIP, but this should
 * pass args/opts from the original CLI call through
 * to the process.
 *
 * Describes the possible arguments that
 * could be used when calling the CLI
 */
class CliArgs {
    CliArgs({
        this.base,
        this.dangerfile,
        this.externalCiProvider,
        this.id,
        this.staging,
        this.textOnly,
        this.verbose,
    });

    final String base;
    final String dangerfile;
    final String externalCiProvider;
    final String id;
    final bool staging;
    final String textOnly;
    final String verbose;

    factory CliArgs.fromRawJson(String str) => CliArgs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CliArgs.fromJson(Map<String, dynamic> json) => CliArgs(
        base: json["base"] == null ? null : json["base"],
        dangerfile: json["dangerfile"] == null ? null : json["dangerfile"],
        externalCiProvider: json["externalCiProvider"] == null ? null : json["externalCiProvider"],
        id: json["id"] == null ? null : json["id"],
        staging: json["staging"] == null ? null : json["staging"],
        textOnly: json["textOnly"] == null ? null : json["textOnly"],
        verbose: json["verbose"] == null ? null : json["verbose"],
    );

    Map<String, dynamic> toJson() => {
        "base": base == null ? null : base,
        "dangerfile": dangerfile == null ? null : dangerfile,
        "externalCiProvider": externalCiProvider == null ? null : externalCiProvider,
        "id": id == null ? null : id,
        "staging": staging == null ? null : staging,
        "textOnly": textOnly == null ? null : textOnly,
        "verbose": verbose == null ? null : verbose,
    };
}

/**
 * Saves each client re-implementing logic to grab these vars
 * for their API clients
 */
class Github {
    Github({
        this.accessToken,
        this.additionalHeaders,
        this.baseUrl,
    });

    final String accessToken;
    final dynamic additionalHeaders;
    final String baseUrl;

    factory Github.fromRawJson(String str) => Github.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Github.fromJson(Map<String, dynamic> json) => Github(
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
        additionalHeaders: json["additionalHeaders"],
        baseUrl: json["baseURL"] == null ? null : json["baseURL"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken == null ? null : accessToken,
        "additionalHeaders": additionalHeaders,
        "baseURL": baseUrl == null ? null : baseUrl,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
