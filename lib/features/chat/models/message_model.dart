import 'dart:io';

class Message {
  final String id;
  final String senderId;
  final List<String> receiverIds;
  final String text;
  final List<File> files;
  final int createdAt;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverIds,
    required this.text,
    required this.files,
    required this.createdAt,
  });
}









// Local State Management - follow provider architecture
// - local variable manipulate/manage
// - for a single screen


// Global State Management - follow provider architecture
// - global varialbe manipulate/manage
// - for multiple screens






















