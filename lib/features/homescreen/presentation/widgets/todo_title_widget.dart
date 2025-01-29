import 'package:flutter/material.dart';

class TodoTitleWidget extends StatelessWidget {
  const TodoTitleWidget({super.key, required this.title,required this.isfailed});
  final String title;
  final bool isfailed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        title,
        style:  TextStyle(fontSize: 20,
        decoration: isfailed?TextDecoration.lineThrough:TextDecoration.none
        ),
      ),
    );
  }
}
