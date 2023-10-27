import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.leading,
    this.sub,
    this.trailing,
  });

  final String title;
  final IconData leading;
  final String? sub;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.fromLTRB(25, 5, 10, 5),
      title: Text(title),
      subtitle: sub != null
          ? Text(
              sub!,
              style: TextStyle(color: context.theme.greyColor),
            )
          : null,
      leading: Icon(leading),
      trailing: trailing,
    );
  }
}
