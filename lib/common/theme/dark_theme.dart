// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';
import 'package:whatsapp_messenger/common/utils/colors.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    extensions: [CustomTheme.darkMode],
    backgroundColor: CustomColors.backgroundDark,
    scaffoldBackgroundColor: CustomColors.backgroundDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.greenDark,
        foregroundColor: CustomColors.backgroundDark,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: CustomColors.greyBackground,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: CustomColors.greyDark,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: CustomColors.greenDark,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: CustomColors.greenDark,
          width: 2,
        ),
      ),
      unselectedLabelColor: CustomColors.greyDark,
      labelColor: CustomColors.greenDark,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: CustomColors.greyBackground,
      modalBackgroundColor: CustomColors.greyBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dialogBackgroundColor: CustomColors.backgroundDark,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
