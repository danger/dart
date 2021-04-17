# Danger Core

This is Core of Danger Dart

### Installation

Adding `danger_core` to `dev_dependencies` in `pubspec.yaml`

```yaml
dev_dependencies:
  danger_core:
```

For more information, please refer to https://github.com/danger/danger.dart

### Publishing Note

Before publishing, need to replace.

```dart
import 'package:json_annotation/json_annotation.dart'
    if (dart.library.isolate) 'package:danger_core/src/mock_json_annotation.dart';
```

with

```dart
import 'package:danger_core/src/mock_json_annotation.dart';
```
