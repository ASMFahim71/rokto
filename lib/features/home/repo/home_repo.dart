import 'package:rokto/core/common/utils/image_res.dart';

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

  static Future<DonationRequestModel> fetchDonationRequest() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return DonationRequestModel(
      name: 'Amir Hamza',
      location: 'Hertford British Hospital',
      timeAgo: '5 Min Ago',
      bloodGroup: 'B+',
    );
  }
}
