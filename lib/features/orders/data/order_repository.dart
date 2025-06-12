import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/core/api.dart';
import 'package:magh/core/exception/api_exception.dart';
import 'package:magh/features/carts/domain/cart.dart';
import 'package:magh/features/shared/client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_repository.g.dart';


class OrderRepository{
  final Dio client;
  
  OrderRepository({required this.client});


  Future<void> addOrder({required int totalAmount, required List<Cart> carts}) async{
    try{
      await client.post(orders, data: {
        'totalAmount': totalAmount,
        'orderItems': carts.map((e) => e.toJson()).toList()
      });
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }
}


@riverpod
 OrderRepository orderRepo(Ref ref) {
  return OrderRepository(client: ref.watch(authClientProvider));
}