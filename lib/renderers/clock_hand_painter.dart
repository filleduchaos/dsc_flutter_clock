import 'package:flutter/rendering.dart';
import './clock_painter.dart';

class ClockHandPainter extends ClockPainter {
  static const hourRelativeLength = 0.6;
  static const minuteRelativeLength = 0.9;
  static const stubLength = kLargeRadius * 3;

  final double width;
  final double lengthFactor;

  ClockHandPainter({ num arcOffset, Color color, bool short: false })
    : width = short ? kLargeRadius : kSmallRadius,
      lengthFactor = short ? hourRelativeLength : minuteRelativeLength,
      super(color: color, arcOffset: arcOffset);

  @override
  void paint(Canvas canvas, Size size) {
    var canvasRadius = size.width / 2;
    var canvasCenter = Offset(canvasRadius, canvasRadius);

    Paint paint = Paint()..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    var angle = angleFrom(arcOffset);
    var stubAngle = angleFrom(arcOffset + 30);
    var handLength = lengthFactor * ((size.width / 2) - (kLargeRadius * 2));

    var start = getOffsetFromOrigin(handLength, angle) + canvasCenter;
    var end = getOffsetFromOrigin(stubLength, stubAngle) + canvasCenter;

    canvas.drawLine(start, end, paint);
  }
}
