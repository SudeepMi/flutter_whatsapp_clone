import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';
import 'package:whatsapp_messenger/features/auth/widgets/custom_text_field.dart';
import 'package:whatsapp_messenger/features/welcome/widgets/elevated_button.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          "Profile Info",
          style: TextStyle(color: context.theme.authAppBarTextColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Text(
              "Please provide your name and an option profile picture",
              textAlign: TextAlign.center,
              style: TextStyle(color: context.theme.greyColor),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.theme.photoIconBgColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Icon(
                  Icons.add_a_photo_rounded,
                  size: 48,
                  color: context.theme.photoIconColor,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextField(
                    onTap: () {},
                    hintText: "Enter your name",
                    textAlign: TextAlign.left,
                    autoFocus: true,
                    keyboardType: TextInputType.name,
                    readOnly: false,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: context.theme.greyColor,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        text: "NEXT",
        onPressed: () {},
        buttonWidth: 90,
      ),
    );
  }
}
