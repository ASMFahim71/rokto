import 'report_model.dart';

class ReportState {
  final String centerName;
  final String location;
  final List<ReportModel> reports;

  ReportState({
    required this.centerName,
    required this.location,
    required this.reports,
  });

  ReportState copyWith({
    String? centerName,
    String? location,
    List<ReportModel>? reports,
  }) {
    return ReportState(
      centerName: centerName ?? this.centerName,
      location: location ?? this.location,
      reports: reports ?? this.reports,
    );
  }
}
