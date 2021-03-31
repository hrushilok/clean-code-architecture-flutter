import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

abstract class TodoEvent {}

class CreateNewTodo extends TodoEvent {
  TodoEntity todo;
  CreateNewTodo({this.todo});
}

class Reload extends TodoEvent {}