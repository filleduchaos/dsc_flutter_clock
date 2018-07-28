import 'package:flutter/rendering.dart';
import './clock_painter.dart';

class TickPainter extends ClockPainter {
  TickPainter({ num arcOffset, Color color })
      : super(color: color, arcOffset: arcOffset);

  @override
  void paint(Canvas canvas, Size size) {
    var canvasRadius = size.width / 2;
    Paint paint = Paint()..color = color
                         ..style = PaintingStyle.fill
                         ..strokeWidth = 1.0
                         ..strokeCap = StrokeCap.round;


    var dot = Dot.fromArcOffset(arcOffset, canvasRadius);
    canvas.drawCircle(dot.center, dot.radius, paint);
  }
}
