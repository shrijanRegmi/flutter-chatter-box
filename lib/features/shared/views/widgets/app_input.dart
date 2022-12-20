import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String hintText;
  final bool isPassword;

  const AppInput({
    super.key,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade200,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: TextFormField(
        obscureText: isPassword,
        style: const TextStyle(
          fontSize: 14.0,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
