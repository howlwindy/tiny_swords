import 'package:flame/components.dart';
import 'package:tiny_swords/groups.dart';

class Grass extends SpriteComponent with HasGameRef {
  final int index;

  Grass(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(grassGroup[index]);
    sprite = Sprite(image);
  }
}
