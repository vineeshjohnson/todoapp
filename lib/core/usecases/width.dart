import 'package:flutter/material.dart';

class Width extends StatelessWidget {
  const Width({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
