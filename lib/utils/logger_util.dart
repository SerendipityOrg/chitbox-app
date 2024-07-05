import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class LoggerUtil {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
  );

  static Future<void> log(String message) async {
    _logger.i(message);
    await _writeToFile('INFO: $message');
  }

  static Future<void> logError(String message) async {
    _logger.e(message);
    await _writeToFile('ERROR: $message');
  }

  static Future<void> logWarning(String message) async {
    _logger.w(message);
    await _writeToFile('WARNING: $message');
  }

  static Future<void> _writeToFile(String message) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/logs.txt');
    final currentTime = DateTime.now().toIso8601String();
    await file.writeAsString('$currentTime - $message\n', mode: FileMode.append);
  }
}
