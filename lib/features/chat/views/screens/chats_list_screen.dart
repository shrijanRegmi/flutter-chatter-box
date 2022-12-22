import 'package:flutter/material.dart';

import '../widgets/chats_list_widgets/chats_list.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatsList(),
    );
  }
}
