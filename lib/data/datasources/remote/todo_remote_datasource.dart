import 'package:clean_code_architecture_flutter/common/constants/http_constants.dart';
import 'package:clean_code_architecture_flutter/common/http/http_client.dart';
import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';

class TodoRemoteDatasource {
  final HttpClient httpClient;
  TodoRemoteDatasource({this.httpClient});


  Future<TodoModel> createTodo(TodoModel todo) async {
    Map<String, dynamic> response = await httpClient.post(HttpConstants.createEndpoint, todo.toJson );
    return TodoModel.fromJSon(response);
  }
}
