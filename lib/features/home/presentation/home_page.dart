import 'package:flutter/material.dart';
import 'package:magh/features/home/presentation/widgets/drawer_widget.dart';
import 'package:magh/features/products/presentation/product_list.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Shop App'),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ProductList(),
          ],
        )
      ),
    );
  }
}
