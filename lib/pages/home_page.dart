import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/app_theme/app_sizes.dart';
import 'package:magh/providers/animate.dart';



class HomePage extends ConsumerWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(animateProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            height: state.size,
              width: state.size,
              color: Colors.red,
              duration: Duration(milliseconds: 400),
          ),
          AppSizes.gapH16,
          ElevatedButton(onPressed: (){
            ref.read(animateProvider.notifier).change(size: state.size +10);
          }, child: Text('Click To Increase')),
          ElevatedButton(onPressed: (){
            ref.read(animateProvider.notifier).change(size: state.size -10);
          }, child: Text('Click To Decrease')),


          AnimatedOpacity(
              opacity: state.opacity,
              duration: Duration(milliseconds: 400),
            child: Image.asset('assets/images/peter-herrmann-PSD0PPhxUgE-unsplash.jpg', height: 200,),

          ),
          ElevatedButton(onPressed: (){
            ref.read(animateProvider.notifier).change(opacity: 0.5);
          }, child: Text('Click To Opacity')),
        ],
      ),
    );
  }
}
