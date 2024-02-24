import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Beach extends SpriteComponent with HasGameRef {
  Beach({required super.position}) : super();
  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.terrainBeach.keyName);
    sprite = Sprite(image);
  }
}
