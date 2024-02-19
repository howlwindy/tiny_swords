import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class Rocks0 extends SpriteAnimationComponent
    with HasGameReference<TinySwordsGame> {
  Rocks0({required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(Assets.images.game.decoRocks0.keyName);
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
