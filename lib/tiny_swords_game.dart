import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:tiny_swords/components/ui/cursor.dart';
import 'package:tiny_swords/gen/assets.gen.dart';
import 'package:tiny_swords/tiny_swords_world.dart';

class TinySwordsGame extends FlameGame<TinySwordsWorld>
    with MouseMovementDetector {
  TinySwordsGame() : super(world: TinySwordsWorld());

  @override
  bool get debugMode => !kReleaseMode;

  @override
  Future<void> onLoad() async {
    // debug
    if (!kReleaseMode) {
      add(FpsTextComponent());
    }

    // load
    images.prefix = '';
    await images
        .loadAll(Assets.images.game.values.map((v) => v.keyName).toList());
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    world.cursor.move(info.eventPosition.global - size / 2);
  }
}
