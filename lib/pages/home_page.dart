import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/app_theme/app_sizes.dart';
import 'package:magh/providers/notifier_provider.dart';
import 'package:magh/providers/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Providers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('This is normal provider', style: Theme.of(context).textTheme.headlineLarge,),
            AppSizes.gapH14,
            Consumer(
              builder: (c, ref, child) {
                final someNumber = ref.watch(someVar);
                return Text('$someNumber', style: Theme.of(context).textTheme.displayLarge);
              }
            ),
            AppSizes.gapH20,
            AppSizes.gapH20,
            AppSizes.gapH20,
            Consumer(
              builder: (context, ref, child) {
                final counter = ref.watch(counterProvider);
                return Column(
                  children: [
                    Text('$counter', style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              ref.read(counterProvider.notifier).increment();
                            }, child: Text('increment')),
                        AppSizes.gapW10,
                        ElevatedButton(
                            onPressed: () {
                              ref.read(counterProvider.notifier).decrement();
                            }, child: Text('decrement')),
                      ],
                    )
                  ],
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
