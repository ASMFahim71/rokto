import 'package:flutter/material.dart';
import 'package:rokto/features/find_doners/view/find_donors_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FindDonorsScreen(isBackButtonEnabled: false);
  }
}
