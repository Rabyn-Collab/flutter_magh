import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/features/shared/instances.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_stream_provider.g.dart';

@riverpod
Stream<User?> userStream (Ref ref) {
  return FirebaseInstances.fireAuth.authStateChanges();
}
