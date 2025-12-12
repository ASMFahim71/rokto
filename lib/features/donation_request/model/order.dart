class Order {
    Order({
        required this.orderId,
        required this.requesterId,
        required this.bloodGroupId,
        required this.date,
        required this.time,
        required this.cause,
        required this.place,
        required this.gender,
        required this.createdAt,
        required this.updatedAt,
    });

    final int? orderId;
    final int? requesterId;
    final int? bloodGroupId;
    final DateTime? date;
    final String? time;
    final String? cause;
    final String? place;
    final String? gender;
    final dynamic createdAt;
    final dynamic updatedAt;

    factory Order.fromJson(Map<String, dynamic> json){ 
        return Order(
            orderId: json["order_id"],
            requesterId: json["requester_id"],
            bloodGroupId: json["blood_group_id"],
            date: DateTime.tryParse(json["date"] ?? ""),
            time: json["time"],
            cause: json["cause"],
            place: json["place"],
            gender: json["gender"],
            createdAt: json["created_at"],
            updatedAt: json["updated_at"],
        );
    }

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "requester_id": requesterId,
        "blood_group_id": bloodGroupId,
        "date": date?.toIso8601String(),
        "time": time,
        "cause": cause,
        "place": place,
        "gender": gender,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };

}
