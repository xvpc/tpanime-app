import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tpanime/data/headers.dart';

Future getPopularAnime() async {
  Uri url = Uri(
    scheme: 'https',
    host: 'tpanime-api.xvpc.workers.dev',
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
      host: 'tpanime-api.xvpc.workers.dev',
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

Future getInfo(String id) async {
  Uri url = Uri(
      scheme: 'https',
      host: 'tpanime-api.xvpc.workers.dev',
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
      host: 'tpanime-api.xvpc.workers.dev',
      path: '/api/episode',
      queryParameters: {'id': "fullmetal-alchemist-brotherhood-episode-1"});
  try {
    var response = await http.get(url, headers: headers);
    var data = jsonDecode(response.body);
    return data;
  } catch (err) {
    return {"error": err ?? "Something went wrong"};
  }
}
