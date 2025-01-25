import 'package:flutter/material.dart';
import 'package:todo/features/homescreen/presentation/widgets/subtitle_widget.dart';

class MinititlesWidget extends StatelessWidget {
  const MinititlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubtitleWidget(
            status: 'Pending',
            count: 1,
          ),
          SubtitleWidget(
            status: 'Completed',
            count: 10,
          )
        ],
      ),
    );
  }
}
