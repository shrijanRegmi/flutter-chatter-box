import 'package:chatter_box/features/chat/models/chat_model.dart';
import 'package:chatter_box/features/chat/services/chat_service.dart';
import 'package:chatter_box/features/chat/views/screens/chat_convo_screen.dart';
import 'package:chatter_box/features/shared/views/widgets/avatar_builder.dart';
import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:chatter_box/features/user/services/user_service.dart';
import 'package:chatter_box/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatsListItem extends StatelessWidget {
  final Chat chat;
  const ChatsListItem({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser?>(context);

    final userIds = chat.userIds;
    final userId = userIds.firstWhere((element) => element != appUser?.id);

    return StreamBuilder(
      stream: UserService.getUserFromFirestore(
        uid: userId,
      ),
      builder: (context, snap) {
        if (snap.hasData) {
          final user = snap.data;

          if (user != null) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.chatConvoScreen,
                  arguments: ChatConvoScreenArgs(
                    user: user,
                    chatId: chat.id,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AvatarBuilder(
                          imgUrl: user.photo,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        _bodyBuilder(user),
                      ],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    _counterBuilder(context),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }

  Widget _bodyBuilder(final AppUser user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        StreamBuilder(
          stream: ChatService.message(
            chatId: chat.id,
            messageId: chat.lastMessageId,
          ),
          builder: (context, snap) {
            if (snap.hasData) {
              final message = snap.data;

              if (message != null) {
                return Text(
                  message.text,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                );
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  Widget _counterBuilder(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: const Text(
        '12',
        style: TextStyle(
          fontSize: 10.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
