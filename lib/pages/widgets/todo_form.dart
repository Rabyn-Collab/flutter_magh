import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/providers/notifier_provider.dart';


class TodoForm extends StatefulWidget {
  const TodoForm({super.key});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child){
          return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormBuilder(
          child: Column(
            children: [
              FormBuilderTextField(
                controller: todoController,
                  name: 'todo',
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(),
                  hintText: 'Add Todo'
                ),
                onSubmitted: (val){
                    if(val!.isNotEmpty){
                      ref.read(todoProvider.notifier).addTodo(val);
                      todoController.clear();
                    }

                },
              ),
            ],
          )
      ),
    );
        }
    );
  }
}


