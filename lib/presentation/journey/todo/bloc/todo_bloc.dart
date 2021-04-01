import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/domain/usescases/todo_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Todousecase todousecase;

  TodoBloc({this.todousecase});

  @override
  TodoState get initialState => TodoInitial();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is GetTodo) {
      yield TodoLoading();
      try {
        final data = await todousecase.fetchTodo();

        yield TodoLoaded(todoList: data);
      } catch (e) {
        yield TodoError();
      }
    }

    if (event is CreateTodo) {
      print('CREATE');
      yield TodoLoading();
      try {
        Map<String, dynamic> payload = {'description': event.description};
        await todousecase.createTodo(payload: payload);
        print('CREATED TODO');
        yield CreateTodoSuccess();
      } catch (e) {
        yield TodoError();
      }
    }
  }
}
