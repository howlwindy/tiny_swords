import 'package:flame/components.dart';
import 'package:tiny_swords/components/deco/rocks0.dart';
import 'package:tiny_swords/components/deco/rocks1.dart';
import 'package:tiny_swords/components/deco/rocks2.dart';
import 'package:tiny_swords/components/deco/rocks3.dart';
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

    // TODO: The components added below are just temporary and without logic.
    final baseX = -game.size.x / 2;
    final baseY = -game.size.y / 2;
    final waterfoam = WaterFoam(position: Vector2(baseX, baseY));
    add(waterfoam);
    final rocks0 = Rocks0(position: Vector2(baseX + waterfoam.size.x, baseY));
    add(rocks0);
    final rocks1 = Rocks1(
        position: Vector2(baseX + waterfoam.size.x + rocks0.size.x, baseY));
    add(rocks1);
    final rocks2 = Rocks2(
        position: Vector2(
            baseX + waterfoam.size.x + rocks0.size.x + rocks1.size.x, baseY));
    add(rocks2);
    final rocks3 = Rocks3(
        position: Vector2(
            baseX +
                waterfoam.size.x +
                rocks0.size.x +
                rocks1.size.x +
                rocks2.size.x,
            baseY));
    add(rocks3);
    add(cursor);
  }
}
