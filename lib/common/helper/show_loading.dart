import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';
import 'package:whatsapp_messenger/common/utils/colors.dart';

showLoading({
  required BuildContext context,
  required String message,
}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CircularProgressIndicator(
                    color: CustomColors.greenDark,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                      child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 15,
                      color: context.theme.greyColor,
                      height: 1.5,
                    ),
                  ))
                ],
              ),
            ],
          ),
        );
      });
}
