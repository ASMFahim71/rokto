import 'package:dio/dio.dart';
import 'package:rokto/features/donation_request/model/order.dart';
import 'package:rokto/core/common/utils/constants.dart';

class OrderRepo {
  final Dio _dio = Dio();
  // TODO: Replace with your actual backend base URL
  final String baseUrl = AppConstants.baseUrl;

  Future<bool> createOrder(Order order) async {
    try {
      final response = await _dio.post(
        '$baseUrl/orders',
        data: order.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            //'Authorization': 'Bearer ${AppConstants.STORAGE_USER_TOKEN_KEY}',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      // ignore: avoid_print
      print('Error creating order: $e');
      return false;
    }
  }
}
