import 'package:flutter/material.dart';
import 'package:todo/core/colors.dart';

class SubtitleWidget extends StatelessWidget {
 const  SubtitleWidget({super.key,required this.count,required this.status});
 final String status;
 final int count;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            status,
            style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.searchbarcolor,
            child: Center(
              child: Text(
                count.toString(),
                style: const TextStyle(color: AppColors.onSurface, fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
