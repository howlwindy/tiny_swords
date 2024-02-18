import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tiny_swords/splash.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kReleaseMode) {
    runApp(GameWidget(
        game: TinySwordsGame(), mouseCursor: SystemMouseCursors.none));
  } else {
    runApp(const MaterialApp(home: Scaffold(body: Splash())));
  }
  await Flame.device.setLandscape();
}
