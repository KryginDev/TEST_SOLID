import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test_solidsoftware/model/album.dart';
import 'package:http/http.dart' as http;

class NetworkingProvider with ChangeNotifier {
  bool isLoading = false;

  Future<List<Album>> fetchAlbum() async {
    isLoading = true;
    notifyListeners();
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums');

    if (response.statusCode == 200) {
      isLoading = false;
      notifyListeners();
      final List<dynamic> objects = jsonDecode(response.body);
      return objects.map((e) => Album.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
