import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/usecases/functions/dialogue_box.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';
import 'package:todo/features/homescreen/presentation/bloc/todo_bloc.dart';

import '../../../../core/colors.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({super.key, required this.model});
  final TodoModel model;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: Checkbox(
        splashRadius: 5,
        value: model.completed,
        onChanged: (value) {
        model.completed? showCustomDialog(context, () {
            Navigator.pop(context);
            context.read<TodoBloc>().add(CheckBoxClickedEvent(todo: model));
          }, 'Undo Action', 'Do you want to mark this task as inompleted??') :showCustomDialog(context, () {
            Navigator.pop(context);
            context.read<TodoBloc>().add(CheckBoxClickedEvent(todo: model));
          }, 'Task Completed', 'Do you want to maark this task as Completed??');
        },
        shape: const CircleBorder(),
        checkColor: AppColors.onSurface,
        activeColor: AppColors.primary,
      ),
    );
  }
}

bool failed(String date) {
  DateTime givenDate = DateFormat("dd MMM yyyy").parse(date);

  DateTime now = DateTime.now();

  DateTime today = DateTime(now.year, now.month, now.day);
  if (givenDate.isBefore(today)) {
    return true;
  } else if (givenDate.isAfter(today)) {
    return false;
  } else {
    return false;
  }
}
