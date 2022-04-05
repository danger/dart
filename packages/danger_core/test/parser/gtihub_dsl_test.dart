import 'dart:convert';
import 'dart:io';

import 'package:danger_core/src/models/github_dsl.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' show join, current;

void main() {
  group('github_dsl', () {
    test('should be able to parse correctly', () {
      final fixtureFile =
          File(join(current, 'test', 'fixtures', 'github-dsl.json'));
      final str = fixtureFile.readAsStringSync();
      final json = jsonDecode(str);
      final githubJSON = json['danger']['github'];

      final result = GitHubDSL.fromJson(githubJSON);

      expect(result.pr.title, equals('Xcode updates'));
      expect(result.pr.number, equals(609));
    });

    test(
        'should be able to parse github with some nulls atrribute dsl correctly',
        () {
      final fixtureFile = File(join(current, 'test', 'fixtures',
          'github-with-some-nulls-attribute.json'));
      final str = fixtureFile.readAsStringSync();
      final json = jsonDecode(str);
      final githubJSON = json['danger']['github'];

      final result = GitHubDSL.fromJson(githubJSON);

      expect(result.pr.title, equals('Xcode updates'));
      expect(result.pr.number, equals(609));
    });
  });
}
