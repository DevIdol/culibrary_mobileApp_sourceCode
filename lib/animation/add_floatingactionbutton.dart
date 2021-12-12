import 'package:flutter/cupertino.dart';

addFloatingActionButton(page) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, otherAnimation) => page,
      transitionDuration: const Duration(milliseconds: 320),
      reverseTransitionDuration: const Duration(milliseconds: 320),
      transitionsBuilder: (context, animation, otherAnimation, child) {
        CurvedAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            reverseCurve: Curves.fastOutSlowIn,
            parent: animation);
        return ScaleTransition(
          scale: animation,
          alignment: Alignment.bottomRight,
          child: child,
        );
      });
}
