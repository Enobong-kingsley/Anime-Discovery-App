import 'package:anime_discovery_app/common/helper/navigation/app_navigation.dart';
import 'package:anime_discovery_app/core/configs/theme/app_colors.dart';
import 'package:anime_discovery_app/presentation/auth/pages/signup.dart';
import 'package:anime_discovery_app/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, left: 16, right: 16),
        child: Form(
          // Wrap the content with a Form widget
          key: _formKey, // Assign the GlobalKey to the Form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signinText(),
              const SizedBox(
                height: 30.0,
              ),
              _emailField(),
              const SizedBox(
                height: 20.0,
              ),
              _passwordField(),
              const SizedBox(
                height: 60.0,
              ),
              _signinButton(context),
              const SizedBox(
                height: 20.0,
              ),
              _signupText(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      "Sign In",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Don't you have an account?"),
      TextSpan(
          text: "Sign Up",
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, const SignupPage());
            })
    ]));
  }

  Widget _emailField() {
    return TextFormField(
      // Use TextFormField for email field
      decoration: const InputDecoration(hintText: "Email"),
      validator: (value) {
        // Add validation for email
        if (value == null || value.isEmpty) {
          return 'Please enter your email address';
        }
        return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      // Use TextFormField for password field
      decoration: const InputDecoration(hintText: "Password"),
      validator: (value) {
        // Add validation for password (optional)
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      obscureText: true, // Hide password text
    );
  }

  Widget _signinButton(
    BuildContext context,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Validate form before navigation
            AppNavigator.push(context, const HomePage());
          }
        },
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
        child: const Text("Sign In"),
      ),
    );
  }
}
