import 'package:flutter/material.dart';
import 'package:todo/features/add_todo/presentation/widgets/buttons.dart';

class ChooseButton extends StatelessWidget {
  const ChooseButton({
    super.key,
    required this.onpress,
    required this.btntxt
  });
  final VoidCallback onpress;
  final String btntxt;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Buttons(
          text: btntxt,
          onpress: onpress,
        )
      ],
    );
  }
}
