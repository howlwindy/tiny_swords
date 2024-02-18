import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class Water extends SpriteComponent with HasGameReference<TinySwordsGame> {
  Water() : super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    final image =
        game.images.fromCache(Assets.images.game.terrainWater.keyName);
    sprite = Sprite(image);
    size = game.size;
  }
}
