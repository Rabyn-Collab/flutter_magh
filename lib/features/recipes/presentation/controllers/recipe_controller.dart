import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/features/recipes/data/recipe_repository.dart';
import 'package:magh/features/recipes/domain/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_controller.g.dart';


@riverpod
Future<List<Recipe>> getRecipes (Ref ref) async {
  return RecipeRepository().getRecipes();
}
