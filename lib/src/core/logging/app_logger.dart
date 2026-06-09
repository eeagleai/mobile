import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Shared app [Logger]. Do not log passwords, tokens, or other secrets.
final Logger appLogger = Logger(
  level: kReleaseMode ? Level.info : Level.debug,
  filter: ProductionFilter(),
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 100,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);
