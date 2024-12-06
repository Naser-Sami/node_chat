
import 'dart:developer';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  // Add your navigator observers
  observers: [AppNavigatorObserver()],
  navigatorKey: NavigationService.navigatorKey, // Set the navigatorKey
  errorBuilder: (context, state) => ErrorPage(state.error.toString()),
  redirect: (context, state) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token') ?? '';
    ApiClient.token = token;

    log('Token: $token');

    if (token.isEmpty) {
      return '/';
    }

    return null;
  },
  routes: [
    GoRoute(
      name: 'LoginPage',
      path: '/',
      pageBuilder: (context, state) => fadeTransitionPage(
        context,
        state,
        const LoginPage(),
      ),
      redirect: (context, state) {
        return null;
      },
    ),
    GoRoute(
      name: 'RegisterPage',
      path: '/RegisterPage',
      pageBuilder: (context, state) => fadeTransitionPage(
        context,
        state,
        const RegisterPage(),
      ),
      redirect: (context, state) {
        return null;
      },
    ),
    GoRoute(
      name: 'ChatPage',
      path: '/ChatPage',
      pageBuilder: (context, state) => fadeTransitionPage(
        context,
        state,
        const ChatPage(),
      ),
      redirect: (context, state) {
        return null;
      },
    ),
    GoRoute(
      name: 'ConversationsPage',
      path: '/ConversationsPage',
      pageBuilder: (context, state) => fadeTransitionPage(
        context,
        state,
        const ConversationsPage(),
      ),
      redirect: (context, state) {
        return null;
      },
    ),
  ],
);
