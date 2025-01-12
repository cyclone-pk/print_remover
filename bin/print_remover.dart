import 'package:args/args.dart';
import 'package:print_remover/print_remover.dart';

void main(List<String> args) {
  final parser = ArgParser()
    ..addOption('path', abbr: 'p', help: 'Directory to scan for Dart files.', defaultsTo: 'lib')
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Displays help information.');

  final results = parser.parse(args);

  if (results['help'] as bool) {
    print('Usage: flutter pub run print_remover:main [options]\n');
    print(parser.usage);
    return;
  }

  PrintRemover().start();
}
