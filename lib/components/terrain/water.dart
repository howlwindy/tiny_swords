import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:tiny_swords/components/deco/bone.dart';
import 'package:tiny_swords/components/deco/buried.dart';
import 'package:tiny_swords/components/deco/castus.dart';
import 'package:tiny_swords/components/deco/cloud.dart';
import 'package:tiny_swords/components/deco/dead.dart';
import 'package:tiny_swords/components/deco/dynamite.dart';
import 'package:tiny_swords/components/deco/grass.dart';
import 'package:tiny_swords/components/deco/ground_rock.dart';
import 'package:tiny_swords/components/deco/mushroom.dart';
import 'package:tiny_swords/components/deco/rocks0.dart';
import 'package:tiny_swords/components/deco/rocks1.dart';
import 'package:tiny_swords/components/deco/rocks2.dart';
import 'package:tiny_swords/components/deco/rocks3.dart';
import 'package:tiny_swords/effects/explosion.dart';
import 'package:tiny_swords/effects/fire.dart';
import 'package:tiny_swords/gen/assets.gen.dart';
import 'package:tiny_swords/groups.dart';
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
    final rocks0 = Rocks0(position: Vector2(0, 0));
    add(rocks0);
    final rocks1 = Rocks1(position: Vector2(size.x, 0));
    rocks1.anchor = Anchor.topRight;
    add(rocks1);
    final rocks2 = Rocks2(position: Vector2(0, size.y));
    rocks2.anchor = Anchor.bottomLeft;
    add(rocks2);
    final rocks3 = Rocks3(position: size);
    rocks3.anchor = Anchor.bottomRight;
    add(rocks3);
    final explosion =
        Explosion(position: rocks0.position + Vector2(rocks0.size.x, 0));
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
    for (var i = 0; i < boneGroup.length; i++) {
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
    for (var i = 0; i < castusGroup.length; i++) {
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
    for (var i = 0; i < grassGroup.length; i++) {
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
    for (var i = 0; i < grassGroup.length; i++) {
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
    for (var i = 0; i < grassGroup.length; i++) {
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
    List<Cloud> clouds = [];
    for (var i = 0; i < cloudGroup.length; i++) {
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
