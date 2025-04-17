import 'package:dio/dio.dart';
import 'package:magh/features/products/domain/product.dart';



class ProductRepository {

  final dio = Dio();

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


}