import 'package:flame/components.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class Water extends PositionComponent with HasGameReference<TinySwordsGame> {
  late SpriteComponent _sprite;

  @override
  Future<void> onLoad() async {
    final image = game.images.fromCache('terrain_water.png');
    _sprite = SpriteComponent.fromImage(image,
        size: Vector2(game.size.x, game.size.y), anchor: Anchor.center);
    parent!.add(_sprite);
  }

  @override
  void onGameResize(Vector2 size) {
    _sprite.size = size;
    super.onGameResize(size);
  }
}
