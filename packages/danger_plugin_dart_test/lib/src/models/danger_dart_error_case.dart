class DangerDartErrorCase {
  final String fileName;
  final int lineNo;
  final String testName;
  final String message;

  DangerDartErrorCase(
      {required this.fileName,
      required this.lineNo,
      required this.testName,
      required this.message});
}
