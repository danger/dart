import 'package:danger_core/danger_core.dart';

void main() {
  // No Rule for now
  message('PR Title is ${danger.github.pr.title}');
  message('PR number is ${danger.github.pr.number}');

  // warn('Try inline message',
  //     file: 'packages/danger_core/lib/src/mock_json_annotation.dart', line: 14);
  // warn('hello1 ${danger.bitbucketCloud?.pr?.title}');
  // fail('12341 PRID:${danger.bitbucketCloud?.pr?.id}');
}
