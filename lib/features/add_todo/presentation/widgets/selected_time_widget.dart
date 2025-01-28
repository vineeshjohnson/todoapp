import 'package:flutter/material.dart';
import 'package:todo/core/colors.dart';
import 'package:todo/core/fonts.dart';

class SelectedTimeWidget extends StatelessWidget {
  const SelectedTimeWidget({super.key, required this.date});
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.fadetext, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.mainfont),
          )
        ],
      ),
    );
  }
}
