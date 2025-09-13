import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class AnimatedWrapper extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const AnimatedWrapper({
    super.key,
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
