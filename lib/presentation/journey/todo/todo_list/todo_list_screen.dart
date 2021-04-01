import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import './widgets/todo_item.dart';
import 'package:clean_code_architecture_flutter/presentation/widgets/error.dart';
import 'package:clean_code_architecture_flutter/presentation/widgets/loader.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({
    Key key,
  }) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TodoBloc todoBloc;
  TodoEntity todo;

  @override
  void initState() {
    todoBloc = BlocProvider.of<TodoBloc>(context);
    todoBloc.add(GetTodo());
    super.initState();
  }

  @override
  void dispose() {
    todoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) => RefreshIndicator(
        onRefresh: () async {
          todoBloc.add(GetTodo());
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('TODOS'),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () async {
                    await Navigator.of(context).pushNamed(
                      RouteList.createTodo,
                    );
                    todoBloc.add(GetTodo());
                  })
            ],
          ),
          body: BlocConsumer(
              bloc: todoBloc,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is TodoLoading) {
                  return LoaderComponent();
                }
                if (state is TodoLoaded) {
                  return Center(
                    child: Container(
                      child: ListView.builder(
                          itemCount: state.todoList.length,
                          itemBuilder: (context, index) {
                            return TodoItems(
                              todoBloc: todoBloc,
                              todo: state.todoList[index],
                            );
                          }),
                    ),
                  );
                }
                if (state is TodoError) {
                  return ErrorComponent(
                    errorMessage: 'error',
                    onRetryPressed: () => todoBloc.add(GetTodo()),
                  );
                }
                return Container();
              }),
        ),
      );
}
