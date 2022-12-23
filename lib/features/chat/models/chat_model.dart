class Chat {
  final String id;
  final List<String> userIds;
  final int unreadMessagesCount;
  final int createdAt;
  final int updatedAt;

  Chat({
    required this.id,
    required this.userIds,
    required this.unreadMessagesCount,
    required this.createdAt,
    required this.updatedAt,
  });
}
