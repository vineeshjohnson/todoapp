import 'package:flutter/material.dart';
import 'package:todo/core/colors.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';
import 'package:todo/features/homescreen/presentation/widgets/checkbox_widget.dart';
import 'package:todo/features/homescreen/presentation/widgets/edit_delete_widget.dart';
import 'package:todo/features/homescreen/presentation/widgets/todo_title_widget.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({super.key, required this.todo});
  final TodoModel todo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.searchbarcolor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CheckboxWidget(),
            TodoTitleWidget(
              title: todo.title,
            ),
            EditDeleteWidget()
          ],
        ),
      ),
    );
  }
}
