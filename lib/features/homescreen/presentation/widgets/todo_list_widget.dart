import 'package:flutter/material.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';
import 'package:todo/features/homescreen/presentation/widgets/todo_tile_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key,required this.todos});
  final List<TodoModel> todos;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.separated(
          itemBuilder: (context, index) =>  TodoTileWidget(todo: todos[index],),
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemCount: todos.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
