import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key,required this.onpress});
final  VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 100,
      child: ElevatedButton(
        onPressed:onpress,
        style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12.0), // Set your desired radius here
              ),
            ),
            backgroundColor: const WidgetStatePropertyAll(AppColors.primary)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.add_alarm_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
