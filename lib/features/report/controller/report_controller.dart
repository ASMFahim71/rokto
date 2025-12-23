import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/report_model.dart';
import '../model/report_state.dart';

part 'report_controller.g.dart';

@riverpod
class ReportController extends _$ReportController {
  @override
  ReportState build() {
    return ReportState(
      centerName: "Reseach Center",
      location: "Dhaka Medical College, Dhaka.",
      reports: [
        ReportModel(name: 'Glucose', value: '6', unit: 'mmol/L'),
        ReportModel(name: 'Cholesterol', value: '6.2', unit: 'mmol/L'),
        ReportModel(name: 'Bilirubin', value: '12', unit: 'mmol/L'),
        ReportModel(name: 'RBC', value: '3.6', unit: 'ml/L'),
        ReportModel(name: 'MCV', value: '102', unit: 'fl'),
        ReportModel(name: 'Platelets', value: '276', unit: 'bL'),
      ],
    );
  }

  void updateState(ReportState newState) {
    state = newState;
  }
}
