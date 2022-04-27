import 'dart:convert';

import 'package:http/http.dart';
import 'package:nabbit/models/enum.dart';
import 'package:nabbit/models/title.dart';

class Storefront {
  /// An object that represents a frontstore
  ///
  /// It stores a list of titles, which can be searched
  /// by using [Storefront.search] function;

  const Storefront(this.titles);

  final List<Title> titles;

  /// Use search method to find a title by name and region
  Iterable<Title> search(String query, {Region? region}) {
    return titles.where((Title element) {
      var containsQuery =
          element.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
      var allowedRegion = region == null || region == element.region;

      return containsQuery && allowedRegion;
    });
  }

  /// Create [Storefront] object from JSON object
  factory Storefront.fromJson(List<dynamic> json) {
    return Storefront(
      List.generate(
        json.length,
        (int index) => Title.fromJson(json.elementAt(index)),
      ),
    );
  }

  /// Create [Storefront] object from JSON object obtained from URL
  static Future<Storefront> fromUrl(Uri uri) async {
    var response = await get(uri);
    return Storefront.fromJson(jsonDecode(response.body));
  }
}
