import 'package:chatter_box/features/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthVm extends ChangeNotifier {
  final BuildContext context;

  AuthVm({
    required this.context,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void login() async {
    await AuthService.loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void registerUser() async {
    final uid = await AuthService.registerUser(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (uid != null) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }
}
