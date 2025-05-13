import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quraan_app/constants/constants.dart';
import 'package:quraan_app/pages/home_screen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgprimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset("images/image.png"),
          ),
          Text(
            "Quran Majeed",
            style: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              letterSpacing: 2.0,
              color: Colors.teal.shade400,
            ),
          ),
          SizedBox(
            height: 200,
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
            style: ElevatedButton.styleFrom(
              maximumSize: Size(300, 50),
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: bgsecondary,
              foregroundColor: Colors.white,
            ),
            child: Center(
              child: Text(
                "Enter",
                style: GoogleFonts.poppins(fontSize: 20, letterSpacing: 1.7),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
