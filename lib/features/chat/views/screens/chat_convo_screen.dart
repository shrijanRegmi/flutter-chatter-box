import 'package:flutter/material.dart';

import '../widgets/chats_convo_widgets/message_input.dart';
import '../widgets/chats_convo_widgets/messages_list.dart';

class ChatConvoScreen extends StatelessWidget {
  const ChatConvoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ram Bahadur',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const MessagesList(),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const MessageInput(),
      ),
    );
  }
}
