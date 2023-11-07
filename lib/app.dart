import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'components/location_selector_sheet.dart';
import 'models/jakim_zone.dart';
import 'services/api_service.dart';

class App extends StatefulWidget {
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
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late DateTime dateTime;
  late JakimZone prayerZone;

  @override
  void initState() {
    super.initState();

    dateTime = DateTime.now();
    prayerZone = JakimZone(
      jakimCode: 'SGR01',
      negeri: 'Selangor',
      daerah: 'Gombak, Petaling, Sepang, Hulu Langat, Hulu Selangor, Shah Alam',
    );

    Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

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
                fontWeight: FontWeight.w800,
                fontSize: 28,
              ),
            ),
            InkWell(
              onTap: () async {
                // get prayer times list
                final locations = await ApiService.getLocations();
                // show change location bottom sheet
                if (!mounted) return;
                final jakimCode = await showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return LocationSelectorSheet(
                        locations: locations,
                        currentlySelectedZone: prayerZone.jakimCode,
                      );
                    });

                if (jakimCode == null) return;

                setState(() {
                  prayerZone = jakimCode;
                });
              },
              child: Text(
                prayerZone.daerah,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Text(DateFormat('EEEE, d MMMM yyyy | hh:mm a').format(dateTime)),
            const SizedBox(height: 16),
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
                              App.iconAssetNames[i],
                              colorFilter: const ColorFilter.mode(
                                Color(0xffeab308),
                                BlendMode.srcIn,
                              ),
                              width: 64,
                            ),
                          ),
                          Text(App.labels[i]),
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
