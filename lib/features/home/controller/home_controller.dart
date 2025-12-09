import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/banner_model.dart';
import '../models/donation_request_model.dart';
import '../repo/home_repo.dart';

final bannerProvider = FutureProvider<List<BannerModel>>((ref) async {
  return HomeRepo.fetchBanners();
});

final donationRequestProvider = FutureProvider<DonationRequestModel>((
  ref,
) async {
  return HomeRepo.fetchDonationRequest();
});
