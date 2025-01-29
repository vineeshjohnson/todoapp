import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/usecases/functions/dialogue_box.dart';
import 'package:todo/core/usecases/height.dart';
import 'package:todo/features/add_todo/presentation/widgets/choose_button.dart';
import 'package:todo/features/add_todo/presentation/widgets/headding_widget.dart';
import 'package:todo/features/add_todo/presentation/widgets/textfield.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';
import 'package:todo/features/homescreen/presentation/bloc/todo_bloc.dart';
import 'package:todo/features/homescreen/presentation/screens/screen_home.dart';
import 'package:todo/features/splashscreen/presentation/screens/screen_splash.dart';

import '../../../../core/usecases/functions/snackbar.dart';
import '../widgets/selected_time_widget.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key, this.todo});
  final TodoModel? todo;
  @override
  Widget build(BuildContext context) {
    TextEditingController titlecontroller = TextEditingController();
    TextEditingController contentcontroller = TextEditingController();
    String date = 'No Day Selected';
    if (todo != null) {
      titlecontroller.text = todo!.title;
      contentcontroller.text = todo!.content;
      date = todo!.deadline;
    }
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: SafeArea(
        child: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state is ToDoDateSelectedState) {
              date = state.date;
            } else if (state is SuccessFullState) {
              Navigator.of(context).pushAndRemoveUntil(
                  (MaterialPageRoute(builder: (context) => const ScreenHome())),
                  (route) => false);
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
                          title: 'Headding',
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
                        SelectedTimeWidget(
                          date: date,
                        ),
                        const HeightWidget(height: 10),
                        const HeightWidget(height: 25),
                        ChooseButton(
                          btntxt: todo != null ? 'Update' : 'Create',
                          onpress: () {
                            if (contentcontroller.text.isEmpty) {
                              showCustomSnackBar(
                                  context: context, message: 'Add any content');
                            }else  if (titlecontroller.text.isEmpty) {
                              showCustomSnackBar(
                                  context: context, message: 'Add A title');

                            }else  if (date=='No Day Selected') {
                              showCustomSnackBar(
                                  context: context, message: 'Choose a date');
                            }else{
TodoModel model = TodoModel(
                                title: titlecontroller.text,
                                content: contentcontroller.text,
                                deadline: date,
                                completed: false,
                                deleted: false,
                                failed: false);

                            todo != null
                                ? showCustomDialog(context, () {
                                    context.read<TodoBloc>().add(
                                        ToDoUpdatingEvent(
                                            todo: todo!, model: model));
                                    Navigator.pop(context);
                                  }, 'Update TO-DO',
                                    'Do you want to Update this TO-DO?')
                                : showCustomDialog(context, () {
                                    context
                                        .read<TodoBloc>()
                                        .add(AddToDoEvent(model: model));
                                    Navigator.pop(context);
                                  }, 'Create new TO-DO',
                                    'Do you want to create new TO-DO?');
                            }
                            
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
