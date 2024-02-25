import 'dart:math';

import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

enum BridgeState {
  t,
  r,
  b,
  l,
  horizontal,
  vertical,
  shadowHorizontal,
  shadowVertical
}

class Bridge extends SpriteGroupComponent<BridgeState> with HasGameRef {
  BridgeState? state;

  Bridge({this.state = BridgeState.horizontal, required super.position})
      : super(anchor: Anchor.center);
  @override
  void onLoad() {
    const size = 64.0;
    final srcSize = Vector2.all(size);
    final image =
        game.images.fromCache(Assets.images.game.terrainBridge.keyName);
    final shadow = Sprite(image,
        srcSize: srcSize, srcPosition: Vector2(size * 2, size * 3));
    sprites = {
      BridgeState.t:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(0, size)),
      BridgeState.r:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size * 2, 0)),
      BridgeState.b:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(0, size * 3)),
      BridgeState.l:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(0, 0)),
      BridgeState.horizontal:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(size, 0)),
      BridgeState.vertical:
          Sprite(image, srcSize: srcSize, srcPosition: Vector2(0, size * 2)),
      BridgeState.shadowHorizontal: shadow,
      BridgeState.shadowVertical: shadow
    };

    if (state == BridgeState.shadowVertical) {
      angle = -pi / 2;
    }

    current = state;
  }
}
