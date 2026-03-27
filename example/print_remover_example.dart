import 'package:print_remover/print_remover.dart';

void main() async {
  // Basic usage: remove all print statements from 'lib' directory
  final remover = PrintRemover();
  await remover.start();

  // Preview changes without modifying files
  final dryRunRemover = PrintRemover(
    path: 'lib',
    dryRun: true,
    verbose: true,
  );
  final count = await dryRunRemover.start();
  print('Found $count print statement(s)');

  // Scan a custom directory
  final customRemover = PrintRemover(path: 'src');
  await customRemover.start();
}
