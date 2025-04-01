import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/models/todo.dart';
import 'package:uuid/uuid.dart';



class TodoProvider extends Notifier<List<Todo>>{

  @override
  List<Todo> build() {
   return [];
  }

   void addTodo(String todo){
    final newTodo = Todo(
        id: Uuid().v4(),
        isCompleted: false,
        todo: todo
    );

   state = [...state, newTodo];

   }


}














class CounterProvider extends Notifier<int>{

  @override
   int  build() {
    return 0;
  }

  void increment(){
    state++;
  }

  void decrement(){
     state--;
  }

}



final counterProvider = NotifierProvider<CounterProvider, int>(() => CounterProvider());