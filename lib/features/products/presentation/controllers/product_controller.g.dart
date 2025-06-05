// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsHash() => r'3b697f1012e33df03c316ae139692a2ada4f8381';

/// See also [getProducts].
@ProviderFor(getProducts)
final getProductsProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  getProducts,
  name: r'getProductsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$productControllerHash() => r'3cd21e0b3480dad800d53fe7b1e8ef4f0c3890d8';

/// See also [ProductController].
@ProviderFor(ProductController)
final productControllerProvider =
    AutoDisposeAsyncNotifierProvider<ProductController, void>.internal(
      ProductController.new,
      name: r'productControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$productControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProductController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
