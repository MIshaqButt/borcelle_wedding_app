import 'package:flutter/material.dart';

enum TransitionDirection { up, down, left, right }

class AppNavigator {
  AppNavigator._();

  static Future<dynamic> push(
    BuildContext context,
    Widget screen, {
    TransitionDirection direction = TransitionDirection.right,
  }) {
    return Navigator.push(
      context,
      _createRoute(screen, direction),
    );
  }

  static Future<dynamic> pushReplacement(
    BuildContext context,
    Widget screen, {
    TransitionDirection direction = TransitionDirection.right,
  }) {
    return Navigator.pushReplacement(
      context,
      _createRoute(screen, direction),
    );
  }

  static void pop(BuildContext context, [dynamic data]) {
    Navigator.of(context).pop(data);
  }

  static void popUntilFirst(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static Future<dynamic> removeAllPreviousAndPush(
    BuildContext context,
    Widget screen, {
    TransitionDirection direction = TransitionDirection.left,
  }) {
    return Navigator.pushAndRemoveUntil(
      context,
      _createRoute(screen, direction),
      (route) => false,
    );
  }

  static Route _createRoute(Widget screen, TransitionDirection direction) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin;
        Curve forwardCurve;
        Curve reverseCurve;

        switch (direction) {
          case TransitionDirection.up:
            begin = const Offset(0.0, 1.0);
            forwardCurve = Curves.easeOutBack; // bounce only for UP
            reverseCurve = Curves.easeIn; // smooth reverse
            break;
          case TransitionDirection.down:
            begin = const Offset(0.0, -1.0);
            forwardCurve = Curves.easeInOut;
            reverseCurve = Curves.easeInOut;
            break;
          case TransitionDirection.left:
            begin = const Offset(1.0, 0.0);
            forwardCurve = Curves.easeInOut;
            reverseCurve = Curves.easeInOut;
            break;
          case TransitionDirection.right:
            begin = const Offset(-1.0, 0.0);
            forwardCurve = Curves.easeInOut;
            reverseCurve = Curves.easeInOut;
            break;
        }

        const end = Offset.zero;

        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: forwardCurve,
          reverseCurve: reverseCurve,
        );

        final tween = Tween(begin: begin, end: end);

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
