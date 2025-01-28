part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class FetchAllToDoEvent extends TodoEvent {}

class ChooseDateEvent extends TodoEvent {
  final BuildContext context;
  ChooseDateEvent({required this.context});
}

class AddToDoEvent extends TodoEvent {
  final TodoModel model;
  AddToDoEvent({required this.model});
}
