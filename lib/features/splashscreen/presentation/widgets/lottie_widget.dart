import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/utilities/asset_class.dart';
import 'package:todo/core/utilities/mediaquery_class.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screensize = ScreenSize(context);
    return Lottie.asset(
      Assets.splashLottie,
      height: screensize.height / 3,
    );
  }
}
