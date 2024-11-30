import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:node_chat/config/routes/routes.dart';

import '/config/_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _showInputValues() {
    final email = _emailController.text;
    final password = _passwordController.text;

    log('Email: $email - Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormFieldWidget(
                controller: _emailController,
                hintText: 'Email',
                leadingIcon: Icons.email,
              ),
              TextFormFieldWidget(
                controller: _passwordController,
                hintText: 'Password',
                leadingIcon: Icons.lock,
                trailingIcon: Icons.visibility,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.all(TPadding.p24),
                child: ElevatedButton(
                  onPressed: _showInputValues,
                  child: const TextWidget('Login'),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => context.go('/RegisterPage'),
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      children: [
                        TextSpan(
                          text: 'Register here',
                          style: Theme.of(context).textTheme.bodyLarge?.apply(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
