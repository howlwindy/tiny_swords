import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

enum BeachState {
  trlb,
  trb,
  trl,
  tbl,
  rbl,
  tr,
  rb,
  bl,
  tl,
  tb,
  rl,
  t,
  r,
  b,
  l,
  none,
  deco
}

class Beach extends SpriteGroupComponent<BeachState> with HasGameRef {
  BeachState? state;

  Beach({this.state = BeachState.none, required super.position}) : super();
  @override
  void onLoad() {
    const size = 64.0;
    final srcSize = Vector2.all(size);
    final image = game.images.fromCache(Assets.images.game.terrainFlat.keyName);
    sprites = {
      BeachState.trlb: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 8, size * 3)),
      BeachState.trb: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 7, size * 3)),
      BeachState.trl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 8, 0)),
      BeachState.tbl: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 5, size * 3)),
      BeachState.rbl: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 8, size * 2)),
      BeachState.tr:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 7, 0)),
      BeachState.rb: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 7, size * 2)),
      BeachState.bl: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 5, size * 2)),
      BeachState.tl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 5, 0)),
      BeachState.tb: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 6, size * 3)),
      BeachState.rl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 8, size)),
      BeachState.t:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 6, 0)),
      BeachState.r:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 7, size)),
      BeachState.b: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 6, size * 2)),
      BeachState.l:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 5, size)),
      BeachState.none:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 6, size)),
      BeachState.deco:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 9, 0)),
    };

    current = state;
  }
}
