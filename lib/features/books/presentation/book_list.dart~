import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:magh/routes/route_enums.dart';

import 'controllers/book_controller.dart';

class BookList extends ConsumerWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookState = ref.watch(bookStreamProvider);
    return bookState.when(data: (data){
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final book = data[index];
            return MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                context.pushNamed(AppRoute.bookDetail.name, extra: book);
              },
              child: Card(
                child: Column(
                  children: [
                    CachedNetworkImage(
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: book.image),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(book.title),
                          Text('Author:-${book.author}'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );

          }
      );
    },
        error: (err, st)=> Text(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator(),)
    );
  }
}