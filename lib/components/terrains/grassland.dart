import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

enum GrasslandState {
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

class Grassland extends SpriteGroupComponent<GrasslandState> with HasGameRef {
  GrasslandState? state;

  Grassland({this.state = GrasslandState.none, required super.position})
      : super();
  @override
  void onLoad() {
    const size = 64.0;
    final srcSize = Vector2.all(size);
    final image = game.images.fromCache(Assets.images.game.terrainFlat.keyName);
    sprites = {
      GrasslandState.trlb: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 3, size * 3)),
      GrasslandState.trb: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 2, size * 3)),
      GrasslandState.trl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 3, 0)),
      GrasslandState.tbl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(0, size * 3)),
      GrasslandState.rbl: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 3, size * 2)),
      GrasslandState.tr:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 2, 0)),
      GrasslandState.rb: Sprite(image,
          srcSize: srcSize, srcPosition: Vector2(size * 2, size * 2)),
      GrasslandState.bl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(0, size * 2)),
      GrasslandState.tl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(0, 0)),
      GrasslandState.tb:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size, size * 3)),
      GrasslandState.rl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 3, size)),
      GrasslandState.t:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size, 0)),
      GrasslandState.r:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 2, size)),
      GrasslandState.b:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size, size * 2)),
      GrasslandState.l:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(0, size)),
      GrasslandState.none:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size, size)),
      GrasslandState.deco:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 4, 0)),
    };

    current = state;
  }
}
