import 'package:go_router/go_router.dart';
import 'package:magh/features/todos/presentation/todo_list.dart';

class AppRoutes {
  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => TodoList()
        ),
      ],
    );
  }
}
