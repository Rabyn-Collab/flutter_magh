import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/features/products/domain/product.dart';
import 'package:magh/features/shared/client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'product_repository.g.dart';

class ProductRepository {

  final Dio dio;
  ProductRepository(this.dio);

 Future<List<Product>> getProducts() async{
   try{
      final response = await dio.get('https://dummyjson.com/products');

     return (response.data['products'] as List).map((product){
       return Product.fromJson(product);
      }).toList();

   }catch (err){
     throw 'something went wrong';

   }
 }

  Future<Product> getProductDetail(int id) async{
    try{
      final response = await dio.get('https://dummyjson.com/products/$id');
      return Product.fromJson(response.data);

    }catch (err){
      throw 'something went wrong';

    }
  }


}

@riverpod
ProductRepository productRepository (Ref ref) {
  return ProductRepository(ref.watch(clientProvider));
}