import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:magh/features/admin/presentation/controllers/user_list_controller.dart';
import 'package:magh/routes/route_enums.dart';

class UserDashboard extends ConsumerWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersStreamProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users Dashboard'),
          actions: [
            IconButton(onPressed: (){
              context.pushNamed(AppRoute.bookForm.name);
            }, icon: const Icon(Icons.add))
          ],
        ),
        body: userState.when(
            data: (data){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text('Total Books:-${data.length}'),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index){
                          final user = data[index];
                          return ListTile(
                            onTap: (){
                              //context.pushNamed(AppRoute.bookDetail.name, extra: book);
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(user.image),
                            ),
                            title: Text(user.username),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(onPressed: (){
                                   // context.pushNamed(AppRoute.bookEdit.name, extra: book);
                                  }, icon: const Icon(Icons.edit)),
                                  IconButton(onPressed: (){
                                    showDialog(context: context, builder:(context) {
                                      return AlertDialog(
                                          title: const Text('Delete Book'),
                                          content: const Text('Are you sure you want to delete this book?'),
                                          actions: [
                                            TextButton(onPressed: () {

                                            }, child: const Text('Cancel')),
                                            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Delete'))
                                          ]
                                      );
                                    });
                                  }, icon: const Icon(Icons.delete))
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context,index) => Divider(),
                        itemCount: data.length
                    ),
                  ),
                ],
              );
            },
            error: (err, st) => Text(err.toString()),
            loading: () => const Center(child: CircularProgressIndicator(),)
        )


    );
  }
}