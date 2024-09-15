import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/homepage/home.dart';
import 'package:mujjistore/Screen/onboarding2.dart';
import 'package:mujjistore/utilize/colors.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.white,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/s1.JPG',
                  height: 380,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Explore Our Store',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                // Description Text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Uncover a curated selection of unique products designed to enhance your lifestyle.From the latest trends to timeless essentials, find exactly what you’re looking for.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 20, 17, 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Skip Button
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: AppColors.buttonColor,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
      
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
               Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BoardingScreen2()),
                );
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  color: AppColors.buttonColor,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
