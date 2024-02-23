import 'package:flame/components.dart';
import 'package:tiny_swords/gen/assets.gen.dart';

class Cloud extends SpriteComponent with HasGameRef {
  static final images = [
    Assets.images.game.decoCloud0.keyName,
    Assets.images.game.decoCloud1.keyName,
    Assets.images.game.decoCloud2.keyName,
    Assets.images.game.decoCloud3.keyName,
    Assets.images.game.decoCloud4.keyName,
    Assets.images.game.decoCloud5.keyName,
    Assets.images.game.decoCloud6.keyName,
    Assets.images.game.decoCloud7.keyName,
    Assets.images.game.decoCloud8.keyName,
    Assets.images.game.decoCloud9.keyName,
    Assets.images.game.decoCloud10.keyName,
  ];
  final int index;

  Cloud(this.index, {required super.position}) : super();
  @override
  void onLoad() {
    final image = game.images.fromCache(images[index]);
    sprite = Sprite(image);
  }
}
