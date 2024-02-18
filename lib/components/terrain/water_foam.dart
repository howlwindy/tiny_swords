import 'package:flame/components.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class WaterFoam extends SpriteAnimationComponent
    with HasGameReference<TinySwordsGame> {
  WaterFoam({required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache('terrain_water_foam.png');
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
