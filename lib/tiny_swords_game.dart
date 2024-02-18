import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:tiny_swords/tiny_swords_world.dart';

class TinySwordsGame extends FlameGame<TinySwordsWorld>
    with ScrollDetector, MouseMovementDetector {
  TinySwordsGame() : super(world: TinySwordsWorld());

  @override
  bool get debugMode => !kReleaseMode;

  @override
  Future<void> onLoad() async {
    if (!kReleaseMode) {
      add(FpsTextComponent());
    }
  }
}
