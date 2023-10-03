class GitDiff {
  final String fromFile;
  final String toFile;
  final List<DiffBlock> diffBlocks;

  GitDiff(
      {required this.fromFile, required this.toFile, required this.diffBlocks});
}

class DiffBlock {
  final int fromStart;
  final int fromEnd;
  final int toStart;
  final int toEnd;

  final List<String> addedLines;
  final List<String> removedLines;
  final List<String> unchangedLines;

  DiffBlock(
      {required this.fromStart,
      required this.fromEnd,
      required this.toStart,
      required this.toEnd,
      required this.addedLines,
      required this.removedLines,
      required this.unchangedLines});
}
