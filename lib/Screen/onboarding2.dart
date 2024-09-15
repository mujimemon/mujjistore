import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/homepage/home.dart';
import 'package:mujjistore/Screen/onboarding3.dart';
import 'package:mujjistore/utilize/colors.dart';

class BoardingScreen2 extends StatelessWidget {
  const BoardingScreen2({super.key});

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
                  'assets/s3.JPG',
                  height: 380,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Checkout Your Favorite T-shirt',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Finalize your purchase and get your favorite T-shirt delivered to your doorstep. Enjoy a seamless checkout process and track your order with ease.',
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
                  MaterialPageRoute(builder: (context) => BoardingScreen3()),
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
