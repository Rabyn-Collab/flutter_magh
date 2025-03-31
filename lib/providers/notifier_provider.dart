import 'package:flutter_riverpod/flutter_riverpod.dart';
//
//
// abstract class T{
//   void nim();
// }
//
// class A extends T{
//   @override
//   void nim() {
//     // TODO: implement nim
//   }
//
// }


class TodoProvider extends Notifier{
  @override
  List build() {
    return [];
  }

}


final todoProvider = NotifierProvider(() => TodoProvider());