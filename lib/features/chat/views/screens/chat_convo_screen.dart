import 'package:chatter_box/features/chat/services/chat_service.dart';
import 'package:chatter_box/features/chat/viewmodels/chat_convo_vm.dart';
import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/chats_convo_widgets/message_input.dart';
import '../widgets/chats_convo_widgets/messages_list.dart';

class ChatConvoScreenArgs {
  final AppUser user;

  ChatConvoScreenArgs({
    required this.user,
  });
}

class ChatConvoScreen extends StatelessWidget {
  final AppUser user;
  const ChatConvoScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatConvoVm(),
      builder: (context, child) {
        final vm = Provider.of<ChatConvoVm>(context);
        final appUser = Provider.of<AppUser?>(context);

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
          body: StreamBuilder(
            stream: ChatService.messagesList(),
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
                );
              },
            ),
          ),
        );
      },
    );
  }
}
