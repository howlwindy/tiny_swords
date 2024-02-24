import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Buried extends SpriteAnimationComponent with HasGameRef {
  Buried({required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(Assets.images.game.decoBuried.keyName);
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 7,
        textureSize: Vector2(47, 49),
        stepTime: 0.1,
      ),
    );
  }
}
