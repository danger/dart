import 'dart:convert';
import 'dart:io';

import 'package:danger_core/src/models/bitbucket_cloud.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' show join, current;

void main() {
  group('bitbucket_cloud_dsl', () {
    test('should be able to parse correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'bbc-dsl-input.json'));
      final str = fixtureFile.readAsStringSync();
      final json = jsonDecode(str);
      final bbcJSON = json['danger']['bitbucket_cloud'];

      final result = BitBucketCloudJSONDSL.fromJson(bbcJSON);

      expect(
          result.pr.title, equals("Custom suffix for tags and POM's version"));
      expect(result.pr.id, equals(80));
    });
  });
}
