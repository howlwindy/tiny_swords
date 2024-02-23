import 'package:flame/components.dart';
import 'package:tiny_swords/groups.dart';

class GroundRock extends SpriteComponent with HasGameRef {
  final int index;

  GroundRock(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(groundRockGroup[index]);
    sprite = Sprite(image);
  }
}
