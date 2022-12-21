import 'package:chatter_box/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'features/authentication/views/screens/login_screen.dart';

class ChatterBox extends StatelessWidget {
  const ChatterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatter Box',
      theme: AppTheme().lightPalette(),
      darkTheme: AppTheme().darkPalette(),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
