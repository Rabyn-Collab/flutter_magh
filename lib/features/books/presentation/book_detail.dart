import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magh/core/app_theme/app_sizes.dart';
import 'package:magh/features/books/domain/book.dart';
import 'package:magh/routes/route_enums.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [

          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: CachedNetworkImage(imageUrl: book.imageUrl)),
              Expanded(child: Column(
                children: [
                  Text(book.title),
                ],
              ))
            ],
          ),
          AppSizes.gapH20,
          
          Column(
            children: [
              ElevatedButton(onPressed: (){
                context.pushNamed(AppRoute.pdf.name, extra: book.fileUrl);

              }, child: Text('Read Book')),
            ],
          )

        ],
      ),
    );
  }
}
