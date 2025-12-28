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
      return DonationRequestModel(
        name: order.hospitalName ?? "Unknown Hospital",
        location: order.place ?? "Unknown Location",
        timeAgo: _calculateTimeAgo(order.date),
        bloodGroup: _getBloodGroupString(order.bloodGroupId),
      );
    }).toList();
  }

  String _calculateTimeAgo(DateTime? date) {
    if (date == null) return "Unknown time";
    final duration = DateTime.now().difference(date);
    if (duration.inDays > 0) {
      return "${duration.inDays} days ago";
    } else if (duration.inHours > 0) {
      return "${duration.inHours} hours ago";
    } else if (duration.inMinutes > 0) {
      return "${duration.inMinutes} min ago";
    } else {
      return "Just now";
    }
  }

  String _getBloodGroupString(int? bloodGroupId) {
    switch (bloodGroupId) {
      case 1:
        return 'A+';
      case 2:
        return 'A-';
      case 3:
        return 'B+';
      case 4:
        return 'B-';
      case 5:
        return 'AB+';
      case 6:
        return 'AB-';
      case 7:
        return 'O+';
      case 8:
        return 'O-';
      default:
        return 'Unknown';
    }
  }
}
