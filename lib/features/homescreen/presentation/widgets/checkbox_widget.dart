import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({super.key});

  @override
 Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: Checkbox(
        splashRadius: 5,
        value: true,
        onChanged: (value) {},
        shape: const CircleBorder(),
        checkColor: AppColors.onSurface,
        activeColor: AppColors.primary,
      ),
    );
  }
}