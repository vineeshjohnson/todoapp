import 'package:flutter/material.dart';
import 'package:todo/core/fonts.dart';

class HeaddingWidget extends StatelessWidget {
  const HeaddingWidget({super.key, required this.title, required this.icon});
  final String title;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontFamily: Fonts.splash2font, fontSize: 25),
          ),
          // SizedBox(
          //   width: 5,
          // ),
          // icon
        ],
      ),
    );
  }
}
