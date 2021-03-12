import 'package:danger_core/danger_core.dart';

void main() {
  if (danger.github.pr.title.contains('WIP')) {
    warn('PR is considered WIP');
  }
}
