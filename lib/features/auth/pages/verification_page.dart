import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_messenger/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_messenger/features/auth/widgets/custom_text_field.dart';

class VerificationPage extends ConsumerWidget {
  const VerificationPage({
    super.key,
    required this.smsCodeId,
    required this.phoneNumber,
  });

  final String smsCodeId;
  final String phoneNumber;

  void verifySmsCode(BuildContext context, WidgetRef ref, String smsCode) {
    ref.read(authControllerProivder).verifySmsCode(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          "Verify Your phone number",
          style: TextStyle(
            color: context.theme.authAppBarTextColor,
          ),
        ),
        centerTitle: true,
        actions: [CustomIconButton(onTap: () {}, icon: Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                        text: "Yo have tried to register +9779810697766 "),
                    TextSpan(
                      text: "Wrong Number",
                      style: TextStyle(
                        color: context.theme.blueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomTextField(
                onTap: () {},
                hintText: "- - -  - - -",
                fontSize: 30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                readOnly: false,
                onChanged: (value) {
                  if (value.length == 6) {
                    verifySmsCode(context, ref, value);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Enter 6 digit code",
              style: TextStyle(color: context.theme.greyColor),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: context.theme.greyColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Resend SMS",
                  style: TextStyle(color: context.theme.greyColor),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(color: context.theme.blueColor!.withOpacity(0)),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.call,
                  color: context.theme.greyColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Call Me",
                  style: TextStyle(color: context.theme.greyColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
