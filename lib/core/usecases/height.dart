import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
