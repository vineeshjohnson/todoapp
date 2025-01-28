import 'package:flutter/material.dart';
import 'package:todo/core/colors.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.text,required this.onpress});
  final String text;
    final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ButtonStyle(
          maximumSize: const WidgetStatePropertyAll(Size(120, 40)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12.0), // Set your desired radius here
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(AppColors.primary)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          // Icon(
          //   Icons.add_alarm_rounded,
          //   color: Colors.white,
          // )
        ],
      ),
    );
  }
}
