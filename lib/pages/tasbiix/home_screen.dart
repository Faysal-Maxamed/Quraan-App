import 'package:flutter/material.dart';
import 'package:quraan_app/pages/tasbiix/Subhanallah_screen.dart';
import 'package:quraan_app/pages/tasbiix/alahuakbar_screen.dart';
import 'package:quraan_app/pages/tasbiix/alxamdulilah_screen.dart';
import 'package:quraan_app/pages/tasbiix/istaqfurulah_screen.dart';
import 'package:quraan_app/pages/tasbiix/lailaha_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 270,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/backtasbiix.jpg"),
                ),
              ),
              child: const Center(
                child: Text(
                  "أذكار التسبيح والتهليل",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const cardWidget(
              PagesNavigator: SubhanallahScreen(),
              Numbers: "333+",
              Name1: "سُبْحَانَ الله",
              Name2: "Subhanallah",
            ),
            const cardWidget(
              PagesNavigator: AlxamdulilahScreen(),
              Numbers: "201+",
              Name1: "الْحَمْدُ لِلَّه",
              Name2: "Alhamdulillah",
            ),
            const cardWidget(
              PagesNavigator: AlahuakbarScreen(),
              Numbers: "99+",
              Name1: "اللهُ أَكْبَر",
              Name2: "Allahu Akbar",
            ),
            const cardWidget(
              PagesNavigator: IstaqfurulahScreen(),
              Numbers: "199+",
              Name1: "أَسْتَغْفِرُ اللَّه",
              Name2: "Astaghfirullah",
            ),
            const cardWidget(
              PagesNavigator: LailahaScreen(),
              Numbers: "210+",
              Name1: "لا إلهَ إلا الله",
              Name2: "La ilaha illallah",
            ),
          ],
        ),
      ),
    );
  }
}

class cardWidget extends StatelessWidget {
  const cardWidget(
      {super.key,
      required this.Name1,
      required this.Name2,
      required this.Numbers,
      required this.PagesNavigator});
  final Name1;
  final Name2;
  final Numbers;
  final PagesNavigator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PagesNavigator));
        },
        child: Card(
            elevation: 10,
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "$Numbers",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "$Name1",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "$Name2",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
