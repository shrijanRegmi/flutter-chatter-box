import 'package:flutter/material.dart';

import '../features/authentication/views/screens/login_screen.dart';
import '../features/authentication/views/screens/register_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route onGenerateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return _buildRoute(settings, const LoginScreen());
      case AppRoutes.registerScreen:
        return _buildRoute(settings, const RegisterScreen());
      default:
        return _buildRoute(settings, const LoginScreen());
    }
  }

  static Route _buildRoute(
    final RouteSettings settings,
    final Widget widget,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
