import 'package:flame/components.dart';
import 'package:tiny_swords/groups.dart';

class Mushroom extends SpriteComponent with HasGameRef {
  final int index;

  Mushroom(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(mushroomGroup[index]);
    sprite = Sprite(image);
  }
}
