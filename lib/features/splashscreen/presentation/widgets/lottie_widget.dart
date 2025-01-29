import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/utilities/mediaquery_class.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({super.key, required this.lottie});
  final String lottie;
  @override
  Widget build(BuildContext context) {
    final screensize = ScreenSize(context);
    return Lottie.asset(
      lottie,
      height: screensize.height / 2,
    );
  }
}
