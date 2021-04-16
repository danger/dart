import 'package:danger_core/danger_core.dart';
import 'package:uuid/uuid.dart';

void dangerRandomGenerateCode() {
  final uuid = Uuid();
  message('Hello From Plugin [${uuid.v4()}]');
}
