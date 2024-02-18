import 'package:flame/components.dart';
import 'package:tiny_swords/components/terrain/water.dart';
import 'package:tiny_swords/components/terrain/water_foam.dart';
import 'package:tiny_swords/gens/assets.g.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class TinySwordsWorld extends World with HasGameReference<TinySwordsGame> {
  @override
  Future<void> onLoad() async {
    game.images.prefix = 'assets/images/game/';
    await game.images.loadAll(gameImages);

    // add components
    add(Water());
    add(WaterFoam(position: Vector2(-game.size.x / 2, -game.size.y / 2)));
  }
}
