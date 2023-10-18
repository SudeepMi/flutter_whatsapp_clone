import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/features/auth/pages/login_page.dart';
import 'package:whatsapp_messenger/features/auth/pages/user_info_page.dart';
import 'package:whatsapp_messenger/features/auth/pages/verification_page.dart';
import 'package:whatsapp_messenger/features/welcome/pages/welcome_page.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String userinfo = 'user-info';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        );
      case login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => VerificationPage(
                  verificationId: args['verificationId'],
                  phoneNumber: args['phoneNumber'],
                ));
      case userinfo:
        return MaterialPageRoute(builder: (context) => const UserInfoPage());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("data"),
            ),
          ),
        );
    }
  }
}
