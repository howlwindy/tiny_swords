import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Castus extends SpriteComponent with HasGameRef {
  static final images = [
    Assets.images.game.decoCastus0.keyName,
    Assets.images.game.decoCastus1.keyName,
  ];

  final int index;

  Castus(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(images[index]);
    sprite = Sprite(image);
  }
}
