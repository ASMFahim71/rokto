import 'package:rokto/core/common/services/httputil.dart';
import 'package:rokto/features/donation_request/model/order.dart';

class MyRequestsRepo {
  static Future<List<Order>> getMyRequests() async {
    try {
      var response = await HttpUtil().post('/own-requests');
      if (response['code'] == 200) {
        List<dynamic> data = response['data'];
        return data.map((json) => Order.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print('Error fetching my requests: $e');
      return [];
    }
  }
}
