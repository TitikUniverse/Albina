import 'package:albina/constants.dart';
import 'package:flutter/material.dart';

class MenuGradientMask extends StatelessWidget {
  MenuGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.centerRight,
        colors: [lightBlue, lightBlue],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}

class LightMenuGradientMask extends StatelessWidget {
  LightMenuGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.white, seaWave],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}