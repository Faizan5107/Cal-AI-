import 'package:flutter/cupertino.dart';

class SmoothScrollPhysics extends ScrollPhysics {
  const SmoothScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  SmoothScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SmoothScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    final simulation = super.createBallisticSimulation(position, velocity);

    if (simulation == null) return null;

    final itemExtent = 50.0;
    final target = (position.pixels / itemExtent).round() * itemExtent;

    return ScrollSpringSimulation(
      SpringDescription(mass: 80, stiffness: 100, damping: 1),
      position.pixels,
      target,
      velocity,
      tolerance: tolerance,
    );
  }
}
