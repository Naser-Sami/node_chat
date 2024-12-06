import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

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
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    context.read<AuthBloc>().add(
          RegisterEvent(
            username: _usernameController.text.trim(),
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

              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // Register button
                  return Padding(
                    padding: const EdgeInsets.all(TPadding.p24),
                    child: ElevatedButton(
                      onPressed: _onRegister,
                      child: const TextWidget('Register'),
                    ),
                  );
                },
                listener: (context, state) {
                  if (state is AuthSuccessState) {
                    context.go('/ConversationsPage');
                  }

                  if (state is AuthFailureState) {
                    THelperFunctions.showToastBar(
                      context,
                      TextWidget(state.error),
                    );
                  }
                },
              ),

              // Login link
              Center(
                child: GestureDetector(
                  onTap: () => context.go('/'),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
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
