import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/order_controller.dart';

class OrderDetail extends ConsumerWidget {
  final String orderId;
  const OrderDetail({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, ref) {
    final orderState = ref.watch(getOrderProvider(orderId: orderId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail- $orderId', style: TextStyle(fontSize: 14) ,),
      ),
      body:  orderState.when(
          data: (data) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(data.id),
                Text(data.createdAt),
                Text(data.totalAmount.toString()),
              ],
            ),
          ),
          error: (err, st) {
           // print(st);
            return Text(err.toString());
          },
          loading: () => const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
