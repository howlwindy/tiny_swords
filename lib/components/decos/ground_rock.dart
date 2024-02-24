import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class GroundRock extends SpriteComponent with HasGameRef {
  static final images = [
    Assets.images.game.decoGroundRock0.keyName,
    Assets.images.game.decoGroundRock1.keyName,
    Assets.images.game.decoGroundRock2.keyName,
  ];

  final int index;

  GroundRock(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(images[index]);
    sprite = Sprite(image);
  }
}
