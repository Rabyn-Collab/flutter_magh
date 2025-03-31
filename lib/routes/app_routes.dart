import 'package:go_router/go_router.dart';
import 'package:magh/pages/home_page.dart';

class AppRoutes {
  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',

      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return NoTransitionPage(child: HomePage());
          },
        ),
      ],
    );
  }
}
