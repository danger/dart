# Danger.dart

We support Github and Bitbucket Cloud.

**Still under development**

### Using Danger Dart

- Install Danger JS

```bash
$ npm install -g danger
```

- Adding `danger_core` to `dev_dependencies`

```yaml
dev_dependencies:
  danger_core:
```

- Create `dangerfile.dart`

```dart
// @dart=2.10
import 'package:danger_core/danger_core.dart';

void main(List<String> args, dynamic data) {
  Danger.setup(data);

  if (danger.github.pr.title.contains('WIP')) {
    warn('PR is considered WIP');
  }
}
```

### Notes

For GithubAction, you need to set GITHUB_TOKEN as environment [example](https://github.com/danger/danger.dart/blob/master/.github/workflows/pr_flow.yaml)

```yaml
- name: Run danger ci
  run: danger_dart ci
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### Commands

- `danger_dart ci` - Use this on CI
- `danger_dart pr https://github.com/Moya/Harvey/pull/23` - Use this to build your Dangerfile
- `danger_dart local` - Use this to run danger against your local changes from master

### Debugging `dangerfile.dart`

1. Adding `--debug` flag to any command you want to run.
2. Waiting for text `Observatory listening on http://127.0.0.1:8181/xxxxxxx=/ `
3. Attach process on your editor.
   - For `VSCode`, go to `View > Command Palette` and choose `>Debug: Attach to Dart Process`, and put `http://127.0.0.1:8181/xxxxxxx=/`.
   - For `AndroidStudio` and `Intellij` .....
4. Debugger will start with pausing at `danger_dart.dart`, you can skip it, after that it will stop at your `dangerfile`

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

For more information, see the example https://github.com/danger/danger.dart/tree/master/packages/danger_plugin_dart_test
