import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../home/models/donation_request_model.dart';

part 'donation_request_controller.g.dart';

@riverpod
class DonationRequestController extends _$DonationRequestController {
  @override
  List<DonationRequestModel> build() {
    return _loadData();
  }

  List<DonationRequestModel> _loadData() {
    return [
      DonationRequestModel(
        name: 'Amir Hamza',
        location: 'Hertford British Hospital',
        timeAgo: '5 Min Ago',
        bloodGroup: 'B+',
      ),
      DonationRequestModel(
        name: 'Abdul Qader',
        location: 'Apollo Hospital',
        timeAgo: '16 Min Ago',
        bloodGroup: 'B+',
      ),
      DonationRequestModel(
        name: 'Irfan Hasan',
        location: 'Square Hospital',
        timeAgo: '45 Min Ago',
        bloodGroup: 'B+',
      ),
      DonationRequestModel(
        name: 'Ertugrul Gazi',
        location: 'Popular Hospital',
        timeAgo: '59 Min Ago',
        bloodGroup: 'B+',
      ),
      DonationRequestModel(
        name: 'Osman Bey',
        location: 'United Hospital',
        timeAgo: '1 Hr Ago',
        bloodGroup: 'O+',
      ),
    ];
  }
}
