import 'package:flame/components.dart';
import 'package:tiny_swords/groups.dart';

class Bone extends SpriteComponent with HasGameRef {
  final int index;

  Bone(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(boneGroup[index]);
    sprite = Sprite(image);
  }
}
