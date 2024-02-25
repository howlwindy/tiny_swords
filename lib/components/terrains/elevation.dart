import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

enum ElevationState {
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
  stepsRl,
  stepsR,
  stepsL,
  stepsNone,
}

class Elevation extends SpriteGroupComponent<ElevationState> with HasGameRef {
  ElevationState? state;

  Elevation({this.state = ElevationState.none, required super.position})
      : super();
  @override
  void onLoad() {
    const size = 64.0;
    const sizeB = size * 2;
    final srcSize = Vector2.all(size);
    final srcSizeB = Vector2(size, sizeB);
    final image =
        game.images.fromCache(Assets.images.game.terrainElevation.keyName);
    sprites = {
      ElevationState.trlb: Sprite(image,
          srcSize: srcSizeB, srcPosition: Vector2(size * 3, size * 4)),
      ElevationState.trb: Sprite(image,
          srcSize: srcSizeB, srcPosition: Vector2(size * 2, size * 4)),
      ElevationState.trl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 3, 0)),
      ElevationState.tbl:
          Sprite(image, srcSize: srcSizeB, srcPosition: Vector2(0, size * 4)),
      ElevationState.rbl: Sprite(image,
          srcSize: srcSizeB, srcPosition: Vector2(size * 3, size * 2)),
      ElevationState.tr:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 2, 0)),
      ElevationState.rb: Sprite(image,
          srcSize: srcSizeB, srcPosition: Vector2(size * 2, size * 2)),
      ElevationState.bl:
          Sprite(image, srcSize: srcSizeB, srcPosition: Vector2(0, size * 2)),
      ElevationState.tl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(0, 0)),
      ElevationState.tb: Sprite(image,
          srcSize: srcSizeB, srcPosition: Vector2(size, size * 4)),
      ElevationState.rl:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 3, size)),
      ElevationState.t:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size, 0)),
      ElevationState.r:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 2, size)),
      ElevationState.b: Sprite(image,
          srcSize: srcSizeB, srcPosition: Vector2(size, size * 2)),
      ElevationState.l:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(0, size)),
      ElevationState.none:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size, size)),
      ElevationState.stepsRl: Sprite(image,
          srcSize: srcSizeB, srcPosition: Vector2(size * 3, size * 6)),
      ElevationState.stepsR: Sprite(image,
          srcSize: srcSizeB, srcPosition: Vector2(size * 2, size * 6)),
      ElevationState.stepsL:
          Sprite(image, srcSize: srcSizeB, srcPosition: Vector2(0, size * 6)),
      ElevationState.stepsNone: Sprite(image,
          srcSize: srcSizeB, srcPosition: Vector2(size, size * 6)),
    };

    current = state;
  }
}
