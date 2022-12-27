import 'package:chatter_box/features/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthVm extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void login() async {
    final uid = await AuthService.loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (uid != null) {
      // navigate to home screen
    }
  }

  void registerUser() async {
    final uid = await AuthService.registerUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (uid != null) {
      // navigate to home screen
    }
  }
}
