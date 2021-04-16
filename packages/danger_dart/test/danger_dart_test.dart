import 'package:test/test.dart';

void main() {
  group('danger_dart_test', () {
    test('This should be fail', () {
      expect(true, equals(false));
    });
  });
}
