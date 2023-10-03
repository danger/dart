class GitDiff {
  late String fromFile;
  late String toFile;
  List<DiffBlock> diffBlocks = [];

  @override
  String toString() {
    String diffString = 'Diff between $fromFile and $toFile:\n';
    for (var block in diffBlocks) {
      diffString += '$block\n';
    }
    return diffString;
  }
}

class DiffBlock {
  late int fromStart;
  late int fromEnd;
  late int toStart;
  late int toEnd;
  List<String> addedLines = [];
  List<String> removedLines = [];
  List<String> unchangedLines = [];

  @override
  String toString() {
    return 'DiffBlock: Lines $fromStart-$fromEnd in fromFile, Lines $toStart-$toEnd in toFile\n'
        'Added Lines: $addedLines\n'
        'Removed Lines: $removedLines\n'
        'Unchanged Lines: $unchangedLines\n';
  }
}

class GitDiffParser {
  List<GitDiff> parse(String diffData) {
    List<GitDiff> diffs = [];
    List<String> lines = diffData.split('\n');
    GitDiff? currentDiff;
    DiffBlock? currentBlock;

    for (var line in lines) {
      if (line.startsWith('diff --git')) {
        currentDiff = GitDiff();
        currentDiff.fromFile = line.split(' ')[2];
        currentDiff.toFile = line.split(' ')[3];
        diffs.add(currentDiff);
        continue;
      }

      if (line.startsWith('@@')) {
        currentBlock = DiffBlock();
        currentDiff?.diffBlocks.add(currentBlock);

        String header = line.substring(3);
        List<String> parts = header.split(' ');
        List<String> fromRange = parts[0].split(',');
        List<String> toRange = parts[1].split(',');

        currentBlock.fromStart = int.parse(fromRange[0].substring(1));
        currentBlock.fromEnd = currentBlock.fromStart +
            (fromRange.length > 1 ? int.parse(fromRange[1]) : 1) -
            1;
        currentBlock.toStart = int.parse(toRange[0].substring(1));
        currentBlock.toEnd = currentBlock.toStart +
            (toRange.length > 1 ? int.parse(toRange[1]) : 1) -
            1;
      }

      if (line.startsWith('+')) {
        currentBlock?.addedLines.add(line.substring(1));
      } else if (line.startsWith('-')) {
        currentBlock?.removedLines.add(line.substring(1));
      } else if (line.startsWith(' ')) {
        currentBlock?.unchangedLines.add(line.substring(1));
      }
    }

    return diffs;
  }
}

void main() {
  String diffData = """
diff --git a/.github/workflows/verify_compatibility.yaml b/.github/workflows/verify_compatibility.yaml
index 507cacb..701dd94 100644
--- a/.github/workflows/verify_compatibility.yaml
+++ b/.github/workflows/verify_compatibility.yaml
@@ -38,6 +38,22 @@ jobs:
         run: dart pub get
         working-directory: packages/danger_dart/
 
+      - name: Install app (non nullsafety) dependencies
+        run: dart pub get
+        working-directory: example/pre_nullsafety/
+
+      - name: Run danger local (non nullsafety)
+        run: danger_dart local
+        working-directory: example/pre_nullsafety/
+
+      - name: Install app dependencies (nullsafety)
+        run: dart pub get
+        working-directory: example/target_nullsafety/
+
+      - name: Run danger local (nullsafety)
+        run: danger_dart local
+        working-directory: example/target_nullsafety/
+
       - name: Install plugin dependencies
         run: dart pub get
         working-directory: example/with_plugin/danger_plugin_example/
@@ -50,18 +66,3 @@ jobs:
         run: danger_dart local
         working-directory: example/with_plugin/
 
-      - name: Install app dependencies (Dart 2)
-        run: dart pub get
-        working-directory: example/dart2/
-
-      - name: Run danger local (Dart 2)
-        run: danger_dart local
-        working-directory: example/dart2/
-
-      - name: Install app dependencies (Dart 3)
-        run: dart pub get
-        working-directory: example/dart3/
-
-      - name: Run danger local (Dart 3)
-        run: danger_dart local
-        working-directory: example/dart3/
diff --git a/example/dart3/dangerfile.dart b/example/pre_nullsafety/dangerfile.dart
similarity index 61%
rename from example/dart3/dangerfile.dart
rename to example/pre_nullsafety/dangerfile.dart
index fb4ec51..5cf13f1 100644
--- a/example/dart3/dangerfile.dart
+++ b/example/pre_nullsafety/dangerfile.dart
@@ -1,5 +1,5 @@
 import 'package:danger_core/danger_core.dart';
 
 void main() {
-  message('hello from Dart 3');
+  message('hello from pre-nullsafety');
 }
diff --git a/example/dart3/pubspec.yaml b/example/pre_nullsafety/pubspec.yaml
similarity index 64%
rename from example/dart3/pubspec.yaml
rename to example/pre_nullsafety/pubspec.yaml
index 8aca558..9c93b1b 100644
--- a/example/dart3/pubspec.yaml
+++ b/example/pre_nullsafety/pubspec.yaml
@@ -1,13 +1,16 @@
-name: danger_test_target_null_safety
+name: danger_test_pre_nullsafety
 description: A simple command-line application.
 # version: 1.0.0
 # homepage: https://www.example.com
 
 environment:
-  sdk: ">=3.0.0 <4.0.0"
+  sdk: ">=2.7.0 <3.0.0"
+
+dependencies:
+  json_annotation: ^3.0.0
 
 dev_dependencies:
   lints: ^1.0.1
-  path: ^1.8.3
+  path: ^1.8.0
   danger_core:
     path: ../../packages/danger_core
diff --git a/example/dart2/dangerfile.dart b/example/target_nullsafety/dangerfile.dart
similarity index 100%
rename from example/dart2/dangerfile.dart
rename to example/target_nullsafety/dangerfile.dart
diff --git a/example/dart2/pubspec.yaml b/example/target_nullsafety/pubspec.yaml
similarity index 75%
rename from example/dart2/pubspec.yaml
rename to example/target_nullsafety/pubspec.yaml
index 58e68a9..2971b33 100644
--- a/example/dart2/pubspec.yaml
+++ b/example/target_nullsafety/pubspec.yaml
@@ -1,4 +1,4 @@
-name: dart2
+name: danger_test_target_null_safety
 description: A simple command-line application.
 # version: 1.0.0
 # homepage: https://www.example.com
@@ -6,6 +6,9 @@ description: A simple command-line application.
 environment:
   sdk: ">=2.12.0 <3.0.0"
 
+dependencies:
+  json_annotation: ^3.0.0
+
 dev_dependencies:
   lints: ^1.0.1
   path: ^1.8.0
diff --git a/example/with_plugin/pubspec.yaml b/example/with_plugin/pubspec.yaml
index 7980d4b..8fb2b3d 100644
--- a/example/with_plugin/pubspec.yaml
+++ b/example/with_plugin/pubspec.yaml
@@ -6,6 +6,9 @@ description: A simple command-line application.
 environment:
   sdk: ">=2.12.0 <3.0.0"
 
+dependencies:
+  json_annotation: ^3.0.0
+
 dev_dependencies:
   lints: ^1.0.1
   path: ^1.8.0
diff --git a/packages/danger_core/CHANGELOG.md b/packages/danger_core/CHANGELOG.md
index 2470454..6a86da3 100644
--- a/packages/danger_core/CHANGELOG.md
+++ b/packages/danger_core/CHANGELOG.md
@@ -1,7 +1,3 @@
-## 2.0.0
-
-- Migrate to Dart 3
-
 ## 1.0.1
 
 - Fixed GitLabDSL
diff --git a/packages/danger_core/pubspec.yaml b/packages/danger_core/pubspec.yaml
index 4ba9480..c487bd1 100644
--- a/packages/danger_core/pubspec.yaml
+++ b/packages/danger_core/pubspec.yaml
@@ -1,17 +1,17 @@
 name: danger_core
 description: Core of Danger Dart, tool to help you reviewing the code.
-version: 2.0.0
+version: 1.0.1
 homepage: https://github.com/danger/dart
 
 environment:
-  sdk: ">=3.0.0 <4.0.0"
+  sdk: ">=2.12.0 <3.0.0"
 
 dev_dependencies:
-  lints: ^2.1.1
-  json_annotation: ^4.8.1
-  test: ^1.24.7
-  json_serializable: ^6.7.1
-  build_runner: ^2.4.6
-  mockito: ^5.4.2
+  lints: ^1.0.1
+  json_annotation: ^4.4.0
+  test: ^1.20.2
+  json_serializable: ^6.1.5
+  build_runner: ^2.1.8
+  mockito: ^5.1.0
   isolate: ^2.1.1
-  path: ^1.8.3
+  path: ^1.8.0
diff --git a/packages/danger_dart/CHANGELOG.md b/packages/danger_dart/CHANGELOG.md
index 10911ab..33d4244 100644
--- a/packages/danger_dart/CHANGELOG.md
+++ b/packages/danger_dart/CHANGELOG.md
@@ -1,7 +1,3 @@
-## 2.0.0
-
-- Migrate to Dart 3
-
 ## 1.0.1
 
 - Add argument `--failOnErrors` on every command
diff --git a/packages/danger_dart/lib/danger_util.dart b/packages/danger_dart/lib/danger_util.dart
index a6f1981..6332c40 100644
--- a/packages/danger_dart/lib/danger_util.dart
+++ b/packages/danger_dart/lib/danger_util.dart
@@ -126,6 +126,7 @@ class DangerUtil {
     }
     tempFile.createSync();
     tempFile.writeAsStringSync('''
+// @dart=2.7
 import 'dart:developer';
 
 import 'package:danger_core/danger_core.dart';
diff --git a/packages/danger_dart/pubspec.yaml b/packages/danger_dart/pubspec.yaml
index d1f5e3f..254c34d 100644
--- a/packages/danger_dart/pubspec.yaml
+++ b/packages/danger_dart/pubspec.yaml
@@ -7,20 +7,20 @@ executables:
   danger_dart:
 
 environment:
-  sdk: ">=3.0.0 <4.0.0"
+  sdk: ">=2.12.0 <3.0.0"
 
 dependencies:
-  meta: ^1.10.0
-  args: ^2.4.2
-  process_run: ^0.13.1
-  fimber: ^0.7.0
-  path: ^1.8.3
+  meta: ^1.7.0
+  args: ^2.3.0
+  process_run: ^0.12.3+2
+  fimber: ^0.6.5
+  path: ^1.8.1
   # danger_core: ">= 1.0.0 < 2.0.0"
   danger_core:
     path: ../danger_core
 
 dev_dependencies:
-  lints: ^2.1.1
-  test: ^1.24.7
-  mockito: ^5.4.2
-  build_runner: ^2.4.6
+  lints: ^1.0.1
+  test: ^1.20.2
+  mockito: ^5.1.0
+  build_runner: ^2.1.8
diff --git a/packages/danger_plugin_dart_test/CHANGELOG.md b/packages/danger_plugin_dart_test/CHANGELOG.md
index 40d5f85..e2f6109 100644
--- a/packages/danger_plugin_dart_test/CHANGELOG.md
+++ b/packages/danger_plugin_dart_test/CHANGELOG.md
@@ -1,7 +1,3 @@
-## 2.0.0
-
-- Migrate to Dart 3
-
 ## 1.0.0
 
 - Supports Null Safety
diff --git a/packages/danger_plugin_dart_test/pubspec.yaml b/packages/danger_plugin_dart_test/pubspec.yaml
index 4721fff..9239b79 100644
--- a/packages/danger_plugin_dart_test/pubspec.yaml
+++ b/packages/danger_plugin_dart_test/pubspec.yaml
@@ -1,17 +1,17 @@
 name: danger_plugin_dart_test
 description: A Danger Dart plugin to process test result.
-version: 2.0.0
+version: 1.0.0
 homepage: https://github.com/danger/dart
 
 environment:
-  sdk: ">=3.0.0 <4.0.0"
+  sdk: ">=2.12.0 <3.0.0"
 
 dependencies:
-  path: ^1.8.3
+  path: ">= 1.8.0 < 2.0.0"
   # danger_core: ">= 1.0.0 < 2.0.0"
   danger_core:
     path: ../danger_core
 
 dev_dependencies:
-  lints: ^2.1.1
-  test: ^1.24.7
+  lints: ^1.0.1
+  test: ^1.20.2
diff --git a/packages/danger_plugin_golden_reporter/CHANGELOG.md b/packages/danger_plugin_golden_reporter/CHANGELOG.md
index fd53903..6fdf70e 100644
--- a/packages/danger_plugin_golden_reporter/CHANGELOG.md
+++ b/packages/danger_plugin_golden_reporter/CHANGELOG.md
@@ -1,7 +1,3 @@
-## 2.0.0
-
-- Migrate to Dart 3
-
 ## 1.0.0
 
 - Supports Null Safety
diff --git a/packages/danger_plugin_golden_reporter/pubspec.yaml b/packages/danger_plugin_golden_reporter/pubspec.yaml
index eca2e35..a0d38bd 100644
--- a/packages/danger_plugin_golden_reporter/pubspec.yaml
+++ b/packages/danger_plugin_golden_reporter/pubspec.yaml
@@ -1,10 +1,10 @@
 name: danger_plugin_golden_reporter
 description: A Danger Dart plugin to display golden images on pull requests.
-version: 2.0.0
+version: 1.0.0
 homepage: https://github.com/danger/dart
 
 environment:
-  sdk: ">=3.0.0 <4.0.0"
+  sdk: ">=2.12.0 <3.0.0"
 
 dependencies:
   # danger_core: ">= 1.0.0 < 2.0.0"
@@ -12,7 +12,7 @@ dependencies:
     path: ../danger_core
 
 dev_dependencies:
-  lints: ^2.1.1
+  lints: ^1.0.1
   test: ^1.20.2
   mockito: ^5.1.0
   build_runner: ^2.1.8
diff --git a/pubspec.yaml b/pubspec.yaml
index c7730a5..6a91c44 100644
--- a/pubspec.yaml
+++ b/pubspec.yaml
@@ -4,11 +4,11 @@ description: A simple command-line application.
 # homepage: https://www.example.com
 
 environment:
-  sdk: ">=3.0.0 <4.0.0"
+  sdk: ">=2.12.0 <3.0.0"
 
 dev_dependencies:
-  lints: ^2.1.1
-  path: ^1.8.3
+  lints: ^1.0.1
+  path: ^1.8.0
   danger_core:
     path: packages/danger_core
   danger_plugin_dart_test:
""";

  GitDiffParser parser = GitDiffParser();
  List<GitDiff> diffs = parser.parse(diffData);

  for (var diff in diffs) {
    print(diff);
  }
}
