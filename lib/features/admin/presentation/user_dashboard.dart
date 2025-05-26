import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:magh/features/admin/presentation/controllers/user_list_controller.dart';
import 'package:magh/routes/route_enums.dart';

import 'controllers/user_controller.dart';

class UserDashboard extends ConsumerWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.listen(userControllerProvider, (previous, next) {
      next.maybeWhen(
        data: (data) {
          context.pop();
        },
        error: (err, st) =>
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(err.toString()))),
        orElse: () => null,
      );
    });

    final userState = ref.watch(usersStreamProvider);
    final userController = ref.watch(userControllerProvider);
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
                    child: Text('Total Users:-${data.length}'),
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
                                    context.pushNamed(AppRoute.userEdit.name, extra:user);
                                  }, icon: const Icon(Icons.edit)),
                                  IconButton(onPressed: (){
                                    showDialog(context: context, builder:(context) {
                                      return AlertDialog(
                                          title: const Text('Remove User'),
                                          content: const Text('Are you sure you want to Remove this user ?'),
                                          actions: [
                                            TextButton(onPressed: () {
                                                 context.pop();
                                            }, child: const Text('Cancel')),
                                            TextButton(onPressed: () {
                                              ref.read(userControllerProvider.notifier).removeUser(userId: user.uid);
                                            }, child: userController.isLoading ? Center(child: const CircularProgressIndicator()) : const Text('Remove'))
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