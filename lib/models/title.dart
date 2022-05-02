import 'package:nabbit/models/enum.dart';
import 'package:nabbit/models/ticket.dart';
import 'package:tint/tint.dart';

class Title {
  final String? name;
  final Region region;
  final Ticket ticket;

  const Title({
    required this.name,
    required this.ticket,
    this.region = Region.EUR,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      name: json['name']?.replaceAll('\n', ' ').replaceAll('Â', ''),
      ticket: Ticket(
        json['titleID'],
        json['titleKey'],
        verified: json['ticket'] == 1,
      ),
      region: Region.values.firstWhere(
        (Region element) => element.name == json['region'],
      ),
    );
  }

  @override
  String toString() => [name ?? 'undefined', '(${region.name})'].join(' ');

  String toPrettifiedString({int? spacing}) {
    return [
      ticket.id.dim(),
      ticket.verified ? '●' : '○',
      name!.white().bold(),
      '(${region.name})',
    ].join(' ');
  }
}
