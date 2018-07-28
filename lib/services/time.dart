import 'dart:async';

class TimeStub {
  final int second;
  final int minute;
  final double hour;

  TimeStub(_time)
    : second = _time.second,
      minute = _time.minute,
      hour = ((_time.hour % 12) * 5) + _time.minute / 12;
}

abstract class TimeService {
  static final _currentTimeSink = StreamController<DateTime>.broadcast();

  static Timer _timer;

  static final Stream<TimeStub> currentTime =
      _currentTimeSink.stream.map((time) => TimeStub(time));

  static void start() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (_) {
      _currentTimeSink.add(DateTime.now());
    });
  }

  static void stop() {
    _timer?.cancel();
  }
}
