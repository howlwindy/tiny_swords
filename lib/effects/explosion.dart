import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Explosion extends SpriteAnimationComponent with HasGameRef {
  Explosion({required super.position}) : super();
  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.effectExplosion.keyName);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 9,
        textureSize: Vector2(105, 113),
        stepTime: 0.1,
      ),
    );
  }
}
