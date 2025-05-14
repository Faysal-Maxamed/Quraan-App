import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NamesOfAllahProvider extends ChangeNotifier {
  List<dynamic> _asmaulhusna = [];
  bool isloading = true;

  List<dynamic> get asmaulhusna => _asmaulhusna;

  Future<void> getAsmaulHusna(BuildContext context) async {
    try {
      final endpoint = "https://api.aladhan.com/v1/asmaAlHusna";
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        var jsondecode = jsonDecode(response.body);
        _asmaulhusna = jsondecode['data'];
        isloading = false;
        notifyListeners();
      } else {
        print("error occur");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("error occur in ${e}"),
        ),
      );
    }
    notifyListeners();
  }
}
