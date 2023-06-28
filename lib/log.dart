import 'dart:developer';

import 'package:flutter/foundation.dart';

class Log {
  static const int _maxSeverityLevel = 2000;
  static const int _errorTypes = 6;

  static const int fatalLevel = 6;
  static const int errorLevel = 5;
  static const int warnLevel = 4;
  static const int infoLevel = 3;
  static const int debugLevel = 2;
  static const int traceLevel = 1;

  static int _approximateSeverity(int level) {
    return (_maxSeverityLevel ~/ _errorTypes) * level;
  }

  ///  Any error that is forcing a shutdown of the service or application to
  ///  prevent data loss (or further data loss). Reserve these only for the
  ///  most heinous errors and situations where there is guaranteed to have
  ///  been data corruption or loss.
  static void fatal(String message, {String name = ""}) {
    if (kDebugMode) {
      log(
        "[LOG.FATAL] $message",
        name: name,
        level: _approximateSeverity(fatalLevel),
      );
    }
  }

  /// Any error which is fatal to the operation, but not the service or
  /// application (can't open a required file, missing data, etc.).
  /// These errors will force user (administrator, or direct user) intervention.
  /// These are usually reserved for incorrect connection strings,
  /// missing services, etc.
  static void error(String message, Object? error, {String name = ""}) {
    if (kDebugMode) {
      log(
        "[LOG.ERROR] $message",
        name: name,
        error: error,
        level: _approximateSeverity(errorLevel),
      );
    }
  }

  /// Anything that can potentially cause application oddities.
  /// (Switching from a primary to backup server, retrying an operation,
  /// missing secondary data, etc.)
  static void warn(String message, {String name = ""}) {
    if (kDebugMode) {
      log(
        "[LOG.WARN] $message",
        name: name,
        level: _approximateSeverity(warnLevel),
      );
    }
  }

  /// Generally useful information to log (service start/stop, configuration
  /// assumptions, etc). Info to always have available but usually don't care
  /// about under normal circumstances.
  static void info(String message, {String name = ""}) {
    if (kDebugMode) {
      log(
        "[LOG.INFO] $message",
        name: name,
        level: _approximateSeverity(infoLevel),
      );
    }
  }

  /// Information that is diagnostically helpful to people more than
  /// just developers (IT, sysadmins, etc.).
  static void debug(String message, {String name = ""}) {
    if (kDebugMode) {
      log(
        "[LOG.DEBUG] $message",
        name: name,
        level: _approximateSeverity(debugLevel),
      );
    }
  }

  static void trace(String message, StackTrace? stackTrace, {String name = ""}) {
    if (kDebugMode) {
      log(
        "[LOG.TRACE] $message",
        name: name,
        stackTrace: stackTrace,
        level: _approximateSeverity(traceLevel),
      );
    }
  }

}