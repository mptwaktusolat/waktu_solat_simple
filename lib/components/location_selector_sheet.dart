import 'package:flutter/material.dart';

import '../models/jakim_zone.dart';

class LocationSelectorSheet extends StatelessWidget {
  const LocationSelectorSheet(
      {super.key,
      required this.locations,
      required this.currentlySelectedZone});

  final List<JakimZone> locations;
  final String currentlySelectedZone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Change Location',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 16),
          for (final location in locations)
            ListTile(
              selected: location.jakimCode == currentlySelectedZone,
              onTap: () {
                Navigator.pop(context, location);
              },
              title: Text(
                location.daerah,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(location.negeri),
            )
        ],
      ),
    );
  }
}
