import 'dart:io';

import 'package:danger_core/src/utils/git_diff_parser.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' show join, current;

void main() {
  group('git_diff_parser', () {
    test('should be able to parse add_only correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'diff', 'add_only.diff'));
      final str = fixtureFile.readAsStringSync();
      final data = GitDiffParser.parse(str);
      expect(data.length, 1);
      expect(
          data.first.fromFile, '.github/workflows/verify_compatibility.yaml');
      expect(data.first.toFile, '.github/workflows/verify_compatibility.yaml');
      expect(data.first.diffBlocks.length, 1);
      expect(data.first.diffBlocks.first.addedLines.length, 16);
      expect(data.first.diffBlocks.first.removedLines, isEmpty);
      expect(data.first.diffBlocks.first.unchangedLines.length, 6);
      expect(data.first.diffBlocks.first.fromStart, 38);
      expect(data.first.diffBlocks.first.fromEnd, 43);
      expect(data.first.diffBlocks.first.toStart, 38);
      expect(data.first.diffBlocks.first.toEnd, 59);
    });

    test('should be able to parse remove_only correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'diff', 'remove_only.diff'));
      final str = fixtureFile.readAsStringSync();
      final data = GitDiffParser.parse(str);
      expect(data.length, 1);
      expect(
          data.first.fromFile, '.github/workflows/verify_compatibility.yaml');
      expect(data.first.toFile, '.github/workflows/verify_compatibility.yaml');
      expect(data.first.diffBlocks.length, 1);
      expect(data.first.diffBlocks.first.addedLines, isEmpty);
      expect(data.first.diffBlocks.first.removedLines.length, 15);
      expect(data.first.diffBlocks.first.unchangedLines.length, 3);
      expect(data.first.diffBlocks.first.fromStart, 50);
      expect(data.first.diffBlocks.first.fromEnd, 67);
      expect(data.first.diffBlocks.first.toStart, 66);
      expect(data.first.diffBlocks.first.toEnd, 68);
    });

    test('should be able to parse rename_only correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'diff', 'rename_only.diff'));
      final str = fixtureFile.readAsStringSync();
      final data = GitDiffParser.parse(str);
      expect(data.length, 1);
      expect(data.first.fromFile, 'example/dart2/dangerfile.dart');
      expect(data.first.toFile, 'example/target_nullsafety/dangerfile.dart');
      expect(data.first.diffBlocks.length, 0);
    });

    test('should be able to parse mix correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'diff', 'mix.diff'));
      final str = fixtureFile.readAsStringSync();
      final data = GitDiffParser.parse(str);
      expect(data.length, 1);
      expect(data.first.fromFile, 'example/dart3/pubspec.yaml');
      expect(data.first.toFile, 'example/pre_nullsafety/pubspec.yaml');
      expect(data.first.diffBlocks.length, 1);
      expect(data.first.diffBlocks.first.addedLines.length, 6);
      expect(data.first.diffBlocks.first.removedLines.length, 3);
      expect(data.first.diffBlocks.first.unchangedLines.length, 10);
      expect(data.first.diffBlocks.first.fromStart, 1);
      expect(data.first.diffBlocks.first.fromEnd, 13);
      expect(data.first.diffBlocks.first.toStart, 1);
      expect(data.first.diffBlocks.first.toEnd, 16);
    });

    test('should be able to parse multiple_chunk correctly', () {
      final fixtureFile = File(
          join(current, 'test', 'fixtures', 'diff', 'multiple_chunk.diff'));
      final str = fixtureFile.readAsStringSync();
      final data = GitDiffParser.parse(str);
      expect(data.length, 1);
      expect(data.first.fromFile,
          'packages/danger_plugin_golden_reporter/pubspec.yaml');
      expect(data.first.toFile,
          'packages/danger_plugin_golden_reporter/pubspec.yaml');
      expect(data.first.diffBlocks.length, 2);

      expect(data.first.diffBlocks.first.addedLines.length, 2);
      expect(data.first.diffBlocks.first.removedLines.length, 2);
      expect(data.first.diffBlocks.first.unchangedLines.length, 8);
      expect(data.first.diffBlocks.first.fromStart, 1);
      expect(data.first.diffBlocks.first.fromEnd, 10);
      expect(data.first.diffBlocks.first.toStart, 1);
      expect(data.first.diffBlocks.first.toEnd, 10);

      expect(data.first.diffBlocks[1].addedLines.length, 1);
      expect(data.first.diffBlocks[1].removedLines.length, 1);
      expect(data.first.diffBlocks[1].unchangedLines.length, 6);
      expect(data.first.diffBlocks[1].fromStart, 12);
      expect(data.first.diffBlocks[1].fromEnd, 18);
      expect(data.first.diffBlocks[1].toStart, 12);
      expect(data.first.diffBlocks[1].toEnd, 18);
    });

    test('should be able to parse multiple_files', () {
      final fixtureFile = File(
          join(current, 'test', 'fixtures', 'diff', 'multiple_files.diff'));
      final str = fixtureFile.readAsStringSync();
      final data = GitDiffParser.parse(str);
      expect(data.length, 16);
      expect(
          data.first.fromFile, '.github/workflows/verify_compatibility.yaml');
      expect(data.first.toFile, '.github/workflows/verify_compatibility.yaml');

      expect(data.last.fromFile, 'pubspec.yaml');
      expect(data.last.toFile, 'pubspec.yaml');
    });
  });
}
