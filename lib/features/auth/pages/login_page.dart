// ignore_for_file: deprecated_member_use

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';
import 'package:whatsapp_messenger/common/helper/show_alert_dialog.dart';
import 'package:whatsapp_messenger/common/utils/colors.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_messenger/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_messenger/features/auth/widgets/custom_text_field.dart';
import 'package:whatsapp_messenger/features/welcome/widgets/elevated_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phoneNumber = phoneNumberController.text;
    final countryCode = countryCodeController.text;

    if (phoneNumber.length < 9) {
      return showAlertDialog(
          context: context, message: "phone number is not valid");
    }
    if (phoneNumber.isEmpty) {
      return showAlertDialog(
          context: context, message: "phone number is not valid");
    }

    ref.read(authControllerProivder).sendSmsCode(
          context: context,
          phoneNumber: '+$countryCode$phoneNumber',
        );
  }

  showCountryCodePicker() {
    showCountryPicker(
      context: context,
      onSelect: (country) {
        countryCodeController.text = country.phoneCode;
        countryNameController.text = country.name;
      },
      showPhoneCode: true,
      favorite: ['NEP'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).backgroundColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: context.theme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.greyColor),
          prefixIcon: const Icon(
            Icons.language,
            color: CustomColors.greenDark,
          ),
          hintText: "Search Country Code",
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: context.theme.greyColor!.withOpacity(0.3)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.greenDark),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'Nepal');
    countryCodeController = TextEditingController(text: "977");
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryCodeController.dispose();
    countryNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "Enter your Phone Number",
          style: TextStyle(color: context.theme.authAppBarTextColor),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Whatup needs to verify your phone number ",
                style: TextStyle(
                  color: context.theme.greyColor,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "whats my number?",
                    style: TextStyle(color: context.theme.blueColor),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: CustomTextField(
              controller: countryNameController,
              onTap: () => showCountryCodePicker(),
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: CustomColors.greenDark,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: () => showCountryCodePicker(),
                    controller: countryCodeController,
                    prefixText: "+",
                    readOnly: true,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextField(
                    onTap: () {},
                    controller: phoneNumberController,
                    hintText: 'Phone Number',
                    textAlign: TextAlign.left,
                    readOnly: false,
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "carrier charge may apply",
            style: TextStyle(color: context.theme.greyColor),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodeToPhone,
        text: 'NEXT',
        buttonWidth: 90,
      ),
    );
  }
}
