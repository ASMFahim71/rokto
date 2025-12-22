class Division {
  final int id;
  final String name;

  Division({required this.id, required this.name});

  factory Division.fromJson(Map<String, dynamic> json) {
    return Division(id: json['id'], name: json['name']);
  }
}

class District {
  final int id;
  final int divisionId;
  final String name;

  District({required this.id, required this.divisionId, required this.name});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'],
      divisionId: int.parse(json['division_id'].toString()),
      name: json['name'],
    );
  }
}

class Upazila {
  final int id;
  final int districtId;
  final String name;

  Upazila({required this.id, required this.districtId, required this.name});

  factory Upazila.fromJson(Map<String, dynamic> json) {
    return Upazila(
      id: json['id'],
      districtId: int.parse(json['district_id'].toString()),
      name: json['name'],
    );
  }
}
