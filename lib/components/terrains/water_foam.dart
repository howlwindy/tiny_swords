import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class WaterFoam extends SpriteAnimationComponent with HasGameRef {
  WaterFoam({required super.position}) : super();
  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.terrainWaterFoam.keyName);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 8,
        textureSize: Vector2.all(86),
        stepTime: 0.1,
      ),
    );
  }
}
