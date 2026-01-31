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
    this.status,
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
  final int? status;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["id"] is int
          ? json["id"]
          : (int.tryParse(json["id"]?.toString() ?? "") ?? json["order_id"]),
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
      status: json["is_managed"] is int
          ? json["is_managed"]
          : int.tryParse(json["is_managed"]?.toString() ?? "0"),
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
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };

  Order copyWith({
    int? id,
    int? requesterId,
    int? bloodGroupId,
    DateTime? date,
    String? time,
    String? cause,
    String? place,
    String? gender,
    String? hospitalName,
    String? contactNumber,
    String? divisionName,
    String? districtName,
    String? upazilaName,
    int? status,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    return Order(
      id: id ?? this.id,
      requesterId: requesterId ?? this.requesterId,
      bloodGroupId: bloodGroupId ?? this.bloodGroupId,
      date: date ?? this.date,
      time: time ?? this.time,
      cause: cause ?? this.cause,
      place: place ?? this.place,
      gender: gender ?? this.gender,
      hospitalName: hospitalName ?? this.hospitalName,
      contactNumber: contactNumber ?? this.contactNumber,
      divisionName: divisionName ?? this.divisionName,
      districtName: districtName ?? this.districtName,
      upazilaName: upazilaName ?? this.upazilaName,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
