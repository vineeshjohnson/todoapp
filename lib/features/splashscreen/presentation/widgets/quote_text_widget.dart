import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/fonts.dart';
import '../../../../core/utilities/mediaquery_class.dart';

class QuoteTextWidget extends StatelessWidget {
  const QuoteTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);

    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      height: screenSize.height / 4,
      width: double.infinity,
      // color: AppColors.onSurface,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Step into a world of possibilities track, organize, and thrive with ease.',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: Fonts.splash2font, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
