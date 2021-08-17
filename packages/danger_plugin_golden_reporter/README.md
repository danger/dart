# Danger Plugin: Golden Reporter

[![Pub version](https://img.shields.io/pub/v/danger_plugin_golden_reporter.svg)](https://pub.dev/packages/danger_plugin_golden_reporter)

This plugin will report created and modified golden results.

## Usage

Adding this plugin to `pubspec.yaml`

```yaml
dev_dependencies:
  danger_core:
  danger_plugin_golden_reporter:
```

In `dangerfile.dart`, you need to import this, and call `DangerPluginGoldenReporter.report` with given golden result path.

```dart
// @dart=2.10
import 'dart:io';

import 'package:danger_core/danger_core.dart';
import 'package:danger_plugin_golden_reporter/danger_plugin_golden_reporter.dart';

void main() {
  DangerPluginGoldenReporter.report('test/goldens');
}
```
