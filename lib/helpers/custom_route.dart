import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    WidgetBuilder builder,
    RouteSettings settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child,
      transitionType: SharedAxisTransitionType.horizontal,
    );
    // animation = CurvedAnimation(
    //   curve: Curves.easeInOut,
    //   parent: animation,
    // );
    // return FadeThroughTransition(
    //   child: child,
    //   animation: animation,
    //   secondaryAnimation: secondaryAnimation,
    //   fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
    // );
    // return FadeScaleTransition(
    //   animation: animation,
    //   child: child,
    // );
    // return FadeTransition(
    //   opacity: animation,
    //   child: child,
    // );

    // return SizeTransition(
    //   sizeFactor: animation,
    //   child: child,
    //   axis: Axis.horizontal,
    // );

    // return ScaleTransition(
    //   scale: animation,
    //   child: child,
    //   alignment: Alignment.topCenter,
    // );
  }
}
