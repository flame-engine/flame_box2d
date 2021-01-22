import 'dart:math' as math;

import 'package:forge2d/forge2d.dart';
import 'package:flame/gestures.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:flutter/material.dart';

import 'balls.dart';
import 'boundaries.dart';

class ContactCallbacksSample extends Forge2DGame with TapDetector {
  @override
  bool debugMode = true;

  ContactCallbacksSample(Vector2 viewportSize)
      : super(
          scale: 4.0,
          gravity: Vector2(0, -10.0),
        ) {
    viewport.resize(viewportSize);
    final boundaries = createBoundaries(viewport);
    boundaries.forEach(add);
    addContactCallback(BallContactCallback());
    addContactCallback(BallWallContactCallback());
    addContactCallback(WhiteBallContactCallback());
    final Vector2 position = Vector2(100, 100);
    add(Ball(position));
    add(Ball(position));
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    final Vector2 position = Vector2(100, 100);
    if (math.Random().nextInt(10) < 2) {
      add(WhiteBall(position));
    } else {
      add(Ball(position));
    }
  }
}
