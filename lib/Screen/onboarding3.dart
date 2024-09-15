import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/Sign%20up/signup.dart';
import 'package:mujjistore/Screen/homepage/home.dart';
import 'package:mujjistore/utilize/colors.dart';

class BoardingScreen3 extends StatelessWidget {
  const BoardingScreen3({super.key});

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
                  'assets/s2.JPG',
                  height: 380,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Sign Up Now',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Join our community by registering with us! Enjoy exclusive access to special offers, track your orders, and manage your personal preferences seamlessly. Sign up today to enhance your shopping experience!',
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
                  MaterialPageRoute(builder: (context) => SignupView()),
                );
              },
              child: const Text(
                'Sign Up',
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
