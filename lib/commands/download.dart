import 'package:args/command_runner.dart';
import 'package:nabbit/models/storefront.dart';

class Download extends Command {
  final Storefront storefront;

  @override
  String get description => 'Download title from given title ID.';

  @override
  String get name => 'download';

  Download(this.storefront);

  void run() {}
}
