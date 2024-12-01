import 'package:anime_discovery_app/common/helper/navigation/app_navigation.dart';
import 'package:anime_discovery_app/core/configs/theme/app_colors.dart';
import 'package:anime_discovery_app/presentation/auth/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 100, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signupText(),
              const SizedBox(
                height: 30.0,
              ),
              _emailField(),
              const SizedBox(
                height: 20.0,
              ),
              _passwordField(),
              const SizedBox(
                height: 20.0,
              ),
              _confirmPasswordField(),
              const SizedBox(
                height: 60.0,
              ),
              _signupButton(),
              const SizedBox(
                height: 20.0,
              ),
              _signinText(context)
            ],
          )),
    );
  }

  Widget _signupText() {
    return const Text(
      "Sign Up",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Already you have an account?"),
      TextSpan(
          text: "Sign In",
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Navigate User to the sign up page;
              AppNavigator.push(context, SigninPage());
            })
    ]));
  }

  Widget _emailField() {
    return const TextField(
      decoration: InputDecoration(hintText: "Email"),
    );
  }

  Widget _passwordField() {
    return const TextField(
      decoration: InputDecoration(hintText: "Password"),
    );
  }

  Widget _confirmPasswordField() {
    return const TextField(
      decoration: InputDecoration(hintText: "Confirm Password"),
    );
  }

  Widget _signupButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () async {},
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
        child: const Text("Sign Up"),
      ),
    );
  }
}
