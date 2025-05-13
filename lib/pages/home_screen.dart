import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quraan_app/constants/constants.dart';
import 'package:quraan_app/pages/quraan/quraan_homepage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgprimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/bg1.jpg"),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 7,
                    offset: Offset(3, 7),
                    spreadRadius: 5,
                  )
                ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Raadi Surad",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardsWidgets(
                        imgurl: "images/quran.jpeg",
                        title: "Quraanka",
                        ontab: QuranHome(),
                      ),
                      CardsWidgets(
                        imgurl: "images/kacba.jpeg",
                        title: "Raadi qiblada",
                      ),
                      CardsWidgets(
                        imgurl: "images/tasbiix.jpeg",
                        title: "Tasbiix",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardsWidgets(
                        imgurl: "images/duco.jpeg",
                        title: "Ducada",
                      ),
                      CardsWidgets(
                        imgurl: "images/waqtiga.jpeg",
                        title: "Waqtiga salaada",
                      ),
                      CardsWidgets(
                        imgurl: "images/99names.jpeg",
                        title: "99 Magacyo Alah",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text(
                            "Tasbiix ee maalmaha",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              letterSpacing: 2.0,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "images/tsd1.png",
                                  width: 140,
                                  height: 140,
                                ),
                                Text("istaqfurulah")
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              maximumSize: Size(190, 50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      "images/eye.jpeg",
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  Text(
                                    "Eeg wax dheer ah",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Shiiqyada",
                    style: GoogleFonts.rubik(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "images/basit.jpeg",
                            width: 100,
                            height: 70,
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardsWidgets extends StatelessWidget {
  const CardsWidgets(
      {super.key, required this.imgurl, required this.title, this.ontab});
  final imgurl;
  final title;
  final ontab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (_) => ontab)),
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 7,
                  offset: Offset(3, 7),
                  spreadRadius: 5,
                )
              ],
              borderRadius: BorderRadius.circular(80),
              image: DecorationImage(
                image: AssetImage(imgurl),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
