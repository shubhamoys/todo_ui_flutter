import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_ui_flutter/core/utils/auth_utils.dart';
import 'package:todo_ui_flutter/features/auth/presentation/pages/login_screen.dart';
import 'package:todo_ui_flutter/features/task_details/presentation/pages/task_details_screen.dart';
import 'package:todo_ui_flutter/features/tasks/presentation/pages/tasks_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final isAuth = await AuthUtils.isAuthenticated();
    final isAuthRoute = state.matchedLocation == '/login' ||
        state.matchedLocation == '/register';

    // Redirect to login if not authenticated and trying to access protected routes
    if (!isAuth && !isAuthRoute) {
      return '/login';
    }

    // Prevent accessing auth routes when authenticated
    if (isAuth && isAuthRoute) {
      return '/';
    }

    return null;
  },
  routes: [
    // Landing/Tasks List Screen
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 300),
        child: const TaskScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween(begin: const Offset(1, 0), end: Offset.zero)
                  .chain(CurveTween(curve: Curves.easeInOut)),
            ),
            child: child,
          );
        },
      ),
    ),

// Task Details Screen
    GoRoute(
      path: '/task/:id',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 300),
        child: const TaskDetailScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween(begin: const Offset(1, 0), end: Offset.zero)
                  .chain(CurveTween(curve: Curves.easeInOut)),
            ),
            child: child,
          );
        },
      ),
    ),

    // Login Screen
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 300),
        child: const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween(begin: const Offset(1, 0), end: Offset.zero)
                  .chain(CurveTween(curve: Curves.easeInOut)),
            ),
            child: child,
          );
        },
      ),
    ),

    // Fade transition
    // GoRoute(
    //   path: '/login',
    //   pageBuilder: (context, state) => CustomTransitionPage(
    //     key: state.pageKey,
    //     transitionDuration: const Duration(milliseconds: 300),
    //     child: const LoginScreen(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       return FadeTransition(
    //         opacity: animation,
    //         child: child,
    //       );
    //     },
    //   ),
    // ),
  ],
);
