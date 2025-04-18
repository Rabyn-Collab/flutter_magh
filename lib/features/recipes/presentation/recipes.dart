import 'package:flutter/material.dart';


class Recipes extends StatelessWidget {
  const Recipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refactor'),
      ),
      body: Column(
        children: [

          _buildListTile('hi one', Icons.access_alarm_outlined),
          _buildListTile('hi two', Icons.skateboarding),
          _buildListTile('hi three', Icons.account_tree),

        ],
      ),
    );
  }

  ListTile _buildListTile(String label, IconData icon) {
    return ListTile(
          leading: Icon(icon),
          title: Text(label),
          trailing: Icon(Icons.add),
        );
  }
}







// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:magh/features/recipes/presentation/controllers/recipe_controller.dart';
// import 'package:cached_network_image/cached_network_image.dart';
//
// class Recipes extends ConsumerWidget {
//   const Recipes({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final recipeState = ref.watch(getRecipesProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Recipe List'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: recipeState.when(
//             data: (data){
//               return GridView.builder(
//                   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                     mainAxisExtent: 250,
//                     crossAxisSpacing: 20
//                   ),
//                   itemCount: data.length,
//                   itemBuilder: (context, index){
//                     final recipe = data[index];
//                     return Column(
//                       children: [
//                         Text(recipe.cuisine),
//                         ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: CachedNetworkImage(
//                              imageUrl:  recipe.image, fit: BoxFit.cover,)),
//                       ],
//                     );
//                   }
//               );
//             },
//             error: (err, st) => Text('$err'),
//             loading: () => Center(child: CircularProgressIndicator())
//         ),
//       ),
//     );
//   }
// }