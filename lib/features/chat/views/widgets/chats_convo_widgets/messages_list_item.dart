import 'package:chatter_box/features/chat/models/message_model.dart';
import 'package:chatter_box/features/shared/views/widgets/avatar_builder.dart';
import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagesListItem extends StatelessWidget {
  final Message message;
  final bool isMyMessage;
  final AppUser user;

  const MessagesListItem({
    super.key,
    required this.message,
    required this.isMyMessage,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser?>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      child: Column(
        crossAxisAlignment:
            isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          AvatarBuilder(
            imgUrl: isMyMessage ? appUser!.photo : user.photo,
          ),
          const SizedBox(
            height: 10.0,
          ),
          _messageBoxBuilder(context),
        ],
      ),
    );
  }

  Widget _messageBoxBuilder(final BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 1.5,
      ),
      decoration: BoxDecoration(
        color: isMyMessage ? null : primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isMyMessage ? 10.0 : 0.0),
          topRight: Radius.circular(isMyMessage ? 0.0 : 10.0),
          bottomLeft: const Radius.circular(10.0),
          bottomRight: const Radius.circular(10.0),
        ),
        border: Border.all(
          color: isMyMessage ? primaryColor : Colors.transparent,
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Text(
        message.text,
        style: TextStyle(
          color: isMyMessage ? primaryColor : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
