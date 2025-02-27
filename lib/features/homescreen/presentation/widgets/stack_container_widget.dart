import 'package:flutter/material.dart';
import 'package:todo/features/homescreen/presentation/widgets/searchbar_widget.dart';

class StackContainerWidget extends StatelessWidget {
  const StackContainerWidget({super.key, required this.onpress});
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.black,
      child: Center(
        child: SearchbarWidget(
          onpress: onpress,
        ),
      ),
    );
  }
}
