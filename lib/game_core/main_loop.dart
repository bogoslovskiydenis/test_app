import 'dart:isolate';

import 'package:flutter/animation.dart';

bool _running = true;

void startLoop(SendPort sendPort) async{
  final double _fps = 50;
  final double _second = 1000;
  //20 seconds
  final double _updateTime = _second/ _fps;
  double _updates = 0;

  Stopwatch _loopWatch = Stopwatch();
  _loopWatch.start();
  Stopwatch _timerWatch = Stopwatch();
  _timerWatch.start();

  while (_running){
    if(_loopWatch.elapsedMilliseconds >_updateTime){
      print("${DateTime.now()} FPS: $_updates");
      _updates ++;
      _loopWatch.reset();
      sendPort.send(true);
    }
  }
}

void stopLoop(){
  _running = false;
}