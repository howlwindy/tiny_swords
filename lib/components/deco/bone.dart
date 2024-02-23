import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Bone extends SpriteComponent with HasGameRef {
  static final images = [
    Assets.images.game.decoBone0.keyName,
    Assets.images.game.decoBone1.keyName,
  ];

  final int index;

  Bone(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(images[index]);
    sprite = Sprite(image);
  }
}
