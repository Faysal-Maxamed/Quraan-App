import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quraan_app/constants/constants.dart';
import 'package:quraan_app/pages/quraan/quraan_provider.dart';

class QuraanDetailPage extends StatelessWidget {
  final int surahNumber;
  final String surahName;

  const QuraanDetailPage({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final provider = QuranProvider();
        provider.getsurah(surahNumber);
        return provider;
      },
      child: Scaffold(
        backgroundColor: bgprimary,
        appBar: AppBar(
          backgroundColor: bgprimary,
          title: Column(
            children: [
              Text(surahName),
            ],
          ),
        ),
        body: Consumer<QuranProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return PageView.builder(
              itemCount: provider.surah.length,
              itemBuilder: (context, index) {
                final ayah = provider.surah[index];

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Aayah ${ayah['numberInSurah']}',
                          style:
                              const TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          ayah['text'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
