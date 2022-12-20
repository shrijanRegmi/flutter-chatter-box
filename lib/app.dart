import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/authentication/views/screens/login_screen.dart';

class ChatterBox extends StatelessWidget {
  const ChatterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatter Box',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
