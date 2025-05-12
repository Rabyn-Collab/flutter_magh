import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:magh/features/authentication/presentaion/login.dart';
import 'package:magh/features/authentication/presentaion/sign_up.dart';
import 'package:magh/features/books/presentation/book_form.dart';
import 'package:magh/features/home/presentation/home_page.dart';
import 'package:magh/features/shared/user_stream_provider.dart';
import 'package:magh/routes/route_enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';


@riverpod
GoRouter  router(Ref ref) {
  final userState = ref.watch(userStreamProvider);
  return  GoRouter(
    redirect: (context, state){
      final authenticated = userState.valueOrNull !=null;
      final authenticating = (state.matchedLocation == '/login' || state.matchedLocation == '/signUp');
      if(authenticated == false){
        return authenticating ? null : '/login';
      }
      return null;
    },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state){
            return NoTransitionPage(child: HomePage());
          }
        ),

        GoRoute(
            path: '/login',
            pageBuilder: (context, state){
              return NoTransitionPage(child: Login());
            }
        ),
        GoRoute(
            path: '/signUp',
            name: AppRoute.signup.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: SignUp());
            }
        ),
        GoRoute(
            path: '/book-form',
            name: AppRoute.bookForm.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: BookForm());
            }
        )
      ]
  );
}
