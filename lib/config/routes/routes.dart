import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  // Add your navigator observers
  observers: [AppNavigatorObserver()],
  navigatorKey: NavigationService.navigatorKey, // Set the navigatorKey
  errorBuilder: (context, state) => ErrorPage(state.error.toString()),
  redirect: (context, state) {
    return null;
  },
  routes: [
    GoRoute(
      name: 'message_page',
      path: '/',
      pageBuilder: (context, state) => fadeTransitionPage(
        context,
        state,
        const MessagePage(),
      ),
      redirect: (context, state) {
        return null;
      },
    ),
  ],
);