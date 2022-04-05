import 'package:danger_core/danger_core.dart';
import 'package:danger_core/src/utils/danger_isolate_sender_mock.dart';
import 'package:danger_plugin_golden_reporter/danger_plugin_golden_reporter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'mock_utils.mocks.dart';

void main() {
  late DangerIsolateSenderMock dangerIsolateSenderMock;
  late MockDangerJSONDSL mockDangerJSONDSL;
  late MockGitJSONDSL mockGitJSONDSL;
  late MockGoldenReporter mockReporter;

  setUp(() {
    mockReporter = MockGoldenReporter();
    mockDangerJSONDSL = MockDangerJSONDSL();
    mockGitJSONDSL = MockGitJSONDSL();

    dangerIsolateSenderMock = Danger.setupWithMock();
    dangerIsolateSenderMock.dangerJSONDSL = mockDangerJSONDSL;

    when(mockDangerJSONDSL.git).thenReturn(mockGitJSONDSL);
    when(mockGitJSONDSL.createdFiles).thenReturn([]);
    when(mockGitJSONDSL.modifiedFiles).thenReturn([]);

    when(mockReporter.reportForCreatedFile(any))
        .thenReturn("reportForCreatedFile");
    when(mockReporter.reportForModifiedFile(any))
        .thenReturn("reportForModifiedFile");
  });

  group('path', () {
    group('createdFiles', () {
      test('should filter out files that is not png', () {
        when(mockGitJSONDSL.createdFiles)
            .thenReturn(['test/goldens/foo.png', 'test/goldens/bar.text']);
        DangerPluginGoldenReporter.report('test/goldens',
            reporter: mockReporter);

        final result = verify(mockReporter.reportForCreatedFile(captureAny));
        result.called(1);

        expect(result.captured.single, 'test/goldens/foo.png');
      });

      test('should filter out files that is in different path', () {
        when(mockGitJSONDSL.createdFiles)
            .thenReturn(['test/goldens/foo.png', 'test/gold2ens/bar.png']);
        DangerPluginGoldenReporter.report('test/goldens',
            reporter: mockReporter);

        final result = verify(mockReporter.reportForCreatedFile(captureAny));
        result.called(1);

        expect(result.captured.single, 'test/goldens/foo.png');
      });
    });
    group('modifiedFiles', () {
      test('should filter out files that is not png', () {
        when(mockGitJSONDSL.modifiedFiles)
            .thenReturn(['test/goldens/foo.png', 'test/goldens/bar.text']);
        DangerPluginGoldenReporter.report('test/goldens',
            reporter: mockReporter);

        final result = verify(mockReporter.reportForModifiedFile(captureAny));
        result.called(1);

        expect(result.captured.single, 'test/goldens/foo.png');
      });

      test('should filter out files that is in different path', () {
        when(mockGitJSONDSL.modifiedFiles)
            .thenReturn(['test/goldens/foo.png', 'test/gold2ens/bar.png']);
        DangerPluginGoldenReporter.report('test/goldens',
            reporter: mockReporter);

        final result = verify(mockReporter.reportForModifiedFile(captureAny));
        result.called(1);

        expect(result.captured.single, 'test/goldens/foo.png');
      });
    });
  });

  group('createdFiles', () {
    test(
        'should not call reportForCreatedFile, and reportAllCreatedFiles when there is no created file',
        () {
      DangerPluginGoldenReporter.report('.', reporter: mockReporter);

      verifyNever(mockReporter.reportForCreatedFile(any));
      verifyNever(mockReporter.reportAllCreatedFiles(any));
    });

    test('should call reportForCreatedFile when there is created file', () {
      when(mockGitJSONDSL.createdFiles)
          .thenReturn(['test/goldens/foo.png', 'test/goldens/bar.png']);
      when(mockReporter.reportForCreatedFile(any)).thenReturn('MOCK_REPORT');

      DangerPluginGoldenReporter.report('test/goldens', reporter: mockReporter);

      verify(mockReporter.reportForCreatedFile('test/goldens/foo.png'))
          .called(1);
      verify(mockReporter.reportForCreatedFile('test/goldens/bar.png'))
          .called(1);
      verify(
          mockReporter.reportAllCreatedFiles(['MOCK_REPORT', 'MOCK_REPORT']));
    });
  });

  group('modifiedFiles', () {
    test(
        'should not call reportForModifiedFile, and reportAllModifiedFiles when there is no created file',
        () {
      DangerPluginGoldenReporter.report('.', reporter: mockReporter);

      verifyNever(mockReporter.reportForModifiedFile(any));
      verifyNever(mockReporter.reportAllModifiedFiles(any));
    });

    test('should call reportForModifiedFile when there is created file', () {
      when(mockGitJSONDSL.modifiedFiles)
          .thenReturn(['test/goldens/foo.png', 'test/goldens/bar.png']);
      when(mockReporter.reportForModifiedFile(any)).thenReturn('MOCK_REPORT');

      DangerPluginGoldenReporter.report('test/goldens', reporter: mockReporter);

      verify(mockReporter.reportForModifiedFile('test/goldens/foo.png'))
          .called(1);
      verify(mockReporter.reportForModifiedFile('test/goldens/bar.png'))
          .called(1);
      verify(
          mockReporter.reportAllModifiedFiles(['MOCK_REPORT', 'MOCK_REPORT']));
    });
  });
}
