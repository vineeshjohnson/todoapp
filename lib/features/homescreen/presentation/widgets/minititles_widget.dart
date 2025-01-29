import 'package:flutter/material.dart';
import 'package:todo/features/homescreen/presentation/widgets/subtitle_widget.dart';

class MinititlesWidget extends StatelessWidget {
  const MinititlesWidget({super.key,required this.counts});
  final List<int> counts;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubtitleWidget(
            status: 'Pending',
            count: counts[0],
          ),
          SubtitleWidget(
            status: 'Completed',
            count: counts[1],
          )
        ],
      ),
    );
  }
}
