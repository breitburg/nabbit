import 'package:args/command_runner.dart';
import 'package:nabbit/models/enum.dart';
import 'package:nabbit/models/storefront.dart';
import 'package:tint/tint.dart';

class Search extends Command {
  final Storefront storefront;

  Search(this.storefront) {
    argParser
      ..addOption(
        'query',
        abbr: 'q',
        help: 'Query for the search.',
        valueHelp: 'Mario Kart 8',
        mandatory: true,
      )
      ..addSeparator('Search Options')
      ..addOption(
        'region',
        abbr: 'r',
        help: 'Target title region.',
        allowed: [for (var region in Region.values) region.name],
        valueHelp: 'EUR',
      )
      ..addFlag(
        'strict',
        abbr: 's',
        help: 'Show titles that has verified ticket key.',
        defaultsTo: false,
        negatable: false,
      );
  }

  @override
  String get name => 'search';

  @override
  String get description => 'Search for titles, updates or DLCs.';

  void run() {
    var arguments = argResults!;

    var title = arguments['query'];
    var region = arguments.wasParsed('region')
        ? Region.values
            .firstWhere((Region element) => element.name == arguments['region'])
        : null;

    var results = storefront.search(
      title,
      region: region,
      verifiedRequired: arguments['strict'],
    );

    for (var title in results) {
      var dot = title.ticket.verified ? '●' : '○';

      print(
          '${title.ticket.id.dim()} $dot ${title.name!.bold()} (${title.region.name})');
    }
  }
}
