import 'package:flame/components.dart';
import 'package:tiny_swords/groups.dart';

class Castus extends SpriteComponent with HasGameRef {
  final int index;

  Castus(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(castusGroup[index]);
    sprite = Sprite(image);
  }
}
