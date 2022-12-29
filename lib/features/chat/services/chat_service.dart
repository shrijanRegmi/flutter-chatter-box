import 'package:chatter_box/features/chat/models/chat_model.dart';
import 'package:chatter_box/features/chat/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatService {
  static final _fs = FirebaseFirestore.instance;

  // send message to receivers
  static void sendMessage({
    required final Message message,
  }) async {
    try {
      final currentTime = DateTime.now().millisecondsSinceEpoch;

      final chatRef = _fs.collection('chats').doc('text_chat_id');
      final messageRef = chatRef.collection('messages').doc();

      message.id = messageRef.id;

      await messageRef.set({
        'id': message.id,
        'sender_id': message.senderId,
        'receiver_ids': message.receiverIds,
        'text': message.text,
        'files': message.files,
        'created_at': message.createdAt,
      });

      List<String> userIds = [];
      userIds = message.receiverIds;
      userIds.add(message.senderId);

      final chat = Chat(
        id: chatRef.id,
        userIds: userIds,
        unreadMessagesCount: 0,
        lastMessageId: message.id!,
        createdAt: currentTime,
        updatedAt: currentTime,
      );

      await chatRef.set({
        'id': chat.id,
        'user_ids': chat.userIds,
        'last_message_id': chat.lastMessageId,
        'unread_messages_count': chat.unreadMessagesCount,
        'created_at': chat.createdAt,
        'updated_at': chat.updatedAt,
      });
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Error!!!: Sending message');
    }
  }

  // create stream of messages collection
  static Stream<List<Message>> messagesList() {
    return _fs
        .collection('chats')
        .doc('text_chat_id')
        .collection('messages')
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(
      (snap) {
        List<Message> messages = [];

        final documents = snap.docs;
        for (final document in documents) {
          final data = document.data();

          final message = Message(
            id: data['id'],
            senderId: data['sender_id'],
            receiverIds: List<String>.from(
              data['receiver_ids'],
            ),
            text: data['text'],
            files: List<String>.from(
              data['files'],
            ),
            createdAt: data['created_at'],
          );

          messages.add(message);
        }

        return messages;
      },
    );
  }
}

// collection -> .add()
// doc -> .set()

// the lists in firestore documents are of type dynamic -> List<dynamic>
// but we require List<String>
