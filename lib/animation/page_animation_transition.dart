import 'package:flutter/cupertino.dart';

pageAnimationTransition(page, alignment, axis) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, otherAnimation) => page,
      transitionDuration: const Duration(milliseconds: 320),
      reverseTransitionDuration: const Duration(milliseconds: 320),
      transitionsBuilder: (context, animation, otherAnimation, child) {
        CurvedAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            reverseCurve: Curves.fastOutSlowIn,
            parent: animation);
        return Align(
          alignment: alignment,
          child: SizeTransition(
            sizeFactor: animation,
            child: page,
            axis: axis,
            axisAlignment: 0,
          ),
        );
      });
}
