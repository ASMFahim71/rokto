class Order {
  Order({
    required this.id,
    required this.requesterId,
    required this.bloodGroupId,
    required this.date,
    required this.time,
    required this.cause,
    required this.place,
    required this.gender,
    required this.hospitalName,
    required this.contactNumber,
    required this.divisionName,
    required this.districtName,
    required this.upazilaName,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? requesterId;
  final int? bloodGroupId;
  final DateTime? date;
  final String? time;
  final String? cause;
  final String? place;
  final String? gender;
  final String? hospitalName;
  final String? contactNumber;
  final String? divisionName;
  final String? districtName;
  final String? upazilaName;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["id"],
      requesterId: json["requester_id"],
      bloodGroupId: json["blood_group_id"],
      date: DateTime.tryParse(json["date"] ?? ""),
      time: json["time"],
      cause: json["cause"],
      place: json["place"],
      gender: json["gender"],
      hospitalName: json["hospital_name"],
      contactNumber: json["contact_number"],
      divisionName: json["division_name"],
      districtName: json["district_name"],
      upazilaName: json["upazila_name"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "requester_id": requesterId,
    "blood_group_id": bloodGroupId,
    "date": date?.toIso8601String(),
    "time": time,
    "cause": cause,
    "place": place,
    "gender": gender,
    "hospital_name": hospitalName,
    "contact_number": contactNumber,
    "division_name": divisionName,
    "district_name": districtName,
    "upazila_name": upazilaName,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
