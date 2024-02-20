import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:tiny_swords/gen/assets.gen.dart';
import 'package:tiny_swords/tiny_swords_world.dart';

class TinySwordsGame extends FlameGame<TinySwordsWorld>
    with MouseMovementDetector, PanDetector, ScrollDetector, ScaleDetector {
  static const double mapSizeWFactor = 1.8;
  static const double mapSizeHFactor = 1.4;
  static const double cameraZoomFactor = .1;
  static const double cameraZoomMax = 3.0;
  static const double cameraZoomMin = 1.0;

  TinySwordsGame() : super(world: TinySwordsWorld());

  // debug
  @override
  bool get debugMode => !kReleaseMode;

  @override
  Future<void> onLoad() async {
    // debug
    if (!kReleaseMode) {
      add(FpsTextComponent());
    }

    // load
    images.prefix = '';
    await images
        .loadAll(Assets.images.game.values.map((v) => v.keyName).toList());
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    world.cursor.move(info.eventPosition.global - size / 2);
    world.water.moveMouse(info.eventPosition.global);
  }

  void scaleUpdate() {
// camera.viewfinder.zoom +=
//         info.scrollDelta.global.y > 0 ? cameraZoomFactor : -cameraZoomFactor;
//     if (camera.viewfinder.zoom + cameraZoomFactor > cameraZoomMax) {
//       camera.viewfinder.zoom = cameraZoomMax;
//     } else if (camera.viewfinder.zoom - cameraZoomFactor < cameraZoomMin) {
//       camera.viewfinder.zoom = cameraZoomMin;
//     }
  }

  // @override
  // void onScroll(PointerScrollInfo info) {}

  // @override
  // void onScaleStart(ScaleStartInfo info) {}

  // @override
  // void onScaleUpdate(ScaleUpdateInfo info) {}

  @override
  void onPanUpdate(DragUpdateInfo info) {
    world.water.movePan(info.delta.global);
  }
}
