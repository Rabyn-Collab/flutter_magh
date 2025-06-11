import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magh/features/home/presentation/widgets/drawer_widget.dart';
import 'package:magh/features/products/presentation/product_list.dart';
import 'package:magh/routes/route_enums.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Shop App'),
        actions: [
          IconButton(onPressed: (){
            context.pushNamed(AppRoute.cart.name);
          }, icon: Icon(Icons.shopping_bag))
        ],
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
