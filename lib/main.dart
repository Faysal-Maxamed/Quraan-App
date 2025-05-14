import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quraan_app/pages/names%20of%20allah/names_of_allah_provider.dart';
import 'package:quraan_app/pages/quraan/quraan_provider.dart';
import 'package:quraan_app/pages/splashscreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>QuranProvider()),
        ChangeNotifierProvider(create: (_)=>NamesOfAllahProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    ),
  );
}
