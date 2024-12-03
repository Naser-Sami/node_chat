import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    context.read<AuthBloc>().add(
          LoginEvent(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          ),
        );
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

              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // Login button
                  return Padding(
                    padding: const EdgeInsets.all(TPadding.p24),
                    child: ElevatedButton(
                      onPressed: _onLogin,
                      child: const TextWidget('Login'),
                    ),
                  );
                },
                listener: (context, state) {
                  if (state is AuthSuccessState) {
                    context.go('/ChatPage');
                  }

                  if (state is AuthFailureState) {
                    THelperFunctions.showToastBar(
                      context,
                      TextWidget(state.error),
                    );
                  }
                },
              ),

              // Move to Register page
              Center(
                child: GestureDetector(
                  onTap: () => context.go('/RegisterPage'),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
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
