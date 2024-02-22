import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Rocks0 extends SpriteAnimationComponent with HasGameRef {
  Rocks0({required super.position}) : super();
  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.decoWaterRock0.keyName);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 8,
        textureSize: Vector2.all(32),
        stepTime: 0.1,
      ),
    );
  }
}
