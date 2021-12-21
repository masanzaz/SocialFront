import 'dart:async';

class StoryProgressStream {
  final _progressTimeStreamController = StreamController<double>();

  StreamSink<double> get _progressTimeSink =>
      _progressTimeStreamController.sink;

  Stream<double> get progressTimeStream => _progressTimeStreamController.stream;
  int maxStoryDuration = 2000;
  int elapsedDuration = 0;
  double maxProgress = 1.0;
  double _progressTimer = 0.0;

  addValue() {
    elapsedDuration++;
    _progressTimer = _progressTimer + (maxProgress / maxStoryDuration);
    _progressTimeSink.add(_progressTimer);
  }

  dispose() {
    _progressTimeStreamController.close();
  }
}
