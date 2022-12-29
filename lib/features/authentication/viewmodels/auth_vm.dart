import 'dart:io';

import 'package:chatter_box/features/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthVm extends ChangeNotifier {
  final BuildContext context;

  AuthVm({
    required this.context,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _photo;

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  File? get photo => _photo;

  void login() async {
    await AuthService.loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void registerUser() async {
    // upload photo to firebase storage

    // register user
    final uid = await AuthService.registerUser(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      photo: 'photo_url_from_firebase_storage',
    );

    if (uid != null) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      updatePhoto(
        File(pickedImage.path),
      );
    }
  }

  void updatePhoto(final File newVal) {
    _photo = newVal;
    notifyListeners();
  }
}
