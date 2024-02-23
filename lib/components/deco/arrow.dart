import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

enum ArrowState { init, embedded }

class Arrow extends SpriteGroupComponent<ArrowState> with HasGameRef {
  static final images = {
    ArrowState.init: Assets.images.game.decoArrow.keyName,
    ArrowState.embedded: Assets.images.game.decoArrowEmbedded.keyName,
  };

  Arrow({required super.position}) : super();

  @override
  Future<void> onLoad() async {
    final spriteInit = Sprite(game.images.fromCache(images[ArrowState.init]!));
    final spriteEmbedded =
        Sprite(game.images.fromCache(images[ArrowState.embedded]!));
    sprites = {
      ArrowState.init: spriteInit,
      ArrowState.embedded: spriteEmbedded,
    };
    current = ArrowState.init;
  }

  void toEmbedded() => current = ArrowState.embedded;
}
