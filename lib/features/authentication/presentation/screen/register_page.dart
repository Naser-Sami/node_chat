import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/config/_config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _showInputValues() {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    log('Username: $username - Email: $email - Password: $password');
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
                controller: _usernameController,
                hintText: 'Username',
                leadingIcon: Icons.person,
              ),
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
                  child: const TextWidget('Register'),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => context.go('/'),
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      children: [
                        TextSpan(
                          text: 'Login here',
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
