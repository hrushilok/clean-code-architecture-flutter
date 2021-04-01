part of 'todo_bloc.dart';

abstract class TodoEvent {}

class GetTodo extends TodoEvent {
  GetTodo();

  List<Object> get props => [];
}

class CreateTodo extends TodoEvent {
  final String description;
  CreateTodo({this.description});

  List<Object> get props => [description];
}
