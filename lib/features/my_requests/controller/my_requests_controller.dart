import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rokto/features/donation_request/model/order.dart';
import '../repo/my_requests_repo.dart';

part 'my_requests_controller.g.dart';

@riverpod
class MyRequestsController extends _$MyRequestsController {
  @override
  Future<List<Order>> build() async {
    return _fetchMyRequests();
  }

  Future<List<Order>> _fetchMyRequests() async {
    return await MyRequestsRepo.getMyRequests();
  }

  Future<bool> updateStatus(int orderId, int status) async {
    final success = await MyRequestsRepo.updateRequestStatus(orderId, status);
    if (success) {
      final currentOrders = state.value;
      if (currentOrders != null) {
        final updatedOrders = currentOrders.map((order) {
          if (order.id == orderId) {
            return order.copyWith(status: status);
          }
          return order;
        }).toList();
        state = AsyncValue.data(updatedOrders);
      }
    }
    return success;
  }
}
