
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/features/home/domain/user_data.dart';
import 'package:magh/features/shared/instances.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';



@riverpod
Stream<UserData> userProfileStream (Ref ref) {
  return FirebaseInstances.userDb.doc(FirebaseInstances.fireAuth.currentUser!.uid).snapshots().map((event) {
    final map = event.data() as Map<String, dynamic>;
    return map == null ? UserData(
        username: '', email: '',
        public_id: '',
        image: '', phone:0, uid: '', role: '')
        : UserData(
        username: map['username'],
        email: map['email'],
        public_id: map['public_id'],
        role: map['role'],
        image: map['image'],
        phone: map['phone'], uid: event.id);
  });
}
