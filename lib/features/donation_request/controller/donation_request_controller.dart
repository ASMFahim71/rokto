import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../home/models/donation_request_model.dart';
import '../repo/order_repo.dart';

part 'donation_request_controller.g.dart';

@riverpod
class DonationRequestController extends _$DonationRequestController {
  @override
  Future<List<DonationRequestModel>> build() async {
    return _fetchOrders();
  }

  Future<List<DonationRequestModel>> _fetchOrders() async {
    final orders = await OrderRepo.getOrders();
    return orders.map((order) {
      print("Blood group is controller ${order.bloodGroupId}");
      return DonationRequestModel(
        name: order.hospitalName ?? "Unknown Hospital",
        location: order.place ?? "Unknown Location",
        date: order.date ?? DateTime.now(),
        bloodGroup: order.bloodGroupId!,
        description: order.cause ?? "No description available",
        phoneNumber: order.contactNumber ?? "Unknown",
        division: order.divisionName ?? "Unknown",
        district: order.districtName ?? "Unknown",
        upazila: order.upazilaName ?? "Unknown",
        time: order.time ?? "Unknown",
      );
    }).toList();
  }
}
