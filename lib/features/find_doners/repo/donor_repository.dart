import '../model/donor_model.dart';
// Assuming we can use this for mock images if needed, or just standard assets

class DonorRepository {
  // Mock data
  Future<List<DonorModel>> getDonors() async {
    // Simulating network delay
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      DonorModel(
        id: '1',
        name: 'Yasin Hossain',
        imageUrl: 'assets/images/admin.jpg', // Placeholder
        location: 'Mohammedpur, Dhaka',
        bloodGroup: 'A+',
      ),
      DonorModel(
        id: '2',
        name: 'Mohammed Sami',
        imageUrl: 'assets/images/admin.jpg', // Placeholder
        location: 'Mirpur 10, Dhaka',
        bloodGroup: 'AB+',
      ),
      DonorModel(
        id: '3',
        name: 'Rahimun Islam',
        imageUrl: 'assets/images/admin.jpg', // Placeholder
        location: 'Chittagong',
        bloodGroup: 'B-',
      ),
      DonorModel(
        id: '4',
        name: 'Rumana',
        imageUrl: 'assets/images/admin.jpg', // Placeholder
        location: 'Lakshmipur',
        bloodGroup: 'O+',
      ),
      DonorModel(
        id: '5',
        name: 'Jubayer Ahmed',
        imageUrl: 'assets/images/admin.jpg', // Placeholder
        location: 'Mohammedpur, Dhaka',
        bloodGroup: 'A+',
      ),
    ];
  }
}
