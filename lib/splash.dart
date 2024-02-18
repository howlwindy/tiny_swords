import 'package:flame/game.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tiny_swords/gen/assets.gen.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return FlameSplashScreen(
      theme: FlameSplashTheme.dark,
      showAfter: (BuildContext context) => Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.splash.background.keyName),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox.expand(
            child: FractionallySizedBox(
                widthFactor: .8,
                heightFactor: .8,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.images.splash.logo.keyName),
                  ),
                ))))
      ]),
      onFinish: (BuildContext context) => Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute(
              builder: (context) => GameWidget(
                    game: TinySwordsGame(),
                    mouseCursor: SystemMouseCursors.none,
                  ))),
    );
  }
}
