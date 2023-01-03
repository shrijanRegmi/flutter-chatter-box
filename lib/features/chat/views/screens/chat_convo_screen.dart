import 'package:chatter_box/features/chat/models/chat_model.dart';
import 'package:chatter_box/features/chat/services/chat_service.dart';
import 'package:chatter_box/features/chat/viewmodels/chat_convo_vm.dart';
import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/chats_convo_widgets/message_input.dart';
import '../widgets/chats_convo_widgets/messages_list.dart';

class ChatConvoScreenArgs {
  final AppUser user;
  final String? chatId;

  ChatConvoScreenArgs({
    required this.user,
    this.chatId,
  });
}

class ChatConvoScreen extends StatelessWidget {
  final AppUser user;
  final String? chatId;

  const ChatConvoScreen({
    super.key,
    required this.user,
    this.chatId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatConvoVm(),
      builder: (context, child) {
        final vm = Provider.of<ChatConvoVm>(context);
        final appUser = Provider.of<AppUser?>(context);
        final chatsList = Provider.of<List<Chat>>(context);

        Chat? chat;
        for (var element in chatsList) {
          if (element.userIds.contains(user.id)) {
            chat = element;
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              user.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: chat == null
              ? const SizedBox()
              : StreamBuilder(
                  stream: ChatService.messagesList(
                    chatId: chat.id,
                  ),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      final messages = snap.data;

                      if (messages != null) {
                        return MessagesList(
                          messages: messages,
                          user: user,
                        );
                      } else {
                        return Container();
                      }
                    } else {
                      return Container();
                    }
                  },
                ),
          bottomNavigationBar: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: MessageInput(
              controller: vm.messageController,
              onPressedSend: () {
                vm.sendMessage(
                  appUser: appUser,
                  user: user,
                  chatId: chat?.id,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
