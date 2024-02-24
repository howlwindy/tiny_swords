import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class GroundShadow extends SpriteComponent with HasGameRef {
  GroundShadow({required super.position}) : super();
  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.terrainGroundShadow.keyName);
    sprite = Sprite(image);
  }
}
