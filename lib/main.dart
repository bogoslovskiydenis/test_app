import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/game_core/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .whenComplete(() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom]); //убирает верх

    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Game()));
  });
}
