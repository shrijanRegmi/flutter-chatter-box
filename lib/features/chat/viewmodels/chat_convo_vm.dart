import 'package:chatter_box/features/chat/services/chat_service.dart';
import 'package:chatter_box/features/user/models/user_model.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class ChatConvoVm extends ChangeNotifier {
  final TextEditingController _messageController = TextEditingController();

  TextEditingController get messageController => _messageController;

  // send message
  void sendMessage({
    required final AppUser? appUser,
    required final AppUser? user,
  }) {
    final message = Message(
      senderId: appUser!.id,
      receiverIds: [user!.id],
      text: _messageController.text,
      files: [],
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    ChatService.sendMessage(
      message: message,
    );
    _messageController.text = '';
  }
}
