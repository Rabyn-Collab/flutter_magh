import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:magh/app_theme/app_sizes.dart';
import 'package:magh/models/book.dart';


class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(book.image))
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(book.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),),
                      Column(
                        children: [
                          Text(book.rating),
                          Text(book.genre),
                        ],
                      )
                    ],
                  ),
                  AppSizes.gapH16,
                  Text(book.detail),
                  AppSizes.gapH16,
                  Row(
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text('Read Book')),
                      OutlinedButton(onPressed: (){}, child: Text('Read Book')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
      
      // Stack(
      //   children: [
      //    Column(
      //      children: [
      //        CachedNetworkImage(imageUrl: book.image),
      //      ],
      //    ),
      //     Positioned(
      //       bottom: 0,
      //       child: Container(
      //         height: 500,
      //         color: Colors.white,
      //         child: SingleChildScrollView(
      //           child: Padding(
      //             padding: const EdgeInsets.all(10.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(book.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),),
      //                     Column(
      //                       children: [
      //                         Text(book.rating),
      //                         Text(book.genre),
      //                       ],
      //                     )
      //                   ],
      //                 ),
      //                 AppSizes.gapH16,
      //                 Text(book.detail),
      //                 AppSizes.gapH16,
      //                 Row(
      //                   children: [
      //                     ElevatedButton(onPressed: (){}, child: Text('Read Book')),
      //                     OutlinedButton(onPressed: (){}, child: Text('Read Book')),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //
      //   ],
      // ),
    );
  }
}





// class DetailPage extends StatelessWidget {
//   final Book book;
//   const DetailPage({super.key, required this.book});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               CachedNetworkImage(imageUrl: book.image),
//             ],
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               height: 500,
//               color: Colors.white,
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(book.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),),
//                           Column(
//                             children: [
//                               Text(book.rating),
//                               Text(book.genre),
//                             ],
//                           )
//                         ],
//                       ),
//                       AppSizes.gapH16,
//                       Text(book.detail),
//                       AppSizes.gapH16,
//                       Row(
//                         children: [
//                           ElevatedButton(onPressed: (){}, child: Text('Read Book')),
//                           OutlinedButton(onPressed: (){}, child: Text('Read Book')),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
