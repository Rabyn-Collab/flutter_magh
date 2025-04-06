import 'package:flutter/material.dart';
import 'package:magh/pages/widgets/todo_form.dart';
import 'package:magh/pages/widgets/todo_list.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // final l = [{'id': 1, 'todo': 'hello'}];
    // l[0] = {};
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView(
        children: [

          TodoForm(),

          TodoList()

        ],
      ),
    );
  }
}
