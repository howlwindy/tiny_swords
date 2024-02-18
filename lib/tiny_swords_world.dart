import 'package:flame/components.dart';
import 'package:tiny_swords/components/terrain/water.dart';
import 'package:tiny_swords/components/terrain/water_foam.dart';
import 'package:tiny_swords/components/ui/cursor.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class TinySwordsWorld extends World with HasGameReference<TinySwordsGame> {
  final Cursor cursor = Cursor();
  TinySwordsWorld() : super(priority: 4);

  @override
  Future<void> onLoad() async {
    // add components
    add(Water());
    add(WaterFoam(position: Vector2(-game.size.x / 2, -game.size.y / 2)));
    add(cursor);
  }
}
