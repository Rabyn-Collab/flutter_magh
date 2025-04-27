import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.g.dart';
part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
   required String id,
   required String todo_task,
   required bool isComplete,

  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
