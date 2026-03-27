import 'package:args/args.dart';
import 'package:print_remover/print_remover.dart';

void main(List<String> args) {
  final parser = ArgParser()
    ..addOption('path',
        abbr: 'p',
        help: 'Directory to scan for Dart files.',
        defaultsTo: 'lib')
    ..addFlag('dry-run',
        abbr: 'd',
        negatable: false,
        help: 'Preview removals without modifying files.')
    ..addFlag('verbose',
        abbr: 'v',
        negatable: false,
        help: 'Show each print statement being removed.')
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Displays help information.');

  final results = parser.parse(args);

  if (results['help'] as bool) {
    print('print_remover - Remove all print() and debugPrint() statements from Dart files.\n');
    print('Usage: dart run print_remover [options]\n');
    print(parser.usage);
    return;
  }

  PrintRemover(
    path: results['path'] as String,
    dryRun: results['dry-run'] as bool,
    verbose: results['verbose'] as bool,
  ).start();
}
