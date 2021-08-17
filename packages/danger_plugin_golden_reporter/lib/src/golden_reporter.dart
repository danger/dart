abstract class GoldenReporter {
  String reportForModifiedFile(String filePath);
  String reportForCreatedFile(String filePath);

  void reportAllModifiedFiles(List<String> messages);
  void reportAllCreatedFiles(List<String> messages);
}
