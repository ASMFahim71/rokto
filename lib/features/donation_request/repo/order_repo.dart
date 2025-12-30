import 'package:rokto/core/common/services/httputil.dart';
import 'package:rokto/features/donation_request/model/order.dart';

class OrderRepo {
  static Future<List<Order>> getOrders() async {
    try {
      var response = await HttpUtil().get('/orders');
      if (response['code'] == 200) {
        List<dynamic> data = response['data'];
        return data.map((json) => Order.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      print('Error fetching orders: $e');
      return [];
    }
  }
}
