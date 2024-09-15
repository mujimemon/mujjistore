import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/homepage/bottomnavig.dart';
import 'package:mujjistore/Screen/homepage/productbuttonpage.dart';
import 'package:mujjistore/utilize/colors.dart';
import 'package:mujjistore/widgets/categoryicon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
        if (nextPage > 2) nextPage = 0; // Loop back to the first page
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 5),
                Text(
                  'Select Location',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search and Filter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for products',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Banner (PageView)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: SizedBox(
                height: 170, // Fixed height for banners
                child: PageView(
                  controller: _pageController,
                  children: [
                    Image.asset('assets/banner/b2.jpg', fit: BoxFit.cover),
                    Image.asset('assets/banner/b1.jpeg', fit: BoxFit.cover),
                    Image.asset('assets/banner/b3.jpg', fit: BoxFit.cover),
                  ],
                ),
              ),
            ),
            // Categories Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 17),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryIcon(imagePath: "assets/icon/tc1.jpg", label: "T-shirts"),
                  CategoryIcon(imagePath: "assets/icon/c7.jpeg", label: "Pants"),
                  CategoryIcon(imagePath: "assets/icon/c3.jpeg", label: "Jackets"),
                  CategoryIcon(imagePath: "assets/icon/c4.jpeg", label: "Dresses"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            
            // Product Section
            const ProductButtonPage(), // Make sure this section is scrollable within the HomeView

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const NavigatorMenu(),
    );
  }
}
