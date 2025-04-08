import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:magh/models/todo.dart';
import 'package:magh/providers/notifier_provider.dart';


class TextT{
  String m = '';
  void g (){
    print('hello');
  }

  void c(){
    print('sello');
  }
}

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final todoList = ref.watch(todoProvider);

    // print(TextT()..m = 'jio');
    return ListView.separated(
         shrinkWrap: true,
        itemBuilder: (context, index){
           final data = todoList[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            title: Text(data.todo),
            subtitle: CheckboxListTile(
              contentPadding: EdgeInsets.zero,
                title: Text('Is Completed'),
                dense: true,
                value: data.isCompleted,
                onChanged: (val){
                ref.read(todoProvider.notifier).updateTodoCompleted(data.id);

                }
            ),
            trailing: SizedBox(
              width: 97,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                      return TodoEdit(todo: data,);
                    });

                  }, icon: Icon(Icons.edit)),
                  IconButton(onPressed: (){

                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text('Are you sure ?'),
                        actions: [
                          TextButton(onPressed: (){
                            context.pop();
                          }, child: Text('No')),
                          TextButton(onPressed: (){
                            context.pop();
                            ref.read(todoProvider.notifier).removeTodo(data.id);
                          }, child: Text('yes')),
                        ],
                      );
                    });

                  }, icon: Icon(Icons.delete)),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount:todoList.length
    );
  }
}


class TodoEdit extends StatefulWidget {
  final Todo todo;
  const TodoEdit({super.key, required this.todo});

  @override
  State<TodoEdit> createState() => _TodoEditState();
}

class _TodoEditState extends State<TodoEdit> {
  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   // print(todoController.text);
    return Consumer(
      builder: (context, ref, child) => AlertDialog(
        title: TextFormField(
          controller: todoController..text = widget.todo.todo,
        ),
        actions: [
          TextButton(onPressed: (){
            context.pop();
          }, child: Text('Cancel')),
          TextButton(onPressed: (){
            context.pop();
            ref.read(todoProvider.notifier).updateTodo(widget.todo.id, todoController.text);
          }, child: Text('Update')),
        ],

      ),
    );
  }
}
