import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:tiny_swords/components/terrains/terrains.dart';
import 'package:tiny_swords/components/uis/cursor.dart';

class TinySwordsWorld extends World with HasGameRef {
  TinySwordsWorld() : super();
  late final Water water = Water();
  final Cursor cursor = Cursor();

  @override
  Future<void> onLoad() async {
    // add components
    add(water);
    switch (defaultTargetPlatform) {
      case TargetPlatform.android || TargetPlatform.iOS:
        break;
      case _:
        add(cursor);
        break;
    }
  }
}
