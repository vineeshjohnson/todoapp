import 'package:flutter/material.dart';
import 'package:todo/features/add_todo/presentation/widgets/buttons.dart';

class ChooseButton extends StatelessWidget {
  const ChooseButton({super.key, required this.onpress});
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Buttons(
          text: 'Choose',
          onpress: onpress,
        )
      ],
    );
  }
}
