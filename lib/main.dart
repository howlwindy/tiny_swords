import 'package:flame/game.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: FlameSplashScreen(
    theme: FlameSplashTheme.dark,
    showAfter: (BuildContext context) => Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash/background.png'),
              fit: BoxFit.cover),
        ),
      ),
      const SizedBox.expand(
          child: FractionallySizedBox(
              widthFactor: .8,
              heightFactor: .8,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash/logo.png'),
                ),
              ))))
    ]),
    onFinish: (BuildContext context) => Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute(builder: (context) => GameWidget(game: FlameGame()))),
  ))));
}
