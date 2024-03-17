import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/who/who.dart';
import '../pages/work/work.dart';
import '../pages/blog/blog.dart';
import '../pages/intro/intro.dart';
import '../pages/opener/opener.dart';
import '../pages/application_shell.dart';

import '../components/deviceDetector.dart';
import '../utils/helpers/screen_helper.dart';
import '../utils/handlers/route_handler.dart';

GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Opener Router Used",
);

GlobalKey<NavigatorState> _siteNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Site Router Used",
);

class RouteManager {
  static const String homePage = "/";
  static const String introPage = "/intro";
  static const String whoPage = "/who";
  static const String workPage = "/work";
  static const String blogPage = "/blog";

  static Size size = logicalScreenSize;
  static String deviceType = deviceDetector(logicalScreenSize.width);
  static Color currentColor = Colors.black;
}

GoRouter router = GoRouter(
  // navigatorKey: _rootNavigatorKey,
  initialLocation: RouteHandler.homePage,
  routes: [
    ShellRoute(
      navigatorKey: _siteNavigatorKey,
      builder: (BuildContext context, GoRouterState state, child) {
        print(state);
        return ApplicationShell(child: child);
      },
      routes: [
        GoRoute(
          path: RouteHandler.homePage,
          // navigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            RouteManager.currentColor = Colors.black;
            return CustomTransitionPage(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = 0.00;
                const end = 1.00;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return FadeTransition(
                  opacity: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 750),
              child: OpenerPage(
                size: logicalScreenSize,
              ),
            );
          },
        ),
        GoRoute(
            path: RouteHandler.introPage,
            // parentNavigatorKey: _siteNavigatorKey,
            pageBuilder: (context, state) {
              RouteManager.currentColor = Color.fromRGBO(236, 131, 131, 1.0);
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, -1.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve),
                  );

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 750),
                child: IntroPage(size: logicalScreenSize),
              );
            }),
        GoRoute(
          path: RouteHandler.whoPage,
          // parentNavigatorKey: _siteNavigatorKey,
          pageBuilder: (context, state) {
            RouteManager.currentColor = Color.fromRGBO(14, 43, 133, 1.0);
            return CustomTransitionPage(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 750),
              child: WhoPage(
                size: logicalScreenSize,
              ),
            );
          },
        ),
        GoRoute(
            path: RouteHandler.workPage,
            // parentNavigatorKey: _siteNavigatorKey,
            pageBuilder: (context, state) {
              RouteManager.currentColor = Color.fromRGBO(56, 149, 131, 1.0);
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve),
                  );

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 750),
                child: WorkPage(
                  size: logicalScreenSize,
                ),
              );
            }),
        GoRoute(
          path: RouteHandler.blogPage,
          // parentNavigatorKey: _siteNavigatorKey,

          pageBuilder: (context, state) {
            RouteManager.currentColor = Color.fromRGBO(246, 223, 71, 1.0);
            return CustomTransitionPage(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 750),
              child: BlogPage(
                size: logicalScreenSize,
              ),
            );
          },
        )
      ],
    ),
  ],
);
