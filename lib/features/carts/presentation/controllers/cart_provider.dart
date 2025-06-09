import 'package:magh/features/carts/domain/cart.dart';
import 'package:magh/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';


@riverpod
class CartController extends _$CartController {
  @override
  List<Cart> build() {
    return ref.watch(cartBoxProvider);
  }
}
