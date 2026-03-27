# print_remover

A simple and fast tool to remove all `print()` and `debugPrint()` statements from your Dart/Flutter codebase, making cleanup before release effortless.

## Features

- Removes `print()` and `debugPrint()` statements from all `.dart` files
- Handles nested function calls like `print(someFunc())`
- Skips print statements inside comments (`//`, `/*`, `*`)
- Supports custom directory paths (not just `lib`)
- Dry-run mode to preview changes before applying
- Verbose mode to see each removed statement
- Summary report of total removals

## Installation

Add `print_remover` to your `dev_dependencies` in `pubspec.yaml`:

```yaml
dev_dependencies:
  print_remover: ^1.1.0
```

Then fetch dependencies:

```bash
dart pub get
```

## Usage

### Basic usage

Remove all print statements from the `lib` directory:

```bash
dart run print_remover
```

### Preview changes (dry-run)

See what would be removed without modifying any files:

```bash
dart run print_remover --dry-run
```

### Scan a custom directory

Scan a directory other than `lib`:

```bash
dart run print_remover --path src
dart run print_remover -p test
```

### Verbose output

See each print statement as it is removed:

```bash
dart run print_remover --verbose
```

### Combine options

```bash
dart run print_remover --path lib --dry-run --verbose
```

### All options

| Option          | Short | Description                              | Default |
|-----------------|-------|------------------------------------------|---------|
| `--path`        | `-p`  | Directory to scan for Dart files         | `lib`   |
| `--dry-run`     | `-d`  | Preview removals without modifying files | off     |
| `--verbose`     | `-v`  | Show each print statement being removed  | off     |
| `--help`        | `-h`  | Display help information                 | -       |

### Programmatic usage

You can also use `PrintRemover` as a library in your own Dart code:

```dart
import 'package:print_remover/print_remover.dart';

void main() async {
  final remover = PrintRemover(
    path: 'lib',
    dryRun: true,
    verbose: true,
  );
  final count = await remover.start();
  print('Found $count print statements');
}
```

## What gets removed

```dart
// These WILL be removed:
print('Hello World');
print(someVariable);
print(someFunction());
debugPrint('Debug info');
print('Value: ${obj.property}');

// These will NOT be removed (inside comments):
// print('commented out');
/* print('block comment'); */
/// print('doc comment');
```

## Tips

- Always use `--dry-run` first to preview what will be removed
- Use version control (git) so you can revert if needed
- Run this before building your release version

---

## Meta

Created and maintained by [Zakria Khan](https://www.zakriakhan.com).

- [LinkedIn](https://www.linkedin.com/in/zakriakhan53/)
- [Facebook](https://www.facebook.com/zakria.khan.53)
- [Website](https://www.zakriakhan.com)
- [Fiverr](https://www.fiverr.com/toptutorial270)

Distributed under the MIT License.
