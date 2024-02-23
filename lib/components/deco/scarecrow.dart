import 'package:flame/components.dart';
import 'package:tiny_swords/groups.dart';

class Scarecrow extends SpriteComponent with HasGameRef {
  final int index;

  Scarecrow(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(scarecrowGroup[index]);
    sprite = Sprite(image);
  }
}
