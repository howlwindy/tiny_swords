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
    final groundShadow = GroundShadow(
        position: Vector2(
            waterFoam.position.x + waterFoam.size.x, waterFoam.position.y));
    add(groundShadow);
    final bridgeShadowHorizontal = BridgeShadowHorizontal(
        position: Vector2(groundShadow.position.x + groundShadow.size.x,
            groundShadow.position.y));
    add(bridgeShadowHorizontal);
    final bridgeShadowVertical = BridgeShadowVertical(
        position: Vector2(
            bridgeShadowHorizontal.position.x + bridgeShadowHorizontal.size.x,
            waterFoam.position.y));
    add(bridgeShadowVertical);
    final beachDeco = Beach(
        state: BeachState.deco,
        position: Vector2(0, waterFoam.position.y + waterFoam.size.y));
    add(beachDeco);
    final beachTrbl = Beach(
        state: BeachState.trlb,
        position: Vector2(beachDeco.position.x + beachDeco.size.x,
            waterFoam.position.y + waterFoam.size.y));
    add(beachTrbl);
    final beachTbl = Beach(
        state: BeachState.tbl,
        position: Vector2(
            beachTrbl.position.x + beachTrbl.size.x, beachDeco.position.y));
    add(beachTbl);
    final beachTr = Beach(
        state: BeachState.tr,
        position: Vector2(
            beachTbl.position.x + beachTbl.size.x, beachDeco.position.y));
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
    final grasslandDeco = Grassland(
        state: GrasslandState.deco,
        position: Vector2(
            beachTrl.position.x + beachTrl.size.x, beachDeco.position.y));
    add(grasslandDeco);
    final grasslandTrbl = Grassland(
        state: GrasslandState.trlb,
        position: Vector2(grasslandDeco.position.x + grasslandDeco.size.x,
            beachDeco.position.y));
    add(grasslandTrbl);
    final grasslandTbl = Grassland(
        state: GrasslandState.tbl,
        position: Vector2(grasslandTrbl.position.x + grasslandTrbl.size.x,
            beachDeco.position.y));
    add(grasslandTbl);
    final grasslandTr = Grassland(
        state: GrasslandState.tr,
        position: Vector2(grasslandTbl.position.x + grasslandTbl.size.x,
            beachDeco.position.y));
    add(grasslandTr);
    final grasslandRl = Grassland(
        state: GrasslandState.rl,
        position: Vector2(grasslandTbl.position.x + grasslandTbl.size.x,
            grasslandTr.position.y + grasslandTr.size.y));
    add(grasslandRl);
    final grasslandTl = Grassland(
        state: GrasslandState.tl,
        position: Vector2(grasslandTbl.position.x,
            grasslandRl.position.y + grasslandRl.size.y));
    add(grasslandTl);
    final grasslandNone = Grassland(
        state: GrasslandState.none,
        position: Vector2(grasslandTl.position.x + grasslandTl.size.x,
            grasslandRl.position.y + grasslandRl.size.y));
    add(grasslandNone);
    final grasslandTb = Grassland(
        state: GrasslandState.tb,
        position: Vector2(grasslandNone.position.x + grasslandNone.size.x,
            grasslandRl.position.y + grasslandRl.size.y));
    add(grasslandTb);
    final grasslandT = Grassland(
        state: GrasslandState.t,
        position: Vector2(grasslandTb.position.x + grasslandTb.size.x,
            grasslandRl.position.y + grasslandRl.size.y));
    add(grasslandT);
    final grasslandTrl = Grassland(
        state: GrasslandState.trl,
        position: Vector2(grasslandT.position.x + grasslandT.size.x,
            grasslandTr.position.y + grasslandTr.size.y));
    add(grasslandTrl);
    final grasslandRb = Grassland(
        state: GrasslandState.rb,
        position: Vector2(grasslandT.position.x + grasslandT.size.x,
            grasslandRl.position.y + grasslandRl.size.y));
    add(grasslandRb);
    final grasslandL = Grassland(
        state: GrasslandState.l,
        position: Vector2(grasslandTbl.position.x,
            grasslandTl.position.y + grasslandTl.size.y));
    add(grasslandL);
    final grasslandR = Grassland(
        state: GrasslandState.r,
        position: Vector2(
            grasslandL.position.x + grasslandL.size.x, grasslandL.position.y));
    add(grasslandR);
    final grasslandRbl = Grassland(
        state: GrasslandState.rbl,
        position: Vector2(grasslandT.position.x, grasslandL.position.y));
    add(grasslandRbl);
    final grasslandBl = Grassland(
        state: GrasslandState.bl,
        position: Vector2(
            grasslandL.position.x, grasslandL.position.y + grasslandL.size.y));
    add(grasslandBl);
    final grasslandB = Grassland(
        state: GrasslandState.b,
        position: Vector2(grasslandR.position.x, grasslandBl.position.y));
    add(grasslandB);
    final grasslandTrb = Grassland(
        state: GrasslandState.trb,
        position: Vector2(
            grasslandB.position.x + grasslandB.size.x, grasslandB.position.y));
    add(grasslandTrb);
    final elevationTrbl = Elevation(
        state: ElevationState.trlb,
        position: Vector2(0, beachBl.position.y + beachBl.size.y));
    add(elevationTrbl);
    final elevationTbl = Elevation(
        state: ElevationState.tbl,
        position: Vector2(elevationTrbl.position.x + elevationTrbl.size.x,
            elevationTrbl.position.y));
    add(elevationTbl);
    final elevationTr = Elevation(
        state: ElevationState.tr,
        position: Vector2(elevationTbl.position.x + elevationTbl.size.x,
            elevationTrbl.position.y));
    add(elevationTr);
    final elevationRl = Elevation(
        state: ElevationState.rl,
        position: Vector2(elevationTbl.position.x + elevationTbl.size.x,
            elevationTr.position.y + elevationTr.size.y));
    add(elevationRl);
    final elevationTl = Elevation(
        state: ElevationState.tl,
        position: Vector2(elevationTbl.position.x,
            elevationRl.position.y + elevationRl.size.y));
    add(elevationTl);
    final elevationNone = Elevation(
        state: ElevationState.none,
        position: Vector2(elevationTl.position.x + elevationTl.size.x,
            elevationRl.position.y + elevationRl.size.y));
    add(elevationNone);
    final elevationTb = Elevation(
        state: ElevationState.tb,
        position: Vector2(elevationNone.position.x + elevationNone.size.x,
            elevationRl.position.y + elevationRl.size.y));
    add(elevationTb);
    final elevationT = Elevation(
        state: ElevationState.t,
        position: Vector2(elevationTb.position.x + elevationTb.size.x,
            elevationRl.position.y + elevationRl.size.y));
    add(elevationT);
    final elevationTrl = Elevation(
        state: ElevationState.trl,
        position: Vector2(elevationT.position.x + elevationT.size.x,
            elevationTr.position.y + elevationTr.size.y));
    add(elevationTrl);
    final stepsL = Elevation(
        state: ElevationState.stepsL,
        position: Vector2(elevationT.position.x + elevationT.size.x,
            elevationRl.position.y + elevationRl.size.y));
    add(stepsL);
    final stepsNone = Elevation(
        state: ElevationState.stepsNone,
        position: Vector2(stepsL.position.x + stepsL.size.x,
            elevationRl.position.y + elevationRl.size.y));
    add(stepsNone);
    final stepsR = Elevation(
        state: ElevationState.stepsR,
        position: Vector2(stepsNone.position.x + stepsNone.size.x,
            elevationRl.position.y + elevationRl.size.y));
    add(stepsR);
    final elevationRb = Elevation(
        state: ElevationState.rb,
        position:
            Vector2(stepsR.position.x + stepsR.size.x, stepsR.position.y));
    add(elevationRb);
    final elevationL = Elevation(
        state: ElevationState.l,
        position: Vector2(elevationTbl.position.x,
            elevationTl.position.y + elevationTl.size.y));
    add(elevationL);
    final elevationR = Elevation(
        state: ElevationState.r,
        position: Vector2(
            elevationL.position.x + elevationL.size.x, elevationL.position.y));
    add(elevationR);
    final elevationRbl = Elevation(
        state: ElevationState.rbl,
        position: Vector2(elevationT.position.x, elevationL.position.y));
    add(elevationRbl);
    final elevationBl = Elevation(
        state: ElevationState.bl,
        position: Vector2(
            elevationL.position.x, elevationL.position.y + elevationL.size.y));
    add(elevationBl);
    final elevationB = Elevation(
        state: ElevationState.b,
        position: Vector2(elevationR.position.x, elevationBl.position.y));
    add(elevationB);
    final elevationTrb = Elevation(
        state: ElevationState.trb,
        position: Vector2(
            elevationB.position.x + elevationB.size.x, elevationB.position.y));
    add(elevationTrb);
    final stepsRl = Elevation(
        state: ElevationState.stepsRl,
        position: Vector2(elevationTr.position.x + elevationTr.size.x,
            elevationTr.position.y));
    add(stepsRl);
    final bridgeHorizontal = BridgeHorizontal(
        position: Vector2(elevationRb.position.x + elevationRb.size.x,
            elevationTrbl.position.y));
    add(bridgeHorizontal);
    final bridgeVertical = BridgeVertical(
        position: Vector2(bridgeHorizontal.position.x + bridgeHorizontal.size.x,
            bridgeHorizontal.position.y));
    add(bridgeVertical);
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
