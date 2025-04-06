import 'package:uuid/uuid.dart';

class Todo {
  final String todo;
  final String id;
  final bool isCompleted;

  Todo({required this.todo, required this.isCompleted, required this.id});

  factory Todo.build(String todo){
    return Todo(todo: todo, isCompleted: false, id: Uuid().v4());
  }


  Todo copyWith ({String? todo, bool? isCompleted}){
    return Todo(todo: todo ?? this.todo, isCompleted: isCompleted ?? this.isCompleted, id: this.id);
  }

}
