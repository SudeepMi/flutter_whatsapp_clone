import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';

showAlertDialog(
    {required BuildContext context, required String message, String? btnTxt}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          message,
          style: TextStyle(
            color: context.theme.greyColor,
          ),
        ),
      );
    },
  );
}
