import 'package:flutter/rendering.dart';
import './clock_painter.dart';

class ClockFacePainter extends ClockPainter {
  ClockFacePainter(Color color) : super(color: color);

  @override
  void paint(Canvas canvas, Size size) {
    var canvasRadius = size.width / 2;
    var canvasCenter = Offset(canvasRadius, canvasRadius);

    Paint paint = Paint()..color = color
                         ..style = PaintingStyle.fill
                         ..strokeWidth = 1.0
                         ..strokeCap = StrokeCap.round;

    List.generate(60, (i) => Dot.fromArcOffset(i, canvasRadius))
        .forEach((point) {
          canvas.drawCircle(point.center, point.radius, paint);
        });

    canvas.drawCircle(canvasCenter, kLargeRadius * 1.5, paint);
  }
}
