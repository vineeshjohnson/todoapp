import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/usecases/height.dart';
import 'package:todo/features/add_todo/presentation/widgets/choose_button.dart';
import 'package:todo/features/add_todo/presentation/widgets/date_choosing_widget.dart';
import 'package:todo/features/add_todo/presentation/widgets/headding_widget.dart';
import 'package:todo/features/add_todo/presentation/widgets/or_widget.dart';
import 'package:todo/features/add_todo/presentation/widgets/textfield.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';
import 'package:todo/features/homescreen/presentation/bloc/todo_bloc.dart';

import '../widgets/selected_time_widget.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titlecontroller = TextEditingController();
    TextEditingController contentcontroller = TextEditingController();
    String date = '';
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: SafeArea(
        child: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state is ToDoDateSelectedState) {
              date = state.date;
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(40),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeaddingWidget(
                          title: 'Head',
                          icon: Icon(Icons.abc),
                        ),
                        const HeightWidget(height: 10),
                        Textfieldnew(
                          controller: titlecontroller,
                          min: 2,
                          label: 'Title',
                        ),
                        const HeightWidget(height: 20),
                        const HeaddingWidget(
                          title: 'Content',
                          icon: Icon(Icons.abc),
                        ),
                        const HeightWidget(height: 10),
                        Textfieldnew(
                          controller: contentcontroller,
                          min: 5,
                          label: 'To-Do',
                        ),
                        const HeightWidget(height: 50),
                        const HeaddingWidget(
                            title: 'Deadline', icon: Icon(Icons.pending)),
                        const HeightWidget(height: 20),
                        const DateChoosingWidget(),
                        const HeightWidget(height: 15),
                        const OrWidget(),
                        const HeightWidget(height: 15),
                        ChooseButton(
                          onpress: () {
                            context
                                .read<TodoBloc>()
                                .add(ChooseDateEvent(context: context));
                          },
                        ),
                        const HeightWidget(height: 25),
                        const HeaddingWidget(
                            title: 'Selected Time',
                            icon: Icon(Icons.abc_outlined)),
                        const HeightWidget(height: 15),
                        SelectedTimeWidget(
                          date: date,
                        ),
                        const HeightWidget(height: 10),
                        ChooseButton(
                          onpress: () {
                            TodoModel model = TodoModel(
                                id: '1',
                                title: titlecontroller.text,
                                content: contentcontroller.text,
                                deadline: date,
                                completed: false,
                                deleted: false,
                                failed: false);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
