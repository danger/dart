import 'package:danger_core/danger_core.dart';

void main(List<String> args, dynamic data) {
  Danger.setup(data);

  if (danger.github?.pr?.title?.contains('WIP') == true) {
    warn('PR is considered WIP');
  }
}
