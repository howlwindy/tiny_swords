import 'package:flame/components.dart';
import 'package:tiny_swords/groups.dart';

class Cloud extends SpriteComponent with HasGameRef {
  final int index;

  Cloud(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(cloudGroup[index]);
    sprite = Sprite(image);
  }
}
