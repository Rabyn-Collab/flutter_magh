import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:magh/features/shared/validate_provider.dart';

import 'controllers/todo_controller.dart';



class TodoForm extends ConsumerStatefulWidget {
  const TodoForm({super.key});

  @override
  ConsumerState<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends ConsumerState<TodoForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(todoControllerProvider, (prev, next){
      next.maybeWhen(
          data: (d) {
            context.pop();
          },
          error: (err, st) =>ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 1),
              content: Text('success')))
          , orElse: () => null
      );
    });

    final mode = ref.watch(validateControllerProvider);
    final todoState = ref.watch(todoControllerProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormBuilder(
          key: _formKey,
            autovalidateMode:mode,
            child: ListView(
              children: [
                FormBuilderTextField(
                    name: 'todo_task',
                  decoration: InputDecoration(
                    label: Text('Todo Task'),
                    //hintText: 'Todo Task'
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(5),
                    FormBuilderValidators.maxLength(30),
                  ]),
                ),

                FormBuilderCheckbox(
                    name: 'isComplete',
                    title: Text('Completed'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),

                  ]),
                ),

                ElevatedButton(
                    onPressed: todoState.isLoading ? null : (){
                      FocusScope.of(context).unfocus();
                      if(_formKey.currentState!.saveAndValidate(focusOnInvalid: false)){
                        final value = _formKey.currentState!.value;
                      ref.read(todoControllerProvider.notifier).addTodo(value);
                      }else{
                        ref.read(validateControllerProvider.notifier).change();
                      }
                    },
                    child: todoState.isLoading ? CircularProgressIndicator() : Text('Submit')
                )

              ],
            )
        ),
      ),
    );
  }
}
