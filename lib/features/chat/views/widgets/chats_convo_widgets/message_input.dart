import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final Function() onPressedSend;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onPressedSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 3.0,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.image,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type something awesome...',
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: onPressedSend,
            behavior: HitTestBehavior.opaque,
            child: const Icon(
              Icons.send,
            ),
          ),
        ],
      ),
    );
  }
}
