import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Dead extends SpriteAnimationComponent with HasGameRef {
  Dead({required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(Assets.images.game.decoDead.keyName);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 7,
        textureSize: Vector2(60, 67),
        stepTime: 0.1,
      ),
    );
  }
}
