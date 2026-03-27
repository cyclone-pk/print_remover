/// A tool to remove all `print()` and `debugPrint()` statements from Dart files.
///
/// Use `PrintRemover` to scan a directory and strip out print statements:
///
/// ```dart
/// import 'package:print_remover/print_remover.dart';
///
/// void main() async {
///   final remover = PrintRemover(path: 'lib', dryRun: true);
///   final count = await remover.start();
///   print('Found $count print statements');
/// }
/// ```
library print_remover;

export 'src/print_remover_base.dart';
