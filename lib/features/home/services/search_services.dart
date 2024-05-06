import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:musickeando/features/authentication/authentication.dart';

import 'package:musickeando/features/data.dart';

class SearchService extends ChangeNotifier {
  final auth = Authentication();

  final _search = StreamController();
  void disposeSearchStream() {
    _search.close();
  }

  Future searchAll(query) async {
    final token = await auth.getAccessToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final url = Uri.https('api.spotify.com', 'v1/search', {
      'q': query,
      'type': 'artist,album',
      'market': 'ES',
      'limit': '10',
      'offset': '5'
    });
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      final decode = json.decode(res.body);
      final results = Search.fromJson(decode);
      return results;
    } else {
      return null;
    }
  }
}
