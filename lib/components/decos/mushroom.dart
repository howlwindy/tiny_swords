import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Mushroom extends SpriteComponent with HasGameRef {
  static final images = [
    Assets.images.game.decoMushroom0.keyName,
    Assets.images.game.decoMushroom1.keyName,
    Assets.images.game.decoMushroom2.keyName,
  ];

  final int index;

  Mushroom(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(images[index]);
    sprite = Sprite(image);
  }
}
