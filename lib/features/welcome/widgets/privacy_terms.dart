import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Read our ",
          style: TextStyle(color: context.theme.greyColor, height: 1.5),
          children: [
            TextSpan(
                text: 'privacy ploicy ',
                style: TextStyle(color: context.theme.blueColor)),
            const TextSpan(
              text: 'Tap "Agree and Continue" to accept the ',
            ),
            TextSpan(
                text: 'Terms of services',
                style: TextStyle(color: context.theme.blueColor)),
          ],
        ),
      ),
    );
  }
}
