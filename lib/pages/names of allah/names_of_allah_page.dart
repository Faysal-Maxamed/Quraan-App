import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quraan_app/pages/names%20of%20allah/names_of_allah_provider.dart';

class NamesOfAllahPage extends StatefulWidget {
  const NamesOfAllahPage({super.key});

  @override
  State<NamesOfAllahPage> createState() => _NamesOfAllahPageState();
}

class _NamesOfAllahPageState extends State<NamesOfAllahPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NamesOfAllahProvider>(context, listen: false)
        .getAsmaulHusna(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NamesOfAllahProvider>(
      builder: (context, asmaul, _) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SafeArea(
              child: asmaul.isloading
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          (asmaul.asmaulhusna.length / 3)
                              .ceil(), // inta row u baahan tahay
                          (rowIndex) {
                            // Xisaabi index-ka item kasta
                            final start = rowIndex * 3;
                            final end = (start + 3 < asmaul.asmaulhusna.length)
                                ? start + 3
                                : asmaul.asmaulhusna.length;

                            final rowItems =
                                asmaul.asmaulhusna.sublist(start, end);

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: rowItems.map<Widget>((item) {
                                return Expanded(
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          item['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
