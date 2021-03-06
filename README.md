# Danger.dart

Supports GitHub, GitLab, and Bitbucket Cloud.

### Getting Started

https://medium.com/p/8c61e402cd4e

### Using Danger Dart

- Install Danger JS

```bash
$ npm install -g danger
```

- Activate Danger Dart

```bash
$ pub global activate danger_dart
```

- Adding `danger_core` to `dev_dependencies`

```yaml
dev_dependencies:
  danger_core:
```

- Create `dangerfile.dart`

```dart
import 'package:danger_core/danger_core.dart';

void main() {
  if (danger.github.pr.title.contains('WIP')) {
    warn('PR is considered WIP');
  }
}
```

### Preparing Environment Variables

For GitHub, you need `DANGER_GITHUB_API_TOKEN` in your environment variable, can be created [here](https://github.com/settings/tokens/new).

For Bitbucket Cloud, please refer to https://danger.systems/js/usage/bitbucket_cloud.html

For GitLab, please refer to https://danger.systems/js/usage/gitlab.html


### Commands

- `danger_dart ci` - Use this on CI
- `danger_dart pr https://github.com/Moya/Harvey/pull/23` - Use this to build your Dangerfile
- `danger_dart local` - Use this to run danger against your local changes from master

### Notes

For GithubAction, you need to set GITHUB_TOKEN as environment [example](https://github.com/danger/dart/blob/master/.github/workflows/pr_flow.yaml)

```yaml
- name: Run danger ci
  run: danger_dart ci
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### Debugging `dangerfile.dart`

Check the [Debugging doc](https://github.com/danger/dart/blob/master/docs/DEBUGGING.MD).

### Development

We can use `pub global activate` to enable command `danger_dart`.

```bash
$ pub global activate --source path packages/danger_dart/
```

Or using `dart` to run directly.

```bash
$ dart packages/danger_dart/bin/danger_dart.dart ci
$ dart packages/danger_dart/bin/danger_dart.dart pr https://github.com/Moya/Harvey/pull/23
$ dart packages/danger_dart/bin/danger_dart.dart local
```

### Plugins

You can create your own plugin using command

```bash
$ dart create -t package-simple <plugin_name>
```

In `pubspec.yaml` put `danger_core` in `dependences`

```yaml
dependencies:
  danger_core:
```

For more information, see the example https://github.com/danger/dart/tree/master/packages/danger_plugin_dart_test
