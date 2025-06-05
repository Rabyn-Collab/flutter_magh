import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magh/features/products/data/product_repository.dart';
import 'package:magh/features/products/domain/product.dart';
import 'package:magh/features/shared/user_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';


@riverpod
Future<List<Product>> getProducts (Ref ref) async {
  return ref.watch(productRepoProvider).getProducts();
}


@riverpod
class ProductController extends _$ProductController {
  @override
  FutureOr<void> build() {}

  Future<void> addProduct (Map<String, dynamic> data, XFile image  ) async{
    state = const AsyncLoading();
    final user =  ref.read(userStateProviderProvider);
    state  = await AsyncValue.guard(() =>ref.read(productRepoProvider).addProduct(data: data, image: image, token: user.token));

  }
}