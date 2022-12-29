import 'package:chatter_box/features/chat/services/chat_service.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class ChatConvoVm extends ChangeNotifier {
  final TextEditingController _messageController = TextEditingController();

  TextEditingController get messageController => _messageController;

  // send message
  void sendMessage() {
    final message = Message(
      senderId: '21t5vfgOnMgCo2lsj6XxddWkhDk1',
      receiverIds: ['D42eYBmNvrSwVbOqdcpX7UEZXIK2'],
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
