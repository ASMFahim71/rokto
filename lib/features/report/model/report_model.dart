class ReportModel {
  final String name;
  final String value;
  final String unit;

  ReportModel({required this.name, required this.value, required this.unit});

  ReportModel copyWith({String? name, String? value, String? unit}) {
    return ReportModel(
      name: name ?? this.name,
      value: value ?? this.value,
      unit: unit ?? this.unit,
    );
  }
}
