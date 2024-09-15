import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/addtocart.dart';
import 'package:mujjistore/Screen/Login/loginscreen.dart';
import 'package:mujjistore/Screen/Sign%20up/signup.dart';
import 'package:mujjistore/Screen/SplastScreen.dart';
import 'package:mujjistore/Screen/homepage/home.dart';
import 'package:mujjistore/Screen/wishlist/wishlist.dart';

void main() {
  runApp(const MujjiStore());
}

class MujjiStore extends StatelessWidget {
  const MujjiStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashView(),
        '/home': (context) => HomeView(),
        '/favorite': (context) => WishlistView(),
        '/login': (context) => LoginView(),
        '/signup': (context) => SignupView(),
        '/cart': (context) => const AddtoCart(), // Ensure this is correct
      },
    );
  }
}