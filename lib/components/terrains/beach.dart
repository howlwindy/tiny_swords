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
}

class Beach extends SpriteGroupComponent<BeachState> with HasGameRef {
  BeachState? state;

  Beach({this.state = BeachState.none, required super.position}) : super();
  @override
  void onLoad() {
    sprites = {
      BeachState.trlb: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachTrbl.keyName)),
      BeachState.trb: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachTrb.keyName)),
      BeachState.trl: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachTrl.keyName)),
      BeachState.tbl: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachTbl.keyName)),
      BeachState.rbl: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachRbl.keyName)),
      BeachState.tr: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachTr.keyName)),
      BeachState.rb: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachRb.keyName)),
      BeachState.bl: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachBl.keyName)),
      BeachState.tl: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachTl.keyName)),
      BeachState.tb: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachTb.keyName)),
      BeachState.rl: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachRl.keyName)),
      BeachState.t: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachT.keyName)),
      BeachState.r: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachR.keyName)),
      BeachState.b: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachB.keyName)),
      BeachState.l: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachL.keyName)),
      BeachState.none: Sprite(
          game.images.fromCache(Assets.images.game.terrainBeachNone.keyName)),
    };

    current = state;
  }
}
