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
        help: 'Titlekeys source URL',
        valueHelp: 'example.com',
        aliases: ['title-keys'],
      );
  }

  void run() {
    stdout.writeln('Reconfiguration complete!');
  }
}
