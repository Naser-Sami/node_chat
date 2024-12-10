import 'dart:developer';

import 'package:flutter/cupertino.dart';

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
  navigatorKey: NavigationService.navigatorKey,
  // Set the navigatorKey
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
      name: 'Login',
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
      name: 'Register',
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
      name: 'Chats',
      path: '/ChatPage/:conversationId/:mate',
      pageBuilder: (context, state) {
        final conversationId = state.pathParameters['conversationId'] ?? '';
        final mate = state.pathParameters['mate'] ?? '';

        return CupertinoPage(
          child: ChatPage(
            conversationId: conversationId,
            mate: mate,
          ),
        );
      },
    ),
    GoRoute(
      name: 'Conversations',
      path: '/ConversationsPage',
      pageBuilder: (context, state) => const CupertinoPage(
        child: ConversationsPage(),
      ),
      redirect: (context, state) {
        return null;
      },
    ),
    GoRoute(
      name: 'Contacts',
      path: '/ContactsPage',
      pageBuilder: (context, state) => const CupertinoPage(
        child: ContactsPage(),
      ),
      redirect: (context, state) {
        return null;
      },
    ),
  ],
);
