import 'package:flutter/material.dart';

class TodoTitleWidget extends StatelessWidget {
  const TodoTitleWidget({super.key,required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
