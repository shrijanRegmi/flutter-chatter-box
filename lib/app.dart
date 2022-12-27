import 'package:chatter_box/features/authentication/services/auth_service.dart';
import 'package:chatter_box/utils/app_router.dart';
import 'package:chatter_box/utils/app_routes.dart';
import 'package:chatter_box/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatterBox extends StatelessWidget {
  const ChatterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>(
      create: (context) => AuthService.checkAuthState(),
      initialData: null,
      builder: (context, child) {
        return MaterialApp(
          title: 'Chatter Box',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightPalette,
          darkTheme: AppTheme.darkPalette,
          initialRoute: AppRoutes.wrapper,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
