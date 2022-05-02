import 'package:args/command_runner.dart';
import 'package:nabbit/commands/configure.dart';
import 'package:nabbit/commands/download.dart';
import 'package:nabbit/commands/search.dart';
import 'package:nabbit/models/storefront.dart';

void main(List<String> arguments) async {
  var storefront = await Storefront.fromUrl(
    Uri.http('vault.titlekeys.ovh', '/json'),
  );

  var runner = CommandRunner(
    'nabbit',
    'Browse and download titles for 3DS and Wii U.',
  )
    ..addCommand(Configuration())
    ..addCommand(Search(storefront))
    ..addCommand(Download(storefront));

  runner.run(arguments);
}
