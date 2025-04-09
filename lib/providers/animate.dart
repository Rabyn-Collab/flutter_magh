import 'package:magh/models/animate_instance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'animate.g.dart';



@riverpod
class Animate extends _$Animate {
  @override
   AnimateInstance  build() {
    return  AnimateInstance.initial();
  }

 void change ({
   double? size,
   double? radius,
   double? opacity
   }) {
    state = state.copyWith(
      size: size ?? state.size,
      radius: radius ?? state.radius,
      opacity: opacity ?? state.opacity
    );

 }


}
