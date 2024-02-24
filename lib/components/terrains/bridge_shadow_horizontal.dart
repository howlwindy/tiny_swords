import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class BridgeShadowHorizontal extends SpriteComponent with HasGameRef {
  BridgeShadowHorizontal({required super.position}) : super();

  @override
  void onLoad() {
    final image = game.images
        .fromCache(Assets.images.game.terrainBridgeShadowHorizontal.keyName);
    sprite = Sprite(image);
  }
}
