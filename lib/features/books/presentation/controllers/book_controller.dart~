import 'dart:io';

import 'package:magh/features/books/data/book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_controller.g.dart';

@riverpod
class BookController extends _$BookController {
  @override
  FutureOr<void> build()  {}

  Future<void> addBook ({required File file}) async{
    state = const AsyncLoading();
    state  = await AsyncValue.guard(() => ref.read(bookRepoProvider).addBook(file: file));
  }
}
