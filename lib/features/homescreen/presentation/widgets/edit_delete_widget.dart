import 'package:flutter/material.dart';
import 'package:todo/core/colors.dart';

class EditDeleteWidget extends StatelessWidget {
  const EditDeleteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        children: [
          Icon(
            Icons.edit_calendar_outlined,
            color: AppColors.fadetext,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.delete_outline_outlined,
            color: AppColors.fadetext,
          )
        ],
      ),
    );
  }
}
