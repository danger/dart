import 'package:danger_core/danger_core.dart';

void main() {
  warn('hello1 ${danger.bitbucketCloud?.pr?.title}');
  fail('12341 PRID:${danger.bitbucketCloud?.pr?.id}');
}
