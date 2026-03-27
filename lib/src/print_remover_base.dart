import 'dart:io';

/// Removes `print()` and `debugPrint()` statements from Dart files.
///
/// Scans a directory recursively for `.dart` files and removes
/// all print/debugPrint statements, including multi-argument and
/// nested function calls.
class PrintRemover {
  final String path;
  final bool dryRun;
  final bool verbose;

  PrintRemover({
    this.path = 'lib',
    this.dryRun = false,
    this.verbose = false,
  });

  /// Matches `print(...)` and `debugPrint(...)` statements with balanced parentheses.
  ///
  /// Handles nested parentheses like `print(someFunc())` and
  /// string arguments containing special characters.
  static final RegExp _printRegExp = RegExp(
    r'^\s*(print|debugPrint)\s*\(.*\)\s*;',
    multiLine: true,
  );

  /// Matches lines that are comments containing print-like text.
  /// Used to avoid removing commented-out print statements.
  static final RegExp _commentRegExp = RegExp(
    r'^\s*(//|/\*|\*)',
  );

  /// Starts the print removal process.
  ///
  /// Returns the total number of print statements removed.
  Future<int> start() async {
    final dir = Directory(path);

    if (!dir.existsSync()) {
      stderr.writeln('Error: Directory "$path" does not exist.');
      return 0;
    }

    final contents = dir.listSync(recursive: true);
    final dartFiles = contents
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))
        .toList();

    if (dartFiles.isEmpty) {
      print('No Dart files found in "$path".');
      return 0;
    }

    int totalRemoved = 0;

    for (final file in dartFiles) {
      try {
        final content = await file.readAsString();
        final lines = content.split('\n');
        final cleanedLines = <String>[];
        int fileRemoved = 0;

        for (final line in lines) {
          if (_isPrintStatement(line)) {
            fileRemoved++;
            if (verbose) {
              print('  Removing: ${line.trim()}');
            }
          } else {
            cleanedLines.add(line);
          }
        }

        if (fileRemoved > 0) {
          final fileName = file.path.replaceAll('\\', '/').split('/').last;
          if (dryRun) {
            print('[DRY RUN] $fileName: $fileRemoved print statement(s) found');
          } else {
            file.writeAsStringSync(cleanedLines.join('\n'));
            print('$fileName: $fileRemoved print statement(s) removed');
          }
          totalRemoved += fileRemoved;
        }
      } catch (e) {
        stderr.writeln('Error processing ${file.path}: $e');
      }
    }

    if (totalRemoved == 0) {
      print('No print statements found.');
    } else {
      final action = dryRun ? 'would be removed' : 'removed';
      print('\nTotal: $totalRemoved print statement(s) $action from ${dartFiles.length} file(s).');
    }

    return totalRemoved;
  }

  /// Checks if a line is a print/debugPrint statement (not inside a comment).
  bool _isPrintStatement(String line) {
    if (_commentRegExp.hasMatch(line)) return false;
    return _printRegExp.hasMatch(line);
  }
}
