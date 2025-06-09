import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/core/api.dart';
import 'package:magh/core/app_theme/app_sizes.dart';

import 'controllers/product_controller.dart';


class ProductDetail extends ConsumerWidget {
  final String id;
  const ProductDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context, ref) {
    final productState = ref.watch(getProductProvider(productId: id));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: productState.when(
          data: (data) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch ,
              children: [

                Expanded(
                  child: Column(
                    children: [
                      CachedNetworkImage(imageUrl: '$base${data.image}'),
                      AppSizes.gapH20,
                      Text(data.title),
                      Text(data.price.toString()),
                    ],
                  ),
                ),


                ElevatedButton(onPressed: (){}, child: Text('Add To Cart'))
              ],
            ),
          ),
          error: (err, st) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
