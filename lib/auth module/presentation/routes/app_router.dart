import 'package:covid_pandemic/auth%20module/presentation/routes/screens.dart';
import 'package:covid_pandemic/auth%20module/presentation/screens/forgetPassword/forget_password_screen.dart';
import 'package:covid_pandemic/auth%20module/presentation/screens/landing/landing_page.dart';
import 'package:covid_pandemic/auth%20module/presentation/screens/signIn/sign_in_screen.dart';
import 'package:covid_pandemic/auth%20module/presentation/screens/signUp/sign_up_screen.dart';
import 'package:covid_pandemic/presentation/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.landingScreen:
        return MaterialPageRoute(builder: (ctx) => const LandingPage());
      case Screens.signInScreen:
        return MaterialPageRoute(builder: (ctx) => const SignInScreen());
      case Screens.forgetPasswordScreen:
        return MaterialPageRoute(builder: (ctx) => ForgetPasswordScreen());
      case Screens.homeScreen:
        return MaterialPageRoute(builder: (ctx) => const BottomNavScreen());
      case Screens.signUpScreen:
        return MaterialPageRoute(builder: (ctx) => const SignUpScreen());
    }
  }
}
