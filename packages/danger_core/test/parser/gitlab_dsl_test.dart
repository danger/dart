import 'dart:convert';
import 'dart:io';

import 'package:danger_core/src/models/gitlab_dsl.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' show join, current;

void main() {
  group('github_dsl', () {
    test('should be able to parse correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'gitlab-dsl-input.json'));
      final str = fixtureFile.readAsStringSync();
      final json = jsonDecode(str);
      final gitLabJSON = json['danger']['gitlab'];

      final result = GitLabDSL.fromJson(gitLabJSON);

      expect(result.mergeRequest.title,
          equals('Update getting_started.html.slim'));
      expect(result.mergeRequest.id, equals(27469633));
      expect(result.mergeRequest.iid, equals(182));
    });
  });
}
