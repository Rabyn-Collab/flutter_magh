import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:magh/features/admin/presentation/admin_dashboard.dart';
import 'package:magh/features/admin/presentation/product_edit_form.dart';
import 'package:magh/features/admin/presentation/product_form.dart';
import 'package:magh/features/authentication/presentaion/login.dart';
import 'package:magh/features/authentication/presentaion/sign_up.dart';
import 'package:magh/features/home/presentation/home_page.dart';
import 'package:magh/features/products/domain/product.dart';
import 'package:magh/features/shared/user_state_provider.dart';
import 'package:magh/routes/route_enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';


@riverpod
GoRouter  router(Ref ref) {
  final userState = ref.watch(userStateProviderProvider);
  return  GoRouter(
    initialLocation: '/',
    redirect: (context, state){
      final authenticated = userState.token.isNotEmpty;
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
          },
          routes: [


          ]
        ),

        GoRoute(
            path: '/admin',
            name: AppRoute.admin.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: AdminDashboard());
            },
          routes: [
            GoRoute(
              path: 'productAdd',
                name: AppRoute.productAdd.name,
                pageBuilder: (context, state){
                  return NoTransitionPage(child: ProductForm());
                }
            ),
            GoRoute(
                path: 'productEdit',
                name: AppRoute.productEdit.name,
                pageBuilder: (context, state){
                  return NoTransitionPage(child: ProductEditForm(product: state.extra as Product));
                }
            )
          ]
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


      ]
  );
}
