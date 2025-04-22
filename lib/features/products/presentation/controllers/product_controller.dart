import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/features/products/data/product_repository.dart';
import 'package:magh/features/products/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';


@riverpod
Future<List<Product>> getProducts (Ref ref) async {
  return ref.read(productRepositoryProvider).getProducts();
}




