import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';
import 'package:whatsapp_messenger/common/utils/colors.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    backgroundColor: CustomColors.backgroundLight,
    scaffoldBackgroundColor: CustomColors.backgroundLight,
    extensions: [CustomTheme.lightMode],
    appBarTheme: const AppBarTheme(
      backgroundColor: CustomColors.greenLight,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      unselectedLabelColor: Color(0xFFB3D9D2),
      labelColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.greenLight,
        foregroundColor: CustomColors.backgroundLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: CustomColors.backgroundLight,
      modalBackgroundColor: CustomColors.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dialogBackgroundColor: CustomColors.backgroundLight,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: CustomColors.greenDark,
      foregroundColor: Colors.white,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: CustomColors.greyDark,
      tileColor: CustomColors.backgroundLight,
    ),
    switchTheme: const SwitchThemeData(
      thumbColor: MaterialStatePropertyAll(Color(0xFF83939C)),
      trackColor: MaterialStatePropertyAll(Color(0xFFDADFE2)),
    ),
  );
}
