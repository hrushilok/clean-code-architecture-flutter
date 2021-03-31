import 'package:clean_code_architecture_flutter/domain/usescases/todo_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Todousecase todousecase;

  TodoBloc({this.todousecase});

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    switch(event.runtimeType) {
      case CreateNewTodo:
        yield* _createTodo(event);
        break;
      case Reload:
        yield* _reload();
        break;
      default:
        break;
    }
  }

  @override
  TodoState get initialState => TodoInitial();

  Stream<TodoState> _createTodo(CreateNewTodo event) async* {
    yield CreatingTodo();

    await todousecase.createTodo(event.todo);
    
    yield TodoCreated();
  }

  Stream<TodoState> _reload() async* {
    yield TodoInitial();
  }
}
