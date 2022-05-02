import 'dart:io';

import 'package:args/command_runner.dart';

class Configuration extends Command {
  @override
  String get description => 'Configurate tool properties.';

  @override
  String get name => 'configure';

  Configuration() {
    argParser
      ..addOption(
        'keys',
        abbr: 'k',
        help: 'Titlekeys source URL.',
        valueHelp: 'example.com',
        aliases: ['title-keys'],
      )
      ..addOption(
        'cache',
        abbr: 'c',
        help: 'Cache file path.',
        valueHelp: 'cache.yaml',
      );
  }

  void run() {
    stdout.writeln('Configuration complete!');
  }
}
