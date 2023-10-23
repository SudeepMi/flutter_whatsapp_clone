import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/models/user_model.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';

class ChatPage extends StatelessWidget {
  final UserModel user;
  const ChatPage({super.key, required this.user});

  String lastSeenMessage(lastSeen) {
    DateTime now = DateTime.now();
    Duration differenceDuration =
        now.difference(DateTime.fromMillisecondsSinceEpoch(lastSeen));
    String mesage = differenceDuration.inSeconds > 59
        ? differenceDuration.inMinutes > 59
            ? differenceDuration.inDays > 23
                ? "${differenceDuration.inDays} ${differenceDuration.inDays == 1 ? 'day' : 'days'}"
                : "${differenceDuration.inHours} ${differenceDuration.inHours == 1 ? 'hour' : 'hours'}"
            : "${differenceDuration.inMinutes} ${differenceDuration.inMinutes == 1 ? 'minute' : 'miutes'}"
        : "few moments ago";
    return mesage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              const Icon(Icons.arrow_back_rounded),
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(user.profileImageUrl),
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.username,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              "Last seen 3:00 PM",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.video_call,
            iconColor: Colors.white,
          ),
          CustomIconButton(
            onTap: () {},
            icon: Icons.call,
            iconColor: Colors.white,
          ),
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
