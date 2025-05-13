import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuranProvider with ChangeNotifier {
  List<dynamic> _surahs = [];
  List<dynamic> _surah = [];
  bool _isLoading = true;

  List<dynamic> get surahs => _surahs;
  List<dynamic> get surah => _surah;
  bool get isLoading => _isLoading;

  Future<void> fetchSurahs() async {
    final url = Uri.parse("https://api.alquran.cloud/v1/surah");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _surahs = jsonData['data'];
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception("Surah loading failed");
    }
  }

  Future<void> getsurah(surahnumber) async {
    final urlsurah = "https://api.alquran.cloud/v1/surah/${surahnumber}";
    var response = await http.get(Uri.parse(urlsurah));
    if (response.statusCode == 200) {
      var date = jsonDecode(response.body);
      _surah = date['data']['ayahs'];

      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception("Surah loading failed");
    }
  }
}
