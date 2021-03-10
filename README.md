## Under Active Development

Hello World!
Currently, we only supported bitbucket cloud.

### Requirements

- Install Danger JS

```bash
$ npm install -g danger
```

```dart
import 'package:danger_core/danger_core.dart';

void main() {
  warn('hello1 ${danger.bitbucketCloud?.pr?.title}');
  fail('12341 PRID:${danger.bitbucketCloud?.pr?.id}');
}
```

### Commands

- `danger_dart ci` - Use this on CI
- `danger_dart pr https://github.com/Moya/Harvey/pull/23` - Use this to build your Dangerfile
- `danger_dart local` - Use this to run danger against your local changes from master

### Note

Installing by

```bash
$ pub global activate --source path packages/danger_dart/
```

Or use `dart packages/danger_runner/bin/danger_dart.dart`

**Before Publish**
We need to call `dart scripts/pre_publish.dart` to remove dependency before publish, otherwise there will be version conflict on user side.
