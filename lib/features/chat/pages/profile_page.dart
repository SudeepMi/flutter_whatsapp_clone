import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme.dart';
import 'package:whatsapp_messenger/common/helper/last_seen.dart';
import 'package:whatsapp_messenger/common/models/user_model.dart';
import 'package:whatsapp_messenger/common/utils/colors.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_messenger/features/chat/widgets/custom_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverPersistentDelegate(user: user),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        user.username,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.phoneNumber,
                        style: TextStyle(
                          fontSize: 20,
                          color: context.theme.greyColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Last seen ${lastSeenMessage(user.lastSeen)} ago"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconWithText(icon: Icons.call, message: 'Call'),
                          iconWithText(
                              icon: Icons.video_call, message: 'Video'),
                          iconWithText(icon: Icons.search, message: 'Search'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ListTile(
                  contentPadding: EdgeInsets.only(left: 30),
                  title: Text("Hey There I am using WhatsApp"),
                  subtitle: Text("17th Feb"),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomListTile(
                  title: 'Mute Notification',
                  leading: Icons.notifications_off,
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),
                const CustomListTile(
                  title: 'Custom Notification',
                  leading: Icons.music_note_rounded,
                ),
                CustomListTile(
                  title: 'Media Visibility',
                  leading: Icons.photo,
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomListTile(
                  title: 'Encryption',
                  leading: Icons.lock,
                  sub: 'All messages are encrypted',
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                const CustomListTile(
                  title: 'Disappearing messages',
                  leading: Icons.timer,
                  sub: 'Off',
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: CustomIconButton(
                    icon: Icons.group,
                    background: CustomColors.greenDark,
                    iconColor: Colors.white,
                    onTap: () {},
                  ),
                  title: Text("Create group with ${user.username}"),
                ),
                const SizedBox(
                  height: 5,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 25, right: 10),
                  leading: const Icon(
                    Icons.block,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Block ${user.username}",
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  iconWithText({required IconData icon, required String message}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
            color: CustomColors.greenDark,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: const TextStyle(
              color: CustomColors.greenDark,
            ),
          ),
        ],
      ),
    );
  }
}

class SliverPersistentDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight = 180;
  final double minHeight = kToolbarHeight + 25;
  final double maxImageSize = 130;
  final double minImageSize = 40;

  final UserModel user;

  SliverPersistentDelegate({required this.user});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final size = MediaQuery.of(context).size;
    final percent = shrinkOffset / (maxHeight - 35);
    final percent2 = shrinkOffset / (maxHeight);
    final cureentImgSize = (maxImageSize * (1 - (percent))).clamp(
      minImageSize,
      maxImageSize,
    );
    final currentImgPosition = (((size.width / 2) - 65) * (1 - percent)).clamp(
      minImageSize,
      maxImageSize,
    );
    return Container(
      color: Theme.of(context)
          .appBarTheme
          .backgroundColor!
          .withOpacity(percent2 * 2 > 1 ? 1 : 0),
      child: Container(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).viewPadding.top + 15,
              left: currentImgPosition + 50,
              child: Text(
                user.username,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(percent2),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: MediaQuery.of(context).viewPadding.top + 5,
              child: const BackButton(
                color: Colors.white,
              ),
            ),
            Positioned(
              right: 0,
              top: MediaQuery.of(context).viewPadding.top + 5,
              child: CustomIconButton(
                icon: Icons.more_vert,
                iconColor: Colors.white,
                onTap: () {},
              ),
            ),
            Positioned(
              left: currentImgPosition,
              top: MediaQuery.of(context).viewPadding.top + 5,
              bottom: 0,
              child: Hero(
                tag: 'profile',
                child: Container(
                  width: cureentImgSize,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                        user.profileImageUrl,
                      ))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
