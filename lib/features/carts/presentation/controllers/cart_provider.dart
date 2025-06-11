import 'package:hive_flutter/hive_flutter.dart';
import 'package:magh/features/carts/domain/cart.dart';
import 'package:magh/features/products/domain/product.dart';
import 'package:magh/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';


@riverpod
class CartController extends _$CartController {
  @override
  List<Cart> build() {
    return ref.watch(cartBoxProvider);
  }

  void addToCart(Product product){
    final isExist = state.firstWhere((cart) => cart.id == product.id, orElse:() => Cart(title: 'no-item', image: '', price: 0, qty: 0, id: ''));
    if(isExist.title == 'no-item'){
      final newCart = Cart(
          title: product.title,
          image: product.image,
          price: product.price,
          qty: 1,
          id: product.id
      );
      state.add(newCart);
      Hive.box<Cart>('carts').add(newCart);
    }else{
      isExist.qty = isExist.qty + 1;
      isExist.save();

    }

  }

  void singleAdd(Cart cart){
    cart.qty = cart.qty + 1;
    cart.save();

    state = [
      for(final oldCart in state) oldCart.id == cart.id ? cart: oldCart
    ];

  }

  void singleRemove(Cart cart){
    if(cart.qty == 1) return;
    cart.qty = cart.qty - 1;
    cart.save();

    state = [
      for(final oldCart in state) oldCart.id == cart.id ? cart: oldCart
    ];
  }


}
