import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokto/features/create_request/view/create_request_screen.dart';
import 'package:rokto/features/donation_request/view/donation_request_screen.dart';
import 'package:rokto/features/home/view/home_view.dart';
import 'package:rokto/features/home/view/navBar.dart';
import 'package:rokto/features/profile/view/profile_screen.dart';
import 'package:rokto/features/search_nav_bar/view/widgets/search_screen.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  int _selectedIndex = 0;
  late final PageController _pageController;

  final List<Widget> _screens = [
    const HomeView(),
    const SearchScreen(),
    const CreateRequestScreen(),
    const DonationRequestScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,

        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onIndexChanged: _onItemTapped,
      ),
      extendBody: true,
    );
  }
}
