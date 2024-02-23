import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class WaterRock extends SpriteAnimationComponent with HasGameRef {
  static final images = [
    Assets.images.game.decoWaterRock0.keyName,
    Assets.images.game.decoWaterRock1.keyName,
    Assets.images.game.decoWaterRock2.keyName,
    Assets.images.game.decoWaterRock3.keyName,
  ];
  static const _amount = [8, 8, 8, 8];
  static const _textureSize = [
    [32.0, 32.0],
    [47.0, 47.0],
    [75.0, 75.0],
    [91.0, 91.0]
  ];
  static const _stepTime = [.1, .1, .1, .1];

  final int index;

  WaterRock(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(images[index]);
    final textureSize = _textureSize[index];
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: _amount[index],
        textureSize: Vector2(textureSize.first, textureSize.last),
        stepTime: _stepTime[index],
      ),
    );
  }
}
