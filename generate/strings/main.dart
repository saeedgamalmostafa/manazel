// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:watcher/watcher.dart';

import '../utils/exceptions.dart';
import '../utils/generate_constants.dart';
import '../utils/names_helper.dart';
import 'models/names.dart';

/// TO run this file, write this command in terminal:
/// "dart generate/strings/main.dart"
void main() async {
  const String filePath = GenerateConstants.langJsonAssetFilePath;
  final File file = File(filePath);

  final FileWatcher watcher = FileWatcher(filePath);
  final String previousContent = file.readAsStringSync();
  watcher.events.listen((WatchEvent event) {
    if (event.type == ChangeType.MODIFY) {
      print('File changed: ${watcher.path}');
      handleFileChange(file, previousContent);
    }
  });
  final Map<String, dynamic> jsonMap = json.decode(previousContent);
  final Map<String, dynamic> jsonEnMap =
      await generateJsonTranslate(lang: 'en', jsonMap: jsonMap);
  await generateJsonTranslate(lang: 'ar', jsonMap: jsonMap);
  await generateAppStrings(jsonEnMap);
  await createFiles();
  print('Watching for changes in: ${watcher.path}');
}

void handleFileChange(File file, String previousContent) async {
  try {
    final String currentContent = file.readAsStringSync();
    final List<String> currentLines = currentContent.split('\n');
    final List<String> previousLines = previousContent.split('\n');

    for (int i = 0; i < currentLines.length; i++) {
      if (i >= previousLines.length || currentLines[i] != previousLines[i]) {
        print('Line ${i + 1} changed');
        print(
            'Previous: ${(i) >= previousLines.length ? 'null' : previousLines[i]}');
        print('Current: ${currentLines[i]}');
        print('------------------------------------------------------');
      }
    }
    previousContent = currentContent;
    final Map<String, dynamic> jsonMap = json.decode(currentContent);
    final Map<String, dynamic> jsonEnMap =
        await generateJsonTranslate(lang: 'en', jsonMap: jsonMap);
    await generateJsonTranslate(lang: 'ar', jsonMap: jsonMap);
    await generateAppStrings(jsonEnMap);
  } catch (e) {
    print('Uknown Key');
  }
}

Future<Map<String, dynamic>> generateJsonTranslate({
  required String lang,
  required Map<String, dynamic> jsonMap,
}) async {
  final StringBuffer buffer = StringBuffer();
  String filePath = lang == 'en'
      ? GenerateConstants.langEnJsonAssetFilePath
      : lang == 'ar'
          ? GenerateConstants.langArJsonAssetFilePath
          : '';
  File file = File(filePath);
  buffer.writeln('{');
  // String content = file.readAsStringSync().trim();
  // final Map<String, dynamic> fileMap = json.decode(content);
  // List<String> lines = content.split('\n');
  // List<String> linesWithoutLastCurlBrace = lines.sublist(0, lines.length - 1);
  // buffer.writeAll(linesWithoutLastCurlBrace, '\n');
  // String bufferStringTrim = buffer.toString().trim();
  // bufferStringTrim = '$bufferStringTrim,';
  // buffer.clear();
  // buffer.writeln(bufferStringTrim);
  int counter = 0;
  //print('fileMap ${fileMap.toString()}');
  jsonMap.forEach((String key, dynamic value) {
    //print('$lang($counter)  "$key": "$value"');
    try {
      final Names keyNames = Names.fromString(key);
      // if (!fileMap.containsKey(keyNames.snakeCase)) {
      //print('$lang($counter)  !containsKey "${keyNames.snakeCase}" ');
      lang == 'en'
          ? buffer.write('  "${keyNames.snakeCase}": "${keyNames.original}"')
          : buffer.write('  "${keyNames.snakeCase}": "$value"');
      if (counter < jsonMap.length - 1) {
        buffer.write(',');
        // }
        buffer.writeln();
      }
    } on NamesException {
      final String keyStr = '[$key]';
      const String errorMessage = 'is not valid!';
      print(
          '${GenerateConstants.blueColorCode} $keyStr ${GenerateConstants.redColorCode}$errorMessage');
    }
    counter++;
  });
  List<String> linesAfterWrite = buffer.toString().trim().split('\n');
  String lastLineOfLinesAfterWrite = linesAfterWrite.last.trimRight();
  //print('lastLineOfLinesAfterWrite $lastLineOfLinesAfterWrite');
  if (lastLineOfLinesAfterWrite[lastLineOfLinesAfterWrite.length - 1] == ',') {
    lastLineOfLinesAfterWrite = lastLineOfLinesAfterWrite.substring(
        0, lastLineOfLinesAfterWrite.length - 1);
    linesAfterWrite[linesAfterWrite.length - 1] = lastLineOfLinesAfterWrite;
    buffer.clear();
    buffer.writeAll(linesAfterWrite, '\n');
  }
  buffer.writeln('');
  buffer.writeln('}');
  await file.writeAsString(buffer.toString());
  print(
      '${GenerateConstants.greenColorCode} Lang Json File Updated successfully at $filePath ${GenerateConstants.resetColorCode}');
  return json.decode(buffer.toString());
}

Future<void> generateAppStrings(Map<String, dynamic> jsonMap) async {
  final StringBuffer buffer = StringBuffer();
  // String content = file.readAsStringSync();
  // List<String> lines = content.split('\n');
  // List<String> linesWithoutLastCurlBrace = lines.sublist(0, lines.length - 1);
  // buffer.writeln();
  // buffer.writeAll(linesWithoutLastCurlBrace, '\n');
  // buffer.writeln();
  buffer
      .writeln('import \'package:easy_localization/easy_localization.dart\';');
  buffer.writeln();
  buffer.writeln('abstract class LocaleKeys {');
  jsonMap.forEach((String key, _) {
    try {
      final Names keyNames = Names.fromString(key);
      buffer.writeln(
          "  static const String _${keyNames.camelCase} = '${keyNames.original}';");
      buffer.writeln(
          '  static String get ${keyNames.camelCase} => _${keyNames.camelCase}.tr();');
      buffer.writeln();
    } on NamesException {
      final String keyStr = '[$key]';
      const String errorMessage = 'is not valid!';
      print(
          '${GenerateConstants.blueColorCode} $keyStr ${GenerateConstants.redColorCode}$errorMessage');
    }
  });
  buffer.writeln('}');
  File file = File(GenerateConstants.outputStringsFilePath);
  await file.writeAsString(buffer.toString());
  print(
      '${GenerateConstants.greenColorCode} class AppStrings Generated successfully at ${GenerateConstants.outputStringsFilePath} ${GenerateConstants.resetColorCode}');
}

write(
    {required String name,
    required String pathInDir,
    required String content,
    required String importsPath,
    required String importFileContent}) async {
  Directory current = Directory.current;
  print(current.path);

  // final directory = await getApplicationDocumentsDirectory();
  final File file = File('${current.path}$pathInDir$name.dart');
  if (await file.exists()) {
    print('File already exists at: ${file.path}');
  } else {
    // If not, create the file and write to it
    try {
      await file.writeAsString(content);
    } catch (e) {
      log("\x1B[31mError creating file: $e File Path : ${file.path}\x1B[0m");
    }

    print('File created at: ${file.path}');
    final File importsFile = File('${current.path}$importsPath.dart');
    //  ../order_details_widgets/complaints/complaints_tab_view_widget

    // if (await importsFile.exists()) {
    try {
      await importsFile
          .writeAsString("\n$importFileContent", mode: FileMode.writeOnlyAppend)
          .then(
        (value) {
          print('File Imports modified $importFileContent');
        },
      );
    } catch (e) {
      log("\x1B[31mFile Path Error $e File Path : ${importsFile.path}\x1B[0m");
    }
  }

  // print('File Imports modified $importFileContent');
  // }
}
// List<String> filesNames,path

Future<bool> createFiles() async {
  try {
    List<String> filesWidget = [
    ].map(
          (e) => NamesHelper.toSnakeCase(e),
        )
        .toList();
    for (var element in filesWidget) {
      await write(
        name: element,
        pathInDir: '/lib/src/features/freelancer/chats/presentation/order_details_widgets/chat_details/',
        content: "part of '../../imports/presentation_imports.dart';\n\n",
        importsPath: '/lib/src/features/freelancer/chats/presentation/imports/presentation_imports',
        importFileContent: "part '../order_details_widgets/chat_details/$element.dart';",
      );
    }

    
  } catch (e) {
    log("\x1B[31mERROR IN FILES $e\x1B[0m");
  }
  return true;
}
