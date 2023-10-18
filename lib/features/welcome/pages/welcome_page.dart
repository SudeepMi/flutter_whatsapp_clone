import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';
import 'package:whatsapp_messenger/common/routes/routes.dart';
import 'package:whatsapp_messenger/features/welcome/widgets/elevated_button.dart';
import 'package:whatsapp_messenger/features/welcome/widgets/language_button.dart';
import 'package:whatsapp_messenger/features/welcome/widgets/privacy_terms.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  navigateToLoginPage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: CustomColors.backgroundDark,
        body: Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Image.asset("assets/images/circle.png",
                  color: context.theme.circleImageColor),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: Column(
            children: [
              const Text(
                "Welcomee to Whatup",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const PrivacyAndTerms(),
              CustomElevatedButton(
                text: "AGREE AND CONTNUE",
                onPressed: () => navigateToLoginPage(context),
              ),
              const SizedBox(
                height: 60,
              ),
              const LanguageButton()
            ],
          ),
        )
      ],
    ));
  }
}
