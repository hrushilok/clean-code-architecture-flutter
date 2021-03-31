import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});


  Future<void> createTodo(TodoEntity todoEntity) async{
    TodoModel todo = todoEntity.toTodoModel();
    await todoRespository.createTodo(todo);
  }
}
