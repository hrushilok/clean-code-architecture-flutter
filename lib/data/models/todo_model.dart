import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  DateTime createdAt;
  DateTime updatedAt;
  int todo;
  String owner;

  TodoModel({
    String id,
    bool completed,
    String description,
    this.owner,
    this.todo
  }) : super(id: id, completed: completed, description: description);
  
  TodoModel.fromJSon(Map<String, dynamic> json) {
    this.id = json["_id"];
    this.owner = json["owner"];
    this.description = json["description"];
    this.completed = json["completed"];
    this.createdAt = DateTime.parse(json["createdAt"]);
    this.updatedAt = DateTime.parse(json["updatedAt"]);
    this.todo = json["__v"];
  }

  Map<String, dynamic> get toJson {

    if(id == null){
      return  { 'description': description, 'completed': completed};
    }
  }
}