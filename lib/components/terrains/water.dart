import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:tiny_swords/components/decos/decos.dart';
import 'package:tiny_swords/components/terrains/terrains.dart';
import 'package:tiny_swords/effects/effects.dart';
import 'package:tiny_swords/gen/assets.gen.dart';
import 'package:tiny_swords/states.dart';
import 'package:tiny_swords/tiny_swords_game.dart';

class Water extends SpriteComponent with HasGameRef {
  static const windowEdgeThreshold = 20;
  static const double moveSpeed = 20.0;
  static OutOfBoundsDir outOfBoundsDir = OutOfBoundsDir.nil;

  Water() : super();

  Vector2 get windowPointTopLeft => -game.size / 2;
  Vector2 get positionDelta => position - windowPointTopLeft;
  Vector2 get sizeDelta => size - game.size;

  @override
  Future<void> onLoad() async {
    final image =
        game.images.fromCache(Assets.images.game.terrainWater.keyName);
    sprite = Sprite(image);
    setSize();
    setPosition();
    List<WaterRock> waterRocks = [];
    for (var i = 0; i < WaterRock.images.length; i++) {
      waterRocks.add(WaterRock(i,
          position: i == 0
              ? Vector2(
                  0,
                  0,
                )
              : Vector2(
                  waterRocks[i - 1].position.x + waterRocks[i - 1].size.x, 0)));
      add(waterRocks[i]);
    }
    final explosion = Explosion(
        position:
            waterRocks.last.position + Vector2(waterRocks.last.size.x, 0));
    add(explosion);
    final fire =
        Fire(position: explosion.position + Vector2(explosion.size.x, 0));
    add(fire);
    final buried = Buried(position: fire.position + Vector2(fire.size.x, 0));
    add(buried);
    final dead = Dead(position: buried.position + Vector2(buried.size.x, 0));
    add(dead);
    final dynamite =
        Dynamite(position: dead.position + Vector2(dead.size.x, 0));
    add(dynamite);
    List<Bone> bones = [];
    for (var i = 0; i < Bone.images.length; i++) {
      bones.add(Bone(i,
          position: i == 0
              ? Vector2(
                  dynamite.position.x + dynamite.size.x,
                  0,
                )
              : Vector2(bones[i - 1].position.x + bones[i - 1].size.x, 0)));
      add(bones[i]);
    }
    List<Castus> castuses = [];
    for (var i = 0; i < Castus.images.length; i++) {
      castuses.add(Castus(i,
          position: i == 0
              ? Vector2(
                  bones.last.position.x + bones.last.size.x,
                  0,
                )
              : Vector2(
                  castuses[i - 1].position.x + castuses[i - 1].size.x, 0)));
      add(castuses[i]);
    }
    List<Grass> grasses = [];
    for (var i = 0; i < Grass.images.length; i++) {
      grasses.add(Grass(i,
          position: i == 0
              ? Vector2(
                  castuses.last.position.x + castuses.last.size.x,
                  0,
                )
              : Vector2(grasses[i - 1].position.x + grasses[i - 1].size.x, 0)));
      add(grasses[i]);
    }
    List<GroundRock> groundRocks = [];
    for (var i = 0; i < GroundRock.images.length; i++) {
      groundRocks.add(GroundRock(i,
          position: i == 0
              ? Vector2(
                  grasses.last.position.x + grasses.last.size.x,
                  0,
                )
              : Vector2(
                  groundRocks[i - 1].position.x + groundRocks[i - 1].size.x,
                  0)));
      add(groundRocks[i]);
    }
    List<Mushroom> mushrooms = [];
    for (var i = 0; i < Mushroom.images.length; i++) {
      mushrooms.add(Mushroom(i,
          position: i == 0
              ? Vector2(
                  groundRocks.last.position.x + groundRocks.last.size.x,
                  0,
                )
              : Vector2(
                  mushrooms[i - 1].position.x + mushrooms[i - 1].size.x, 0)));
      add(mushrooms[i]);
    }
    List<Pumpkin> pumpkins = [];
    for (var i = 0; i < Pumpkin.images.length; i++) {
      pumpkins.add(Pumpkin(i,
          position: i == 0
              ? Vector2(
                  mushrooms.last.position.x + mushrooms.last.size.x,
                  0,
                )
              : Vector2(
                  pumpkins[i - 1].position.x + pumpkins[i - 1].size.x, 0)));
      add(pumpkins[i]);
    }
    List<Scarecrow> scarecrows = [];
    for (var i = 0; i < Scarecrow.images.length; i++) {
      scarecrows.add(Scarecrow(i,
          position: i == 0
              ? Vector2(
                  pumpkins.last.position.x + pumpkins.last.size.x,
                  0,
                )
              : Vector2(
                  scarecrows[i - 1].position.x + scarecrows[i - 1].size.x, 0)));
      add(scarecrows[i]);
    }
    final arrow = Arrow(
        position:
            Vector2(scarecrows.last.position.x + scarecrows.last.size.x, 0));
    add(arrow);
    final arrowEmbedded =
        Arrow(position: Vector2(arrow.position.x + arrow.size.x, 0));
    add(arrowEmbedded);
    arrowEmbedded.toEmbedded();
    List<Cloud> clouds = [];
    for (var i = 0; i < Cloud.images.length; i++) {
      clouds.add(Cloud(i,
          position: i == 0
              ? Vector2(
                  0,
                  explosion.size.y,
                )
              : Vector2(clouds[i - 1].position.x + clouds[i - 1].size.x,
                  clouds[i - 1].y)));
      add(clouds[i]);
    }
    final waterFoam = WaterFoam(
        position: Vector2(0, clouds.first.position.y + clouds.first.size.y));
    add(waterFoam);
    final beachDeco = Beach(
        state: BeachState.deco,
        position: Vector2(waterFoam.size.x, waterFoam.position.y));
    add(beachDeco);
    final beachTrbl = Beach(
        state: BeachState.trlb,
        position: Vector2(
            beachDeco.position.x + beachDeco.size.x, waterFoam.position.y));
    add(beachTrbl);
    final beachTbl = Beach(
        state: BeachState.tbl,
        position: Vector2(
            beachTrbl.position.x + beachTrbl.size.x, waterFoam.position.y));
    add(beachTbl);
    final beachTr = Beach(
        state: BeachState.tr,
        position: Vector2(
            beachTbl.position.x + beachTbl.size.x, waterFoam.position.y));
    add(beachTr);
    final beachRl = Beach(
        state: BeachState.rl,
        position: Vector2(beachTbl.position.x + beachTbl.size.x,
            beachTr.position.y + beachTr.size.y));
    add(beachRl);
    final beachTl = Beach(
        state: BeachState.tl,
        position:
            Vector2(beachTbl.position.x, beachRl.position.y + beachRl.size.y));
    add(beachTl);
    final beachNone = Beach(
        state: BeachState.none,
        position: Vector2(beachTl.position.x + beachTl.size.x,
            beachRl.position.y + beachRl.size.y));
    add(beachNone);
    final beachTb = Beach(
        state: BeachState.tb,
        position: Vector2(beachNone.position.x + beachNone.size.x,
            beachRl.position.y + beachRl.size.y));
    add(beachTb);
    final beachT = Beach(
        state: BeachState.t,
        position: Vector2(beachTb.position.x + beachTb.size.x,
            beachRl.position.y + beachRl.size.y));
    add(beachT);
    final beachTrl = Beach(
        state: BeachState.trl,
        position: Vector2(beachT.position.x + beachT.size.x,
            beachTr.position.y + beachTr.size.y));
    add(beachTrl);
    final beachRb = Beach(
        state: BeachState.rb,
        position: Vector2(beachT.position.x + beachT.size.x,
            beachRl.position.y + beachRl.size.y));
    add(beachRb);
    final beachL = Beach(
        state: BeachState.l,
        position:
            Vector2(beachTbl.position.x, beachTl.position.y + beachTl.size.y));
    add(beachL);
    final beachR = Beach(
        state: BeachState.r,
        position:
            Vector2(beachL.position.x + beachL.size.x, beachL.position.y));
    add(beachR);
    final beachRbl = Beach(
        state: BeachState.rbl,
        position: Vector2(beachT.position.x, beachL.position.y));
    add(beachRbl);
    final beachBl = Beach(
        state: BeachState.bl,
        position:
            Vector2(beachL.position.x, beachL.position.y + beachL.size.y));
    add(beachBl);
    final beachB = Beach(
        state: BeachState.b,
        position: Vector2(beachR.position.x, beachBl.position.y));
    add(beachB);
    final beachTrb = Beach(
        state: BeachState.trb,
        position:
            Vector2(beachB.position.x + beachB.size.x, beachB.position.y));
    add(beachTrb);
    final grassland = Grassland(
        position: Vector2(
            beachTrl.position.x + beachTrl.size.x, waterFoam.position.y));
    add(grassland);
    final elevation = Elevation(
        position: Vector2(
            grassland.position.x + grassland.size.x, waterFoam.position.y));
    add(elevation);
    final groundShadow = GroundShadow(
        position: Vector2(
            elevation.position.x + elevation.size.x, waterFoam.position.y));
    add(groundShadow);
    final bridgeShadowHorizontal = BridgeShadowHorizontal(
        position: Vector2(groundShadow.position.x + groundShadow.size.x,
            waterFoam.position.y));
    add(bridgeShadowHorizontal);
    final bridgeShadowVertical = BridgeShadowVertical(
        position: Vector2(
            bridgeShadowHorizontal.position.x + bridgeShadowHorizontal.size.x,
            waterFoam.position.y));
    add(bridgeShadowVertical);
    final bridgeHorizontal = BridgeHorizontal(
        position: Vector2(
            bridgeShadowVertical.position.x + bridgeShadowVertical.size.x,
            waterFoam.position.y));
    add(bridgeHorizontal);
    final bridgeVertical = BridgeVertical(
        position: Vector2(bridgeHorizontal.position.x + bridgeHorizontal.size.x,
            waterFoam.position.y));
    add(bridgeVertical);
    final steps = Steps(
        position: Vector2(bridgeVertical.position.x + bridgeVertical.size.x,
            waterFoam.position.y));
    add(steps);
    final grasslandDeco = GrasslandDeco(
        position:
            Vector2(steps.position.x + steps.size.x, waterFoam.position.y));
    add(grasslandDeco);
  }

  @override
  void update(double dt) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS || TargetPlatform.android:
        break;
      case _:
        switch (outOfBoundsDir) {
          case OutOfBoundsDir.top:
            updateTop();
            break;
          case OutOfBoundsDir.right:
            updateRight();
            break;
          case OutOfBoundsDir.bottom:
            updateBottom();
            break;
          case OutOfBoundsDir.left:
            updateLeft();
            break;
          case OutOfBoundsDir.nil:
        }
        break;
    }
  }

  @override
  void onGameResize(Vector2 size) {
    setSize();
    setPosition();
    super.onGameResize(size);
  }

  void setPosition() {
    position = -game.size / 2;
  }

  void setSize() {
    size = Vector2(
      game.size.x * TinySwordsGame.mapSizeWFactor,
      game.size.y * TinySwordsGame.mapSizeHFactor,
    );
  }

  void updateTop() {
    if (position.y + moveSpeed < windowPointTopLeft.y) {
      position.y += moveSpeed;
    } else {
      position.y = windowPointTopLeft.y;
    }
  }

  void updateRight() {
    if (positionDelta.x - moveSpeed < -sizeDelta.x) {
      position.x -= positionDelta.x - -sizeDelta.x;
    } else {
      position.x -= moveSpeed;
    }
  }

  void updateBottom() {
    if (positionDelta.y - moveSpeed < -sizeDelta.y) {
      position.y -= positionDelta.y - -sizeDelta.y;
    } else {
      position.y -= moveSpeed;
    }
  }

  void updateLeft() {
    if (position.x + moveSpeed < windowPointTopLeft.x) {
      position.x += moveSpeed;
    } else {
      position.x = windowPointTopLeft.x;
    }
  }

  void moveMouse(Vector2 dt) {
    if (dt.y < windowEdgeThreshold) {
      outOfBoundsDir = OutOfBoundsDir.top;
    } else if (dt.x + windowEdgeThreshold > game.size.x) {
      outOfBoundsDir = OutOfBoundsDir.right;
    } else if (dt.y + windowEdgeThreshold > game.size.y) {
      outOfBoundsDir = OutOfBoundsDir.bottom;
    } else if (dt.x < windowEdgeThreshold) {
      outOfBoundsDir = OutOfBoundsDir.left;
    } else {
      outOfBoundsDir = OutOfBoundsDir.nil;
    }
  }

  void movePan(Vector2 dt) {
    dt.x > 0 ? updateLeft() : updateRight();
    dt.y > 0 ? updateTop() : updateBottom();
  }
}
