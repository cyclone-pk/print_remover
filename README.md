# Remove all print() in project files
Remove all print() used in the project instead of looking and removing all print used in the dart code manually. It makes the process very easy and fast.

## What It does?
- [x] remove print(); from all of your dart files


## How to Use?

Add Change App Package Name to your `pubspec.yaml` in `dev_dependencies:` section.
```yaml
dev_dependencies:
  print_remover: ^1.0.1
```



Update dependencies
```
flutter pub get
```
Run this command to change the package name.

```
flutter pub run print_remover:main
```

## Meta

Zakria khan

Distributed under the MIT license.


