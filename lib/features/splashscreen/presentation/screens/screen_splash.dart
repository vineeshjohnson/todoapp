import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo/core/utilities/asset_class.dart';
import 'package:todo/features/homescreen/presentation/screens/screen_home.dart';
import 'package:todo/features/splashscreen/presentation/widgets/quote_text_widget.dart';
import 'package:todo/features/splashscreen/presentation/widgets/splash_text.dart';
import '../widgets/loading_widget.dart';
import '../widgets/lottie_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using a closure to delay navigation
    Timer(const Duration(seconds: 5), () {
      navigate(context);
    });

    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SplashTextWidget(),
              LottieWidget(lottie: Assets.splashLottie),
              LoadingWidget(),
              QuoteTextWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // Navigation function
  void navigate(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ScreenHome()),
    );
  }
}
