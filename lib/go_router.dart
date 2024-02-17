import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant2/ui/news/ui/news_main.dart';
import 'package:instant2/ui/news/ui/news_settings.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NewMainScreen(),
    ),
    // GoRoute(
    //   path: NewsSettingsScreen.routeName,
    //   builder: (context, state) => const NewsSettingsScreen(),
    // ),
    GoRoute(
      path: NewsSettingsScreen.routeName,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const NewsSettingsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Change the opacity of the screen using a Curve based on the the animation's
            // value
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      },
    ),
  ],
);
