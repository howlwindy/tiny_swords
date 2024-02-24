import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Grassland extends SpriteComponent with HasGameRef {
  Grassland({required super.position}) : super();
  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.terrainGrassland.keyName);
    sprite = Sprite(image);
  }
}
