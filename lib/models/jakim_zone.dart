class JakimZone {
  late String jakimCode;
  late String negeri;
  late String daerah;

  JakimZone(
      {required this.jakimCode, required this.negeri, required this.daerah});

  JakimZone.fromJson(Map<String, dynamic> json) {
    jakimCode = json['jakimCode'];
    negeri = json['negeri'];
    daerah = json['daerah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jakimCode'] = jakimCode;
    data['negeri'] = negeri;
    data['daerah'] = daerah;
    return data;
  }

  static List<JakimZone> fromJsonList(List list) {
    if (list.isEmpty) return List<JakimZone>.empty();
    return list.map((item) => JakimZone.fromJson(item)).toList();
  }

  @override
  String toString() {
    return 'JakimZone{jakimCode: $jakimCode, negeri: $negeri, daerah: $daerah}';
  }
}
