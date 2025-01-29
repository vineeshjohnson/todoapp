import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/colors.dart';
import 'package:todo/core/usecases/functions/dialogue_box.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';
import 'package:todo/features/homescreen/presentation/bloc/todo_bloc.dart';

class EditDeleteWidget extends StatelessWidget {
  const EditDeleteWidget({super.key, required this.todo});
  final TodoModel todo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          !todo.completed
              ? IconButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(ToDoEditEvent(todo: todo));
                  },
                  color: AppColors.fadetext,
                  icon: const Icon(Icons.edit_calendar_outlined),
                )
              : SizedBox(
                  width: 3,
                ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              showCustomDialog(context, () {
                context.read<TodoBloc>().add(TodoDeleteEvent(todo: todo));
                Navigator.pop(context);
              }, 'Delete To-Do', 'Do you want to delete this todo?');
            },
            icon: const Icon(Icons.delete_outline_outlined),
            color: AppColors.fadetext,
          )
        ],
      ),
    );
  }
}
