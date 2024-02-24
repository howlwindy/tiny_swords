import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Cursor extends SpriteComponent with HasGameRef {
  Cursor() : super(size: Vector2.all(36));

  @override
  Future<void> onLoad() async {
    final image = game.images.fromCache(Assets.images.game.uiCursor.keyName);
    sprite = Sprite(image);
  }

  void move(Vector2 delta) {
    position = delta;
  }
}
