import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';
import 'package:todo/features/homescreen/presentation/bloc/todo_bloc.dart';
import 'package:todo/features/homescreen/presentation/widgets/stack_container_widget.dart';
import 'package:todo/features/homescreen/presentation/widgets/todo_list_widget.dart';

import '../widgets/minititles_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<TodoModel> todos = [];
    return BlocProvider(
      create: (context) => TodoBloc()..add(FetchAllToDoEvent()),
      child: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is AllToDoFetchedState) {
            todos = state.todos;
          }
        },
        builder: (context, state) {
          return  SafeArea(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const StackContainerWidget(),
                const  MinititlesWidget(),
                  TodoListWidget(todos: todos,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
