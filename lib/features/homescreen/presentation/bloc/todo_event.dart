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

class NavigateToAddToDoEvent extends TodoEvent {}

class TodoTileClickedEvent extends TodoEvent {
  final TodoModel todo;
  TodoTileClickedEvent({required this.todo});
}

class ToDoEditEvent extends TodoEvent {
  final TodoModel todo;
  ToDoEditEvent({required this.todo});
}

class ToDoUpdatingEvent extends TodoEvent {
  final TodoModel model;
  final TodoModel todo;
  ToDoUpdatingEvent({required this.model, required this.todo});
}

class TodoDeleteEvent extends TodoEvent {
  final TodoModel todo;
  TodoDeleteEvent({required this.todo});
}

class CheckBoxClickedEvent extends TodoEvent {
  final TodoModel todo;
  CheckBoxClickedEvent({required this.todo});
}
