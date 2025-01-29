part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class AllToDoFetchedState extends TodoState {
  final List<TodoModel> todos;
  AllToDoFetchedState({required this.todos});
}

final class ToDoDateSelectedState extends TodoState {
  final String date;
  ToDoDateSelectedState({required this.date});
}

final class SuccessFullState extends TodoState {
}

final class NavigatedToAddToDoState extends TodoState {}

final class ToDoDetailedScreenState extends TodoState {
  final TodoModel todo;
  ToDoDetailedScreenState({required this.todo});
}

final class TodoEditingState extends TodoState {
  final TodoModel todo;
  TodoEditingState({required this.todo});
}

final class ToDoCompletedState extends TodoState{

}

final class LoadingState extends TodoState{
  
}
