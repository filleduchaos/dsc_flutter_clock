import 'dart:math' as math;
import 'package:flutter/rendering.dart';

const kSmallRadius = 3.0;
const kLargeRadius = 5.0;

double angleFrom(num arcOffset) => (arcOffset / 60) * 2 * math.pi;

Offset getOffsetFromOrigin(double length, double angle) =>
    Offset((length * math.sin(angle)), (length * -math.cos(angle)));

class Dot {
  final center;
  final radius;

  Dot({ this.center, this.radius });

  factory Dot.fromArcOffset(num arcOffset, double radius) {
    var angle = angleFrom(arcOffset);
    var isLarge = (arcOffset % 5 == 0);
    final length = radius - kLargeRadius;
    return Dot(
      center: getOffsetFromOrigin(length, angle) + Offset(radius, radius),
      radius: isLarge ? kLargeRadius : kSmallRadius,
    );
  }
}

