import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Scarecrow extends SpriteComponent with HasGameRef {
  static final images = [
    Assets.images.game.decoScarecrow0.keyName,
    Assets.images.game.decoScarecrow1.keyName,
    Assets.images.game.decoScarecrow2.keyName,
  ];

  final int index;

  Scarecrow(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(images[index]);
    sprite = Sprite(image);
  }
}
