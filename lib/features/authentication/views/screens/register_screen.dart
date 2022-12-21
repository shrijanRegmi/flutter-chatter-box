import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/views/widgets/app_button.dart';
import '../../../shared/views/widgets/app_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    _headerBuilder(context),
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

  Widget _headerBuilder(final BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svgs/auth.svg',
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          'Register to Chatter Box!',
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
          hintText: 'Name',
        ),
        SizedBox(
          height: 10.0,
        ),
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
            value: 'Register',
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _registerBuilder(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Login Now',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
