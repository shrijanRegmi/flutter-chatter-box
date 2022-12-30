import 'package:chatter_box/features/authentication/services/auth_service.dart';
import 'package:chatter_box/features/chat/services/chat_service.dart';
import 'package:chatter_box/features/shared/views/widgets/app_input.dart';
import 'package:flutter/material.dart';

import '../widgets/chats_list_widgets/chats_list.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: _searchBuilder(),
      ),
      body: StreamBuilder(
        stream: ChatService.chatsList(),
        builder: (context, snap) {
          if (snap.hasData) {
            final chats = snap.data;

            if (chats != null) {
              return ChatsList(
                chats: chats,
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _searchBuilder() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
          bottom: 5.0,
        ),
        child: Row(
          children: [
            const Expanded(
              child: AppInput(
                hintText: 'Search Users...',
              ),
            ),
            IconButton(
              onPressed: () {
                AuthService.logoutUser();
              },
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
