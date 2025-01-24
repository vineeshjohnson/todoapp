import 'package:flutter/material.dart';
import 'package:todo/core/fonts.dart';

class SplashTextWidget extends StatelessWidget {
  const SplashTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Tu TO-DO',
      style: TextStyle(
          fontFamily: Fonts.splashfont, fontSize: 50, color: Colors.white),
    );
  }
}
