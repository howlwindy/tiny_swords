import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Elevation extends SpriteComponent with HasGameRef {
  Elevation({required super.position}) : super();
  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.terrainElevation.keyName);
    sprite = Sprite(image);
  }
}
