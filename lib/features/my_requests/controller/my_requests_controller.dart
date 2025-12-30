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
}
