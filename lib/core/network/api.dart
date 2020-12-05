import 'dart:convert';

import 'package:http/http.dart' as http;

import 'unsplash_response.dart';

class API {
  static Future<List<UnsplashResponse>> getRandomImages({int imageCount = 25}) async {
    final response = await http.get('https://api.unsplash.com/photos/random?count=$imageCount', headers: header);
    return unsplashResponseFromJson(response.body);
  }

  static Future<List<UnsplashResponse>> searchImages(String keyword, {int itemCount = 25, int page = 1},) async {
    final res = await http.get('https://api.unsplash.com/search/photos?query=$keyword&page=$page&per_page=$itemCount&order_by=popular', headers: header);
    final response = json.decode(res.body)['results'];
    return unsplashResponseFromJson(jsonEncode(response));
  }

  static Future<String> getDownloadLink(String link) async {
    final res = await http.get(link, headers: header);
    final response = json.decode(res.body)['url'];
    return response;
  }
}
