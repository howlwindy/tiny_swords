import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Dynamite extends SpriteAnimationComponent with HasGameRef {
  Dynamite({required super.position}) : super();
  @override
  void onLoad() {
    final image =
        game.images.fromCache(Assets.images.game.decoDynamite.keyName);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 6,
        textureSize: Vector2(28, 52),
        stepTime: 0.1,
      ),
    );
  }
}
