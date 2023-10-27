import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';
import 'package:whatsapp_messenger/common/helper/last_seen.dart';
import 'package:whatsapp_messenger/common/models/user_model.dart';
import 'package:whatsapp_messenger/common/routes/routes.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_messenger/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_messenger/features/chat/widgets/chat_text_feild.dart';

class ChatPage extends ConsumerWidget {
  final UserModel user;
  ChatPage({super.key, required this.user, required});
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              Hero(
                tag: 'profile',
                child: Container(
                  width: 32,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                        user.profileImageUrl,
                      ))),
                ),
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.profile,
              arguments: user,
            );
          },
          child: Column(
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
              StreamBuilder(
                stream: ref
                    .read(authControllerProivder)
                    .getUserPresenceStatus(uid: user.uid),
                builder: (_, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return const Text(
                      "connecting...",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    );
                  }
                  final singleUserModel = snapshot.data!;
                  final msg = lastSeenMessage(singleUserModel.lastSeen);
                  return Text(
                    msg,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  );
                },
              )
            ],
          ),
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
      body: Stack(
        children: [
          Image(
            height: double.maxFinite,
            width: double.maxFinite,
            image: const AssetImage("assets/images/doodle_bg.png"),
            fit: BoxFit.cover,
            color: context.theme.photoIconBgColor,
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              ),
              Container(
                alignment: const Alignment(0, 1),
                child: ChatTextField(
                  receiverId: user.uid,
                  scrollController: scrollController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
