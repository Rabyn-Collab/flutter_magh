import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/features/meals/data/meal_repository.dart';
import 'package:magh/features/meals/domain/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal_controller.g.dart';


@riverpod
Future<List<CategoryData>> getMealCategory(Ref ref) async {
  return ref.read(mealRepositoryProvider).getCategories();
}
