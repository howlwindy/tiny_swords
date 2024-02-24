import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class BridgeShadowVertical extends SpriteComponent with HasGameRef {
  BridgeShadowVertical({required super.position}) : super();

  @override
  void onLoad() {
    final image = game.images
        .fromCache(Assets.images.game.terrainBridgeShadowVertical.keyName);
    sprite = Sprite(image);
  }
}
