import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/features/products/presentation/controllers/product_controller.dart';


class ProductLists extends ConsumerWidget {
  const ProductLists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(getProductsProvider);
   // print(productState);
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(getProductsProvider.future),
        child: Center(
          child: productState.when(
           // skipLoadingOnRefresh: false,
              data: (data){
                return ListView.separated(
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(data[index].title),
                        subtitle: Text(data[index].description),
                      );
                    } ,
                    separatorBuilder: (context, index){
                      return Divider();
                    },
                    itemCount: data.length
                );
              },
              error: (err, stack) => Column(
                children: [
                  Text('$err'),
                  ElevatedButton(onPressed: (){
                    ref.invalidate(getProductsProvider);
                  }, child: Text('Refresh'))
                ],
              ) ,
              loading: () => Center(child: CircularProgressIndicator())
          ),
        ),
      ),
    );
  }
}