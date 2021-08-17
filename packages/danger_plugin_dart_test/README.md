# Danger Plugin: Dart Test

[![Pub version](https://img.shields.io/pub/v/danger_plugin_dart_test.svg)](https://pub.dev/packages/danger_plugin_dart_test)

This plugin will parse the test results, and notify the failure cases.

## Usage

First, you need to prepare test result in json format.
You may either:

```bash
$ dart test --reporter json > your_test_results.json
$ flutter test --reporter json > your_test_results.json
```

Adding this plugin to `pubspec.yaml`

```yaml
dev_dependencies:
  danger_core:
  danger_plugin_dart_test:
```

In `dangerfile.dart`, you need to import this, and call `DangerPluginDartTest.processFile` with test result file.

```dart
// @dart=2.10
import 'dart:io';

import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_dart_test/danger_plugin_dart_test.dart';

void main() {
  final testResultFile = File('your_test_results.json');
  DangerPluginDartTest.processFile(testResultFile);
}
```
