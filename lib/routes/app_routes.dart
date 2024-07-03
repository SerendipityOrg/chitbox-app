import 'package:flutter/material.dart';
import 'package:chitbox_app/features/SplashScreen/view/pages/splash_screen.dart';
import 'package:chitbox_app/features/auth/view/pages/login_page.dart';
import 'package:chitbox_app/features/home/DashboardScreen.dart';
import 'package:chitbox_app/features/onboarding/onboarding_screen.dart';
import 'package:chitbox_app/features/auth/view/pages/otp_screen.dart';

import '../features/Create_Account/view/pages/AccountCreatedScreen.dart';
import '../features/Create_Account/view/pages/CreateAccount.dart';
import '../features/Create_Account/view/pages/InvitationScreen.dart';
import '../features/Create_Account/view/pages/PersonalDetails_Screen.dart';
import '../features/Create_Account/view/pages/eKYCVerificationScreen.dart'; // Import the OTP screen

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String personalDetails = '/personal-details';
  static const String ekycVerification = '/ekyc-verification';
  static const String accountCreated = '/account-created';
  static const String dashboard = '/dashboard';
  static const String createAccount = '/create-account';
  static const String invitation = '/invitation';
  static const String onboarding = '/onboarding';
  static const String otp = '/otp'; // Add the OTP route

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case personalDetails:
        return MaterialPageRoute(builder: (_) => PersonalDetailsScreen());
      case ekycVerification:
        return MaterialPageRoute(builder: (_) => eKYCVerificationScreen());
      case accountCreated:
        return MaterialPageRoute(builder: (_) => AccountCreatedScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case createAccount:
        return MaterialPageRoute(builder: (_) => CreateAccount());
      case invitation:
        return MaterialPageRoute(builder: (_) => InvitationScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case otp:
        var phoneNumber = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OTPScreen(phoneNumber: phoneNumber));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}



