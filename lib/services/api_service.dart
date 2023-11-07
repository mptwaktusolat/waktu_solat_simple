import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/jakim_zone.dart';

class ApiService {
  static const String kBaseUrl = 'https://mpt-server.vercel.app/api';

  /// Retrieve listy of Jakim Zones
  /// https://mpt-server.vercel.app/locations
  static Future<List<JakimZone>> getLocations() async {
    final result = await http.get(Uri.parse('$kBaseUrl/zones'));

    if (result.statusCode != 200) {
      throw Exception('Failed to load zones');
    }

    return JakimZone.fromJsonList(jsonDecode(result.body));
  }
}
