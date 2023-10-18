import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/utils/colors.dart';

extension ExtendedTheme on BuildContext {
  CustomTheme get theme {
    return Theme.of(this).extension<CustomTheme>()!;
  }
}

class CustomTheme extends ThemeExtension<CustomTheme> {
  static const lightMode = CustomTheme(
    circleImageColor: Color(0xFF25D366),
    greyColor: CustomColors.greyLight,
    blueColor: CustomColors.blueLight,
    langBtnBgColor: Color(0xFFF7F8FA),
    langBtnHgColor: Color(0xFFE8E8ED),
    authAppBarTextColor: CustomColors.greenLight,
    photoIconBgColor: Color(0xFFF0F2F3),
    photoIconColor: Color(0xFF9DAAB3),
  );

  static const darkMode = CustomTheme(
    circleImageColor: CustomColors.greenDark,
    greyColor: CustomColors.greyDark,
    blueColor: CustomColors.blueDark,
    langBtnBgColor: Color(0xFF182229),
    langBtnHgColor: Color(0xFF09141A),
    authAppBarTextColor: Color(0xFFE9EDEF),
    photoIconBgColor: Color(0xFF283339),
    photoIconColor: Color(0xFF61717B),
  );

  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHgColor;
  final Color? authAppBarTextColor;
  final Color? photoIconBgColor;
  final Color? photoIconColor;

  const CustomTheme({
    this.photoIconBgColor,
    required this.circleImageColor,
    required this.greyColor,
    required this.authAppBarTextColor,
    required this.blueColor,
    required this.langBtnBgColor,
    required this.langBtnHgColor,
    this.photoIconColor,
  });

  @override
  ThemeExtension<CustomTheme> copyWith(
      {Color? circleImageColor,
      Color? greyColor,
      Color? blueColor,
      Color? langBtnBgColor,
      Color? langBtnHgColor,
      Color? authAppBarTextColor,
      Color? photoIconColor,
      Color? photoIconBgColor}) {
    return CustomTheme(
      circleImageColor: circleImageColor ?? this.circleImageColor,
      greyColor: greyColor ?? this.greyColor,
      blueColor: blueColor ?? this.blueColor,
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor,
      langBtnHgColor: langBtnHgColor ?? this.langBtnHgColor,
      authAppBarTextColor: authAppBarTextColor ?? this.authAppBarTextColor,
      photoIconBgColor: photoIconBgColor ?? this.photoIconBgColor,
      photoIconColor: photoIconColor ?? this.photoIconColor,
    );
  }

  @override
  ThemeExtension<CustomTheme> lerp(
      covariant ThemeExtension<CustomTheme>? other, double t) {
    if (other is! CustomTheme) return this;
    return CustomTheme(
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t),
      langBtnHgColor: Color.lerp(langBtnHgColor, other.langBtnHgColor, t),
      authAppBarTextColor:
          Color.lerp(authAppBarTextColor, other.authAppBarTextColor, t),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
    );
  }
}
