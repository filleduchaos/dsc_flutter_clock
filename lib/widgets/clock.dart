import 'package:flutter/material.dart';
import '../services/time.dart';
import '../renderers/clock_face_painter.dart';
import '../renderers/clock_hand_painter.dart';
import '../renderers/tick_painter.dart';

class Clock extends StatelessWidget {
  Positioned _wrap(CustomPainter painter) =>
      Positioned.fill(child: CustomPaint(painter: painter));

  Widget assembleSelf(BuildContext context, AsyncSnapshot<TimeStub> snapshot) {
    final time = snapshot.data;
    var clockColor = Theme.of(context).textTheme.title.color;
    var tickColor = Theme.of(context).backgroundColor;

    return Stack(
      children: <Widget>[
        _wrap(ClockHandPainter(arcOffset: time?.hour, color: clockColor, short: true)),
        _wrap(ClockHandPainter(arcOffset: time?.minute, color: clockColor)),
        _wrap(ClockFacePainter(clockColor)),
        _wrap(TickPainter(arcOffset: time?.second, color: tickColor)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: StreamBuilder<TimeStub>(
        stream: TimeService.currentTime,
        builder: assembleSelf
      ),
    );
  }
}
