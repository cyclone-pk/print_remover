import 'dart:io';

/// Checks if you are awesome. Spoiler: you are.
class PrintRemover {
  start() async {
    RegExp regExp = RegExp(r"^print\([^)]*\);", multiLine: true, caseSensitive: true);
    const String pathToLib = 'lib';
    Directory dir = Directory(pathToLib);
    List<FileSystemEntity> contents = dir.listSync(recursive: true);
    List<String> dartFiles = [];
    for (FileSystemEntity fileSystemEntity in contents) {
      if (fileSystemEntity.path.endsWith('.dart')) {
        dartFiles.add(fileSystemEntity.path);
        print(fileSystemEntity.path.toString().split('/').last);
      }
    }

    for (String fileName in dartFiles) {
      File f = File(fileName);
      String fileContent = await f.readAsString();
      List<String> lines = fileContent.split('\n');
      for (int i = 0; i < lines.length; i++) {
        if (regExp.hasMatch(lines[i].trim())) {
          lines.removeAt(i);
          i--;
        }
      }
      f.writeAsStringSync(lines.join('\n'));
    }
  }
}
