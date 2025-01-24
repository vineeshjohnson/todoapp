import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive(
      strokeAlign: 2,
      strokeCap: StrokeCap.butt,
      strokeWidth: 6,
    );
  }
}
