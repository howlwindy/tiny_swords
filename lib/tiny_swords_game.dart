import 'package:flame/game.dart';
import 'package:tiny_swords/gens/assets.g.dart';
import 'package:tiny_swords/tiny_swords_world.dart';

class TinySwordsGame extends FlameGame<TinySwordsWorld> {
  TinySwordsGame() : super(world: TinySwordsWorld());

  @override
  Future<void> onLoad() async {
    images.prefix = 'assets/images/game/';
    await images.loadAll(gameImages);
  }
}
