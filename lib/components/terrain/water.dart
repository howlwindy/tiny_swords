import 'package:flame/components.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class Water extends SpriteComponent with HasGameReference<TinySwordsGame> {
  @override
  Future<void> onLoad() async {
    final image = game.images.fromCache('terrain_water.png');
    sprite = Sprite(image);
    size = game.size;
    anchor = Anchor.center;
  }
}
