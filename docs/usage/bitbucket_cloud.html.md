---
title: Danger + BitBucket Cloud
subtitle: Dangerous bits
layout: guide_dart
order: 4
blurb: An overview of using Danger with BitBucket Cloud, and some examples
---

To use Danger Dart with BitBucket Cloud: you'll need to create a new account for Danger to use, then set the following
environment variables on your CI:

You could use either username with password or OAuth key with OAuth secret.

For username and password, you need to set.

- `DANGER_BITBUCKETCLOUD_USERNAME` = The username for the account used to comment, as shown on
  https://bitbucket.org/account/
- `DANGER_BITBUCKETCLOUD_PASSWORD` = The password for the account used to comment, you could use
  [App passwords](https://confluence.atlassian.com/bitbucket/app-passwords-828781300.html#Apppasswords-Aboutapppasswords)
  with Read Pull Requests and Read Account Permissions.

For OAuth key and OAuth secret, you can get them from.

- Open [BitBucket Cloud Website](https://bitbucket.org)
- Navigate to Settings > OAuth > Add consumer
- Put `https://bitbucket.org/site/oauth2/authorize` for `Callback URL`, and enable Read Pull requests, and Read Account
  Permission.

- `DANGER_BITBUCKETCLOUD_OAUTH_KEY` = The consumer key for the account used to comment, as show as `Key` on the website.
- `DANGER_BITBUCKETCLOUD_OAUTH_SECRET` = The consumer secret for the account used to comment, as show as `Secret` on the
  website.

You need to put `danger_core` into `dev_dependencies` inside `pubspec.yaml`

```yaml
dev_dependencies:
  danger_core:
```

Then in your Dangerfiles you will have a fully fleshed out `danger.bitbucket_cloud` object to work with. For example:

```dart
import 'package:danger_core/danger_core.dart';

void main() {
  if (danger.bitbucketCloud.pr.title.contains('WIP')) {
    warn('PR is considered WIP');
  }
}
```

The DSL is expansive, you can see all the details inside the [Danger Dart Reference][ref], but the TLDR is:

```dart
danger.bitbucketCloud.

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
```
