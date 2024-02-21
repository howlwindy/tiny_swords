import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Fire extends SpriteAnimationComponent with HasGameRef {
  Fire({required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(Assets.images.game.effectFire.keyName);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 7,
        textureSize: Vector2(75, 101),
        stepTime: 0.1,
      ),
    );
  }
}
