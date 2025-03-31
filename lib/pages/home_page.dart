import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
            Text('This is normal provider'),
            Consumer(
              builder: (c, ref, child) {
                final someNumber = ref.watch(someVar);
                return Text('$someNumber');
              }
            ),
          ],
        ),
      ),
    );
  }
}
