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
      body: const ChatsList(),
    );
  }

  Widget _searchBuilder() {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
          bottom: 5.0,
        ),
        child: AppInput(
          hintText: 'Search Users...',
        ),
      ),
    );
  }
}
