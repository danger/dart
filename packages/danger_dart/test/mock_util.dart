import 'dart:io';

import 'package:danger_dart/danger_util.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DangerUtil,
  Stdin,
  Stdout,
])
class MockUtil {}
