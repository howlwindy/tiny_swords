import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Pumpkin extends SpriteComponent with HasGameRef {
  static final images = [
    Assets.images.game.decoPumpkin0.keyName,
    Assets.images.game.decoPumpkin1.keyName,
  ];

  final int index;

  Pumpkin(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(images[index]);
    sprite = Sprite(image);
  }
}
