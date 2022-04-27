import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nabbit/models/enum.dart';
import 'package:nabbit/models/title.dart';

class Storefront {
  /// An object that represents a frontstore
  ///
  /// It stores a list of titles, which can be searched
  /// by using [Storefront.search] function;

  const Storefront(this.titles);

  /// A storage for titles
  /// to perform [Storefront.search] and other functions
  final List<Title> titles;

  /// Find titles from database by query and region
  Iterable<Title> search(
    String query, {
    Region? region,
    bool verifiedRequired = false,
  }) {
    return titles.where((Title element) {
      var containsQuery =
          element.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
      var allowedRegion = region == null || region == element.region;
      var hasVerification = !verifiedRequired || element.ticket.verified;

      return containsQuery && allowedRegion && hasVerification;
    });
  }

  /// Retrive title from database by a given ID
  Title get(String id) {
    return titles.firstWhere((Title element) => element.ticket.id == id);
  }

  /// Create [Storefront] object from JSON object
  factory Storefront.fromJson(List<dynamic> json) {
    return Storefront([for (var item in json) Title.fromJson(item)]);
  }

  /// Create [Storefront] object from JSON object obtained from URL
  static Future<Storefront> fromUrl(Uri uri) async {
    var response = await http.get(uri);
    return Storefront.fromJson(jsonDecode(response.body));
  }
}
