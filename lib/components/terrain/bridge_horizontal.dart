import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class BridgeHorizontal extends SpriteComponent with HasGameRef {
  BridgeHorizontal({required super.position}) : super();

  @override
  void onLoad() {
    final image = game.images
        .fromCache(Assets.images.game.terrainBridgeHorizontal.keyName);
    sprite = Sprite(image);
  }
}
