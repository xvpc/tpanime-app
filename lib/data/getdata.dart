import 'package:http/http.dart' as http;
import 'package:tpanime/data/assetsdata.dart';
import 'dart:convert';

import 'package:tpanime/data/headers.dart';

Future getPopularAnime() async {
  Uri url = Uri(
    scheme: 'https',
    host: apiHost,
    path: '/api/popular',
    // queryParameters: {'search': 'blue', 'limit': '10'}
  );
  try {
    var response = await http.get(url, headers: headers);
    var data = jsonDecode(response.body);
    return data;
  } catch (err) {
    return {"error": err ?? "Something went wrong"};
  }
}

Future getMovies() async {
  Uri url = Uri(
      scheme: 'https',
      host: apiHost,
      path: '/api/search',
      queryParameters: {'query': 'MOVIE', 'perPage': '100'});
  try {
    var response = await http.get(url, headers: headers);
    var data = jsonDecode(response.body);
    return data;
  } catch (err) {
    return {"error": err ?? "Something went wrong"};
  }
}

Future getTrending() async {
  Uri url = Uri(
    scheme: 'https',
    host: apiHost,
    path: '/api/trending',
    // queryParameters: {'query': 'MOVIE', 'perPage': '100'}
  );
  try {
    var response = await http.get(url, headers: headers);
    var data = jsonDecode(response.body);
    return data;
  } catch (err) {
    return {"error": err ?? "Something went wrong"};
  }
}

Future getInfo(String id) async {
  Uri url = Uri(
      scheme: 'https',
      host: apiHost,
      path: '/api/info',
      queryParameters: {'id': id});
  try {
    var response = await http.get(url, headers: headers);
    var data = jsonDecode(response.body);
    return data;
  } catch (err) {
    return {"error": err ?? "Something went wrong"};
  }
}

Future getEpisode(String id) async {
  Uri url = Uri(
      scheme: 'https',
      host: apiHost,
      path: '/api/episode',
      queryParameters: {'id': id});
  try {
    var response = await http.get(url, headers: headers);
    var data = jsonDecode(response.body);
    return data;
  } catch (err) {
    return {"error": err ?? "Something went wrong"};
  }
}

Future getSearch({required String query, int page = 1}) async {
  Uri url = Uri(
      scheme: 'https',
      host: apiHost,
      path: '/api/search',
      queryParameters: {
        'query': query,
        'perPage': '100',
        'page': page.toString() ?? 1
      });
  try {
    var response = await http.get(url, headers: headers);
    var data = jsonDecode(response.body);
    return data;
  } catch (err) {
    return {"error": err ?? "Something went wrong"};
  }
}
