import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokto/core/common/utils/image_res.dart';
import 'package:rokto/features/donation_request/repo/order_repo.dart';
import '../models/banner_model.dart';
import '../models/donation_request_model.dart';

class HomeRepo {
  static Future<List<BannerModel>> fetchBanners() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      BannerModel(
        imageUrl: ImageRes.banner1,
        title: 'Together, we are\nCanada\'s Lifeline',
        subtitle: 'Donate blood, save lives.',
      ),
      BannerModel(
        imageUrl: ImageRes.banner2,
        title: 'Be a Hero\nDonate Blood',
        subtitle: 'Your blood can save a life.',
      ),
      BannerModel(
        imageUrl: ImageRes.banner3,
        title: 'Emergency\nNeed Blood?',
        subtitle: 'Find donors near you.',
      ),
    ];
  }

  static Future<List<DonationRequestModel>> fetchDonationRequest() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final orders = await OrderRepo.getOrders();
    return orders.map((order) {
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
