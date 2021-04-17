import 'dart:io';

import 'package:args/args.dart';
import 'package:args/src/arg_results.dart';
import 'package:danger_core/danger_core.dart';
import 'package:danger_dart/danger_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:path/path.dart' show current, join;

ArgResults _createArgsResult(Map<String, dynamic> args) {
  final argParser = ArgParser();
  argParser.addOption('dangerfile');
  argParser.addOption('danger-js-path');
  return newArgResults(argParser, args, null, null, [], []);
}

void main() {
  DangerUtil dangerUtil;

  setUp(() {
    dangerUtil = DangerUtil();
  });

  group('getDangerJSMetaData', () {
    test('should find danger-js from args danger-js-path (relative path)',
        () async {
      final metaData = await dangerUtil.getDangerJSMetaData(_createArgsResult(
          {'danger-js-path': 'test/fixtures/mock_dangerjs.sh'}));

      expect(metaData.executable, equals('test/fixtures/mock_dangerjs.sh'));
    });

    test('should find danger-js from args danger-js-path (absolute path)',
        () async {
      final metaData = await dangerUtil.getDangerJSMetaData(_createArgsResult({
        'danger-js-path': join(current, 'test', 'fixtures', 'mock_dangerjs.sh')
      }));

      expect(metaData.executable,
          equals(join(current, 'test', 'fixtures', 'mock_dangerjs.sh')));
    });

    test(
        'should throw an error when cannot find danger-js from args danger-js-path',
        () {
      expectLater(
          dangerUtil.getDangerJSMetaData(_createArgsResult(
              {'danger-js-path': 'this_is_not_danger_js.sh'})),
          throwsA(
              equals('please provide the corrent path for --danger-js-path')));
    });

    test('should find default danger-js from env', () {
      // TODO: Cannot find the way to override env (maybe need to decouple whichSync)
      // Skip this for now.
    }, skip: true);

    test('should throw an error when found danger ruby instead of danger-js',
        () {
      expectLater(
          dangerUtil.getDangerJSMetaData(_createArgsResult(
              {'danger-js-path': 'test/fixtures/mock_dangeruby.sh'})),
          throwsA(equals(
              'Your danger is not JS version, You need to uninstall danger ruby, or using --danger-js-path instead')));
    });
  });

  group('getDangerFile', () {
    test('should be able to get dangerfile from args (relative path)', () {
      final result = dangerUtil.getDangerFile(
          _createArgsResult({'dangerfile': 'bin/danger_dart.dart'}));
      expect(result, 'bin/danger_dart.dart');
    });
    test('should be able to get dangerfile from args (absolute path)', () {
      final result = dangerUtil.getDangerFile(_createArgsResult(
          {'dangerfile': join(current, 'bin', 'danger_dart.dart')}));
      expect(result, join(current, 'bin', 'danger_dart.dart'));
    });
    test('should throw error when cannot find dangerfile', () {
      expectLater(
          () => dangerUtil.getDangerFile(
              _createArgsResult({'dangerfile': 'not_a_dangerfile.dart'})),
          throwsA(equals('dangerfile not found')));
    });
  });
}
