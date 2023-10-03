import 'package:danger_core/src/models/git_diff.dart';

class GitDiffParser {
  GitDiffParser._();

  static List<GitDiff> parse(String diffData) {
    List<GitDiff> diffs = [];
    List<String> lines = diffData.split('\n');
    GitDiff? currentDiff;
    DiffBlock? currentBlock;

    for (var line in lines) {
      if (line.startsWith('diff --git')) {
        final fromFile = line.split(' ')[2].substring(2);
        final toFile = line.split(' ')[3].substring(2);
        currentDiff =
            GitDiff(fromFile: fromFile, toFile: toFile, diffBlocks: []);
        diffs.add(currentDiff);
        continue;
      }

      if (line.startsWith('@@')) {
        String header = line.substring(3);
        List<String> parts = header.split(' ');
        List<String> fromRange = parts[0].split(',');
        List<String> toRange = parts[1].split(',');

        final fromStart = int.parse(fromRange[0].substring(1));
        final fromEnd = fromStart +
            (fromRange.length > 1 ? int.parse(fromRange[1]) : 1) -
            1;
        final toStart = int.parse(toRange[0].substring(1));
        final toEnd =
            toStart + (toRange.length > 1 ? int.parse(toRange[1]) : 1) - 1;

        currentBlock = DiffBlock(
            fromStart: fromStart,
            fromEnd: fromEnd,
            toStart: toStart,
            toEnd: toEnd,
            addedLines: [],
            removedLines: [],
            unchangedLines: []);
        currentDiff?.diffBlocks.add(currentBlock);
      }

      if (line.startsWith('+')) {
        currentBlock?.addedLines.add(line.substring(1));
      } else if (line.startsWith('-')) {
        currentBlock?.removedLines.add(line.substring(1));
      } else if (line.startsWith(' ')) {
        currentBlock?.unchangedLines.add(line.substring(1));
      }
    }

    return diffs;
  }
}
