import 'package:flame/components.dart';
import 'package:tiny_swords/components/terrain/water.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class TinySwordsWorld extends World with HasGameReference<TinySwordsGame> {
  @override
  Future<void> onLoad() async {
    add(Water());
  }
}
