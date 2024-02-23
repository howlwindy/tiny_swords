import 'package:flame/components.dart';
import 'package:tiny_swords/groups.dart';

class Pumpkin extends SpriteComponent with HasGameRef {
  final int index;

  Pumpkin(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(pumpkinGroup[index]);
    sprite = Sprite(image);
  }
}
