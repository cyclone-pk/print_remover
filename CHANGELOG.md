# Changelog

## [1.1.1] - 2026-03-27
### Added
- Added example file for pub.dev package score.

## [1.1.0] - 2026-03-27
### Added
- `--dry-run` (`-d`) flag to preview removals without modifying files.
- `--verbose` (`-v`) flag to display each print statement as it is removed.
- `debugPrint()` removal support alongside `print()`.
- Summary report showing total print statements removed and files scanned.
- Comment-aware detection: print statements inside comments are now preserved.
- Error handling for missing directories and file read/write failures.
- Programmatic API: `PrintRemover` now accepts `path`, `dryRun`, and `verbose` parameters.

### Fixed
- `--path` (`-p`) option was parsed but never actually used; now correctly passes the path to `PrintRemover`.
- Regex pattern now handles nested parentheses (e.g., `print(someFunc())`).
- Help text now shows the correct usage command.

### Improved
- Rewrote README with comprehensive examples, options table, and programmatic usage guide.
- Added proper dartdoc comments to the library and core class.

## [1.0.2] - 2025-01-12
### Added
- Added clear and concise instructions on how to use the package in the README.
- Added the `--help` or `-h` flag to display help information and usage details.
- Simplified the command by allowing the package to be run without specifying `:main` (now works with `dart pub run print_remover`).

### Fixed
- Resolved a bug that caused some `print()` statements to be skipped during removal.

### Meta
- Updated the README with author and contact information (LinkedIn, Facebook, Website, Fiverr).
- Distributed under the MIT License.

## [1.0.1] - 2025-01-10
### Initial Release
- First release of the `print_remover` package.
- Removes all `print()` statements from Dart files in a project.
