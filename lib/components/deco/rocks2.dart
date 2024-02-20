import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Rocks2 extends SpriteAnimationComponent with HasGameRef {
  Rocks2({required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(Assets.images.game.decoRocks2.keyName);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 8,
        textureSize: Vector2.all(75),
        stepTime: 0.1,
      ),
    );
  }
}
