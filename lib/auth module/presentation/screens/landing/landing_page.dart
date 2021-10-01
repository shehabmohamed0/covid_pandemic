import 'package:covid_pandemic/auth%20module/constants/original_screen_dimensions.dart';

import 'package:covid_pandemic/auth%20module/presentation/screens/signIn/sign_in_screen.dart';
import 'package:covid_pandemic/presentation/screens/bottom_nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    OriginalScreen(screenSize);
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const SignInScreen();
          }

          return const BottomNavScreen();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator.adaptive();
        }
        return const Text('Error');
      },
    );
  }
}
