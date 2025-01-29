import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/colors.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';
import 'package:todo/features/homescreen/presentation/bloc/todo_bloc.dart';
import 'package:todo/features/homescreen/presentation/widgets/checkbox_widget.dart';
import 'package:todo/features/homescreen/presentation/widgets/edit_delete_widget.dart';
import 'package:todo/features/homescreen/presentation/widgets/todo_title_widget.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({super.key, required this.todo});
  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    bool isFailed = failed(todo.deadline);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          context.read<TodoBloc>().add(TodoTileClickedEvent(todo: todo));
        },
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.searchbarcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40, // Fixed size for the icon
                child: isFailed
                    ? const Icon(
                        Icons.error,
                        color: Colors.red,
                      )
                    : CheckboxWidget(model: todo),
              ),
              SizedBox(
                width: 150, // Fixed width for title
                child: TodoTitleWidget(
                  isfailed: isFailed,
                  title: todo.title,
                ),
              ),
              SizedBox(
                width: 110, // Fixed width for edit/delete icons
                child: EditDeleteWidget(todo: todo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool failed(String date) {
  DateTime givenDate = DateFormat("dd MMM yyyy").parse(date);
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  return givenDate.isBefore(today);
}
