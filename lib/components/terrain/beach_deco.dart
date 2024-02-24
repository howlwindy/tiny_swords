import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class BeachDeco extends SpriteComponent with HasGameRef {
  BeachDeco({required super.position}) : super();
  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.terrainBeachDeco.keyName);
    sprite = Sprite(image);
  }
}
