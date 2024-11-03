import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';

import '../helper/color.dart';

class Background extends StatefulWidget {
  const Background({Key? key}) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  final AppColor appColor = AppColor.instance;
  int colorEffectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onDoubleTap: () {
          setState(() {
            colorEffectIndex = (colorEffectIndex + 1) % colorsAndEffects.length;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.bottomCenter,
                  radius: 1.5,
                  colors: [
                appColor.deepBlue,
                appColor.white,
              ])),
          child: Metaballs(
            effect: colorsAndEffects[colorEffectIndex].effect,
            glowRadius: 1,
            glowIntensity: 0.6,
            maxBallRadius: 50,
            minBallRadius: 20,
            metaballs: 15,
            color: appColor.grey,
            gradient: LinearGradient(
              colors: colorsAndEffects[colorEffectIndex].colors,
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            child: null,
          ),
        ),
      ),
    );
  }
}

class ColorsEffectPair {
  final List<Color> colors;
  final MetaballsEffect? effect;
  final String name;

  ColorsEffectPair({
    required this.colors,
    required this.name,
    required this.effect,
  });
}

List<ColorsEffectPair> colorsAndEffects = [
  ColorsEffectPair(colors: [
    AppColor.instance.deepBlue,
    AppColor.instance.deepPurple,
    // const Color.fromARGB(255, 255, 21, 0),
    // const Color.fromARGB(255, 255, 153, 0),
  ], effect: MetaballsEffect.follow(), name: 'FOLLOW'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 0, 255, 106),
    const Color.fromARGB(255, 255, 251, 0),
  ], effect: MetaballsEffect.grow(), name: 'GROW'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 90, 60, 255),
    const Color.fromARGB(255, 120, 255, 255),
  ], effect: MetaballsEffect.speedup(), name: 'SPEEDUP'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 255, 60, 120),
    const Color.fromARGB(255, 237, 120, 255),
  ], effect: MetaballsEffect.ripple(), name: 'RIPPLE'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 120, 217, 255),
    const Color.fromARGB(255, 255, 234, 214),
  ], effect: null, name: 'NONE'),
];
