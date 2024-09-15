import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mujjistore/Screen/Login/loginscreen.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

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
     
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
              
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
              "Already have an account?",
              style: TextStyle(fontSize: 15),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              child: const Text(
                'Log In',
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
