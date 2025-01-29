import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/utilities/asset_class.dart';
import 'package:todo/features/add_todo/presentation/screens/add_todo_screen.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';
import 'package:todo/features/homescreen/presentation/bloc/todo_bloc.dart';
import 'package:todo/features/homescreen/presentation/screens/todo_details_screen.dart';
import 'package:todo/features/homescreen/presentation/widgets/stack_container_widget.dart';
import 'package:todo/features/homescreen/presentation/widgets/todo_list_widget.dart';
import 'package:todo/features/splashscreen/presentation/widgets/lottie_widget.dart';

import '../widgets/minititles_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<TodoModel> todos = [];
    List<int> counts = [0,0];
    return BlocProvider(
      create: (context) => TodoBloc()..add(FetchAllToDoEvent()),
      child: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is AllToDoFetchedState) {
            todos = state.todos;
            counts = count(todos);
            print(counts);
          } else if (state is NavigatedToAddToDoState) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddTodoScreen()));
          } else if (state is ToDoDetailedScreenState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TodoDetailsScreen(todo: state.todo)));
          } else if (state is TodoEditingState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddTodoScreen(
                      todo: state.todo,
                    )));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StackContainerWidget(
                    onpress: () {
                      context.read<TodoBloc>().add(NavigateToAddToDoEvent());
                    },
                  ),
                   MinititlesWidget(counts: counts,),
                  state is LoadingState
                      ? LottieWidget(lottie: Assets.loadinglottie)
                      : todos.isNotEmpty
                          ? TodoListWidget(
                              todos: todos,
                            )
                          : LottieWidget(lottie: Assets.nodatalottie)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<int> count(List<TodoModel> todos) {
    int completed = 0;
    int pending = 0;
    List<int> count = [];
    for (int i = 0; i < todos.length; i++) {
      if (todos[i].completed) {
        completed++;
      } else {
        pending++;
      }
    }
    count.add(pending);
    count.add(completed);
    return count;
  }
}
