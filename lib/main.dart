import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quraan_app/pages/quraan/quraan_provider.dart';
import 'package:quraan_app/pages/splashscreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>QuranProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    ),
  );
}
