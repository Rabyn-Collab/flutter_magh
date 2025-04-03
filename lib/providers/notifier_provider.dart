import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/models/todo.dart';





class TodoProvider extends Notifier<List<Todo>>{

  // List <Todo>
  @override
  List<Todo>  build() {
     return [Todo.build('hello jee')];
  }

  void addTodo(String todo){
    state = [...state, Todo.build(todo)];
  }

}

final todoProvider = NotifierProvider<TodoProvider, List<Todo>>(() => TodoProvider());