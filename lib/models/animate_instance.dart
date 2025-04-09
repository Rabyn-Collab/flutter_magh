import 'package:freezed_annotation/freezed_annotation.dart';

part 'animate_instance.g.dart';

part 'animate_instance.freezed.dart';


@freezed
class AnimateInstance with _$AnimateInstance {
  const factory AnimateInstance({
  required double size,  
  required double radius,
  required double opacity  

  }) = _AnimateInstance;

  factory AnimateInstance.fromJson(Map<String, dynamic> json) =>
      _$AnimateInstanceFromJson(json);

  factory AnimateInstance.initial() => AnimateInstance(size: 200, radius: 10, opacity: 1);
}








