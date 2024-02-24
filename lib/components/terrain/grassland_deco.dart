import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class GrasslandDeco extends SpriteComponent with HasGameRef {
  GrasslandDeco({required super.position}) : super();
  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.terrainGrasslandDeco.keyName);
    sprite = Sprite(image);
  }
}
