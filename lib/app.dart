import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatelessWidget {
  const App({super.key});

  static const iconAssetNames = [
    'assets/icons/isyak.svg',
    'assets/icons/syuruk.svg',
    'assets/icons/zohor.svg',
    'assets/icons/asar.svg',
    'assets/icons/maghrib.svg',
    'assets/icons/isyak.svg',
  ];

  static const labels = [
    'Subuh',
    'Syuruk',
    'Zohor',
    'Asar',
    'Maghrib',
    'Isyak',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Waktu Solat Malaysia',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const Text(
              'SGR01: Shah Alam, Puchong, Petaling Jaya, etc.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const Text('7 November 2023, 12:00 PM'),
            Wrap(
              children: [
                for (int i = 0; i < 6; i++)
                  Container(
                    margin: const EdgeInsets.all(4),
                    width: 128,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.shade50,
                          blurRadius: 50,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset(
                              iconAssetNames[i],
                              colorFilter: const ColorFilter.mode(
                                Color(0xffeab308),
                                BlendMode.srcIn,
                              ),
                              width: 64,
                            ),
                          ),
                          Text(labels[i]),
                          const Text('5:00 AM'),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
