import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Steps extends SpriteComponent with HasGameRef {
  Steps({required super.position}) : super();

  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.terrainSteps.keyName);
    sprite = Sprite(image);
  }
}
