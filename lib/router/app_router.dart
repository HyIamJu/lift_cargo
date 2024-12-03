import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lift_cargo_control/views/pages/history/history_view.dart';

import '../views/pages/home/home_view.dart';
import '../views/pages/login/login_view.dart';

GoRouter createRouter() {
  Widget buildPageTransition(Widget child, Animation<double> animation) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  return GoRouter(
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const Loginview(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              buildPageTransition(child, animation),
        ),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              buildPageTransition(child, animation),
        ),
      ),
      GoRoute(
        path: '/history',
        name: 'history',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HistoryView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              buildPageTransition(child, animation),
        ),
      ),
    ],
    initialLocation: '/login',
    debugLogDiagnostics: true,
    routerNeglect: true,
  );
}
