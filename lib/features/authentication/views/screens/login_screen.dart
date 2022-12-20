import 'package:chatter_box/features/authentication/views/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/views/widgets/app_button.dart';
import '../../../shared/views/widgets/app_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _headerBuilder(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    _inputsBuilder(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    _loginButtonBuilder(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _forgetPasswordBuilder(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              _registerBuilder(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerBuilder() {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svgs/auth.svg',
          color: Colors.deepPurple,
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          'Welcome to Chatter Box!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          'Keep your data safe!',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _inputsBuilder() {
    return Column(
      children: const [
        AppInput(
          hintText: 'Email',
        ),
        SizedBox(
          height: 10.0,
        ),
        AppInput(
          hintText: 'Password',
          isPassword: true,
        ),
      ],
    );
  }

  Widget _loginButtonBuilder() {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            value: 'Login',
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _forgetPasswordBuilder() {
    return const Text(
      'Forgot Password?',
      style: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _registerBuilder(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
          },
          child: const Text(
            'Register Now',
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
