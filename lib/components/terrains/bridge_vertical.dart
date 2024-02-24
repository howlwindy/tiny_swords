import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class BridgeVertical extends SpriteComponent with HasGameRef {
  BridgeVertical({required super.position}) : super();

  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.terrainBridgeVertical.keyName);
    sprite = Sprite(image);
  }
}
