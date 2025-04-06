import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/providers/notifier_provider.dart';


class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final todoList = ref.watch(todoProvider);
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
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
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
