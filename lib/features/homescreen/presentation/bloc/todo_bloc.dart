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
      emit(LoadingState());
      List<TodoModel> todos = await fetchTodos();
      emit(AllToDoFetchedState(todos: todos));
    });

    on<ChooseDateEvent>((event, emit) async {
      String? date = await selectDate(event.context);
      emit(ToDoDateSelectedState(date: date!));
    });

    on<AddToDoEvent>((event, emit) async {
      Map<String, dynamic> values = event.model.toFirestore();
      bool output = await addTodo(values);
      emit(SuccessFullState());
    });

    on<ToDoUpdatingEvent>((event, emit) async {
      Map<String, dynamic> values = event.model.toFirestore();
      await updateTodoDocument(event.todo.id!, values);
      emit(SuccessFullState());
    });

    on<CheckBoxClickedEvent>((event, emit) async {
      Map<String, dynamic> values = event.todo.toFirestore();
      values['completed']
          ? values['completed'] = false
          : values['completed'] = true;
      await updateTodoDocument(event.todo.id!, values);
      emit(ToDoCompletedState());

      List<TodoModel> todos = await fetchTodos();
      emit(AllToDoFetchedState(todos: todos));
    });

    on<TodoDeleteEvent>((event, emit) async {
      await deleteTodoDocument(event.todo.id!);
      List<TodoModel> todos = await fetchTodos();
      emit(AllToDoFetchedState(todos: todos));
    });

    on<NavigateToAddToDoEvent>((event, emit) {
      emit(NavigatedToAddToDoState());
    });

    on<TodoTileClickedEvent>((event, emit) {
      emit(ToDoDetailedScreenState(todo: event.todo));
    });

    on<ToDoEditEvent>((event, emit) {
      emit(TodoEditingState(todo: event.todo));
    });
  }
}

Future<List<TodoModel>> fetchTodos() async {
  try {
    final collectionRef = FirebaseFirestore.instance.collection('todos');

    final querySnapshot = await collectionRef.get();

    final todoList =
        querySnapshot.docs.map((doc) => TodoModel.fromFirestore(doc)).toList();

    return todoList;
  } catch (e) {
    print('Error fetching todos: $e');
    return [];
  }
}

Future<String?> selectDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    return DateFormat('dd MMM yyyy').format(pickedDate);
  }
  return null;
}

Future<bool> addTodo(Map<String, dynamic> todoData) async {
  try {
    await FirebaseFirestore.instance.collection('todos').add(todoData);
    print("Todo added successfully!");
    return true;
  } catch (e) {
    print("Error adding todo: $e");
    return false;
  }
}

Future<void> updateTodoDocument(
    String todoId, Map<String, dynamic> updatedData) async {
  try {
    print(updatedData.values);
    // Get reference to the 'todos' collection
    CollectionReference todosCollection =
        FirebaseFirestore.instance.collection('todos');

    // Update the document with the given ID
    await todosCollection.doc(todoId).update(updatedData);

    print("Document updated successfully");
  } catch (e) {
    print("Error updating document: $e");
  }
}

Future<void> deleteTodoDocument(String todoId) async {
  try {
    // Reference to the 'todos' collection
    var todosCollection = FirebaseFirestore.instance.collection('todos');

    // Delete the document with the given ID
    await todosCollection.doc(todoId).delete();

    print('Document deleted successfully');
  } catch (e) {
    print('Error deleting document: $e');
  }
}
