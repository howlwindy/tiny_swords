import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Grass extends SpriteComponent with HasGameRef {
  static final images = [
    Assets.images.game.decoGrass0.keyName,
    Assets.images.game.decoGrass1.keyName,
    Assets.images.game.decoGrass2.keyName,
  ];

  final int index;

  Grass(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(images[index]);
    sprite = Sprite(image);
  }
}
