import 'package:flutter/material.dart';
import 'package:todo/features/add_todo/presentation/widgets/buttons.dart';

class DateChoosingWidget extends StatelessWidget {
  const DateChoosingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Buttons(text: 'Today',onpress: () {},),
          // Width(width: 5),
          Buttons(text: 'Tomorrow',onpress: (){},)
        ],
      ),
    );
  }
}
