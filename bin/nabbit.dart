import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:nabbit/models/storefront.dart';
import 'package:nabbit/models/title.dart';
import 'package:tint/tint.dart';

void main(List<String> arguments) async {
  final console = Console()..clearScreen();
  final storefront = await Storefront.fromUrl(
    Uri.http('vault.titlekeys.ovh', '/json'),
  );

  var query = '';
  var entry = 'Search: ';
  console.write(entry);

  stdin
    ..lineMode = false
    ..echoMode = false
    ..listen((event) {
      console.cursorPosition = Coordinate(0, entry.length);
      console.eraseCursorToEnd();

      switch (event.first) {
        case 127:
          if (query.isNotEmpty) query = query.substring(0, query.length - 1);
          break;

        case 10:
          break;

        default:
          query += String.fromCharCodes(event);
          break;
      }

      var results = storefront.search(query).where((Title element) =>
          element.name?.toLowerCase().startsWith(query.toLowerCase()) ?? false);
      var prediction = results.isNotEmpty ? results.first.toString() : query;

      console.write(
          '${query.bold()}${prediction.substring(query.length, prediction.length).dim()}');
      console.cursorPosition = Coordinate(0, entry.length + query.length);
    });
}
