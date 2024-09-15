import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mujjistore/Screen/Sign%20up/signup.dart';

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "------- Or sign in with -------",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        // Social media icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // Facebook login action
              },
              icon: const Icon(FontAwesomeIcons.facebook, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                
              },
              icon: const Icon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
            ),
            IconButton(
              onPressed: () {
                
              },
              icon: const Icon(FontAwesomeIcons.google, color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 40),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 15),
            ),
            TextButton(
              onPressed: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupView()));
              },
              child: const Text(
                'Sign up',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

