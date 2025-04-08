import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/providers/theme_provider.dart';
import 'package:magh/routes/app_routes.dart';



/// provider , notifier provider, future provider, async notifier provider, stream provider

void main (){



runApp(ProviderScope(child: Home()));
}




class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(themeProvider);
    return  MaterialApp.router(
      routerConfig: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: state ?  ThemeData.dark(): ThemeData.light(),
    );
  }
}
