import 'package:go_router/go_router.dart';
import 'package:magh/features/products/presentation/product_lists.dart';

class AppRoutes {
  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',

      routes: [
        GoRoute(
          path: '/',
        builder: (context,state) => ProductLists()
        ),
      ],
    );
  }
}
