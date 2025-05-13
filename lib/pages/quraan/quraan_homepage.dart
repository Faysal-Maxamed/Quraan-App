import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quraan_app/constants/constants.dart';
import 'package:quraan_app/pages/quraan/quraan_detail_page.dart';
import 'package:quraan_app/pages/quraan/quraan_provider.dart';
import '';

class QuranHome extends StatefulWidget {
  const QuranHome({super.key});

  @override
  State<QuranHome> createState() => _QuranHomeState();
}

class _QuranHomeState extends State<QuranHome> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuranProvider>(context, listen: false).fetchSurahs();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuranProvider>(context);

    return Scaffold(
      backgroundColor: bgprimary,
      appBar: AppBar(
        backgroundColor: bgprimary,
        title: const Text('Quraanka Kariimka'),
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.surahs.length,
              itemBuilder: (context, index) {
                final surah = provider.surahs[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuraanDetailPage(
                        surahNumber: surah['number'],
                        surahName: surah['name'],
                      ),
                    ),
                  ),
                  child: Card(
                    elevation: 6,
                    color: bgprimary,
                    child: ListTile(
                      leading:
                          CircleAvatar(child: Text(surah['number'].toString())),
                      title: Text(surah['englishName']),
                      subtitle: Text(
                          "${surah['name']} - ${surah['englishNameTranslation']}"),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
