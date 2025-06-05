import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magh/core/api.dart';
import 'package:magh/core/exception/api_exception.dart';
import 'package:magh/features/products/domain/product.dart';
import 'package:magh/features/shared/client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';


class ProductRepository {


  final Dio client;
  ProductRepository(this.client);

  Future<List<Product>> getProducts () async{
    try{
      final response = await client.get(products);
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }


  Future<void> addProduct ({required Map<String, dynamic> data, required XFile image, required String token}) async{
    final formData = FormData.fromMap({
      ...data,
      'image': await MultipartFile.fromFile(image.path, filename: image.name),
    });
    try{
       await client.post(products, data: formData, options: Options(headers: {'Authorization': token}));
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

}


@riverpod
ProductRepository productRepo (Ref ref) {
  return ProductRepository(ref.watch(clientProvider));
}