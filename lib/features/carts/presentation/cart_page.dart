import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/core/api.dart';
import 'package:magh/features/carts/presentation/controllers/cart_provider.dart';


class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index){
                    return Divider();
                  },
                  itemCount: carts.length,
                    itemBuilder: (context, index){
                    final cart = carts[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: CachedNetworkImage(imageUrl: '$base/${cart.image}', height: 100, width: double.infinity, fit: BoxFit.cover,)),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(cart.title),
                                  Text('Rs, ${cart.price}'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlinedButton(onPressed: (){
                                        ref.read(cartControllerProvider.notifier).singleRemove(cart);
                                      }, child : Icon(CupertinoIcons.minus)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text('${cart.qty}'),
                                      ),
                                      OutlinedButton(onPressed: (){
                                        ref.read(cartControllerProvider.notifier).singleAdd(cart);
                                      }, child : Icon(Icons.add)),

                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )

                      ],
                    );
                    }
                )),
            ElevatedButton(onPressed: (){}, child: Text('Place an Order')),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}