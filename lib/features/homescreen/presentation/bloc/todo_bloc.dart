import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/homescreen/data/todo_model.dart';
import 'package:intl/intl.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {});

    on<FetchAllToDoEvent>((event, emit) async {
      List<TodoModel> todos = await fetchTodos();
      emit(AllToDoFetchedState(todos: todos));
    });

    on<ChooseDateEvent>((event, emit) async {
      String ?date = await selectDate(event.context);
      emit(ToDoDateSelectedState(date: date!));
    });
  }
}

Future<List<TodoModel>> fetchTodos() async {
  try {
    // Get the Firestore collection reference
    final collectionRef = FirebaseFirestore.instance.collection('todos');

    // Fetch the documents from the collection
    final querySnapshot = await collectionRef.get();

    // Map the documents to TodoModel instances and return as a list
    final todoList =
        querySnapshot.docs.map((doc) => TodoModel.fromFirestore(doc)).toList();

    return todoList;
  } catch (e) {
    print('Error fetching todos: $e');
    return []; // Return an empty list in case of an error
  }
}

Future<String?> selectDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    return DateFormat('dd MMM yyyy').format(pickedDate);
  }
  return null;
}
