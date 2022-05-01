import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:nabbit/models/storefront.dart';

class Download extends Command {
  final Storefront storefront;

  @override
  String get description => 'Download title from given title ID.';

  @override
  String get name => 'download';

  Download(this.storefront) {
    argParser
      ..addOption(
        'id',
        abbr: 'i',
        help: 'Title ID that can be obtained by searching.',
        valueHelp: '000500001010ED00',
        mandatory: true,
      )
      ..addOption(
        'output',
        abbr: 'o',
        help: 'Output directory.',
        valueHelp: 'foo/bar',
        defaultsTo: '',
      );
  }

  void run() {
    var arguments = argResults!;
    var title = storefront.get(arguments['id']);
    var output = arguments['output'];

    stdout.writeln('Downloading ${title.name} to ${output}...');
  }
}
