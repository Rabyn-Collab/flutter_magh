import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/core/app_theme/app_sizes.dart';
import 'package:magh/core/common_widgets/common_button.dart';
import 'package:magh/features/products/presentation/controllers/product_controller.dart';

class ProductLists extends ConsumerWidget {
  const ProductLists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(getProductsProvider);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Products List'),
          AppSizes.gapH20,
          CommonButton(label: 'Some Button', func: (){}, color: Colors.red,),
          CommonButton(label: 'Some Button', func: (){}, color:Colors.purple,),
          CommonButton(label: 'Some Button', func: (){}, color:Colors.teal,),
          // _buildElevatedButton(
          //   func: (){
          //     print('call 1');
          //   },
          //   label: 'Submit'
          // ),
          //
          // _buildElevatedButton(
          //     func: (){
          //       print('call 2');
          //     },
          //   label: 'Play'
          // ),

        ],
      ),
    );
    //   RefreshIndicator(
    //     onRefresh: () => ref.refresh(getProductsProvider.future),
    //     child: Center(
    //       child: productState.when(
    //        // skipLoadingOnRefresh: false,
    //           data: (data){
    //             return ListView.separated(
    //                 itemBuilder: (context, index){
    //                   return ListTile(
    //                     title: Text(data[index].title),
    //                     subtitle: Text(data[index].description),
    //                   );
    //                 } ,
    //                 separatorBuilder: (context, index){
    //                   return Divider();
    //                 },
    //                 itemCount: data.length
    //             );
    //           },
    //           error: (err, stack) => Column(
    //             children: [
    //               Text('$err'),
    //               ElevatedButton(onPressed: (){
    //                 ref.invalidate(getProductsProvider);
    //               }, child: Text('Refresh'))
    //             ],
    //           ) ,
    //           loading: () => Center(child: CircularProgressIndicator())
    //       ),
    //     ),
    // );
  }

  ElevatedButton _buildElevatedButton({required VoidCallback func, required String label}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      onPressed: func,
      child: Text(label),
    );
  }
}
