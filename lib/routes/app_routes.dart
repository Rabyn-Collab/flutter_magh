import 'package:go_router/go_router.dart';
import 'package:magh/features/todos/presentation/todo_form.dart';
import 'package:magh/features/todos/presentation/todo_list.dart';
import 'package:magh/routes/route_enums.dart';

class AppRoutes {
  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => TodoList(),
          routes: [
            GoRoute(
                path: 'todo-form',
              name: AppRoute.todoForm.name,
              builder: (context, state) => TodoForm()
            )
          ]
        ),

      ],
    );
  }
}
