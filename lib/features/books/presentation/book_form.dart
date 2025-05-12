import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/core/app_theme/app_sizes.dart';
import 'package:magh/features/books/presentation/controllers/book_controller.dart';
import 'package:magh/features/shared/file_provider.dart';

class BookForm extends ConsumerStatefulWidget {
  const BookForm({super.key});

  @override
  ConsumerState createState() => _BookFormState();
}

class _BookFormState extends ConsumerState<BookForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final file = ref.watch(fileControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormBuilder(
            key: _formKey,
            child: ListView(
              children: [
              InkWell(
                  onTap: (){
                    ref.read(fileControllerProvider.notifier).pickFile();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    height: 50,
                    child: Center(child: Text(file == null ? 'Select File' : file.path)),
                  )
              ),
                AppSizes.gapH16,

                ElevatedButton(onPressed: (){
                  if(file != null){
                    ref.read(bookControllerProvider.notifier).addBook(file: file);
                  }

                }, child: Text('Submit'))

              ],
            )
        ),
      )
    );
  }
}
