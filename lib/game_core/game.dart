import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:test_app/entitites/player.dart';
import 'package:test_app/game_core/main_loop.dart';
import 'package:test_app/game_core/utilits/common_vars.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  ReceivePort _receivePort;
  Isolate _isolateLoop;
  Player player;

  void startIsolateLoop() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(startLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame) {
      startIsolateLoop();
      isFirstStartGame = false;
      player = Player();
    }
    player.update();

    return Stack(
      children: [player.build()],
    );
  }
}
