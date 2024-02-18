import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class Cursor extends SpriteComponent with HasGameReference<TinySwordsGame> {
  Cursor() : super(size: Vector2.all(36), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    final image = game.images.fromCache(Assets.images.game.uiCursor.keyName);
    sprite = Sprite(image);
  }

  void move(Vector2 delta) {
    position = delta;
  }
}
