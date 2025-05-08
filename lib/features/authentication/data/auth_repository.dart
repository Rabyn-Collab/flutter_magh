import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/features/shared/instances.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'auth_repository.g.dart';

class AuthRepository{

  Future<void> userLogin ({required String email, required String password}) async{
    try{
      await FirebaseInstances.fireAuth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(err){
      throw '${err.message}';
    }
  }


  Future<void> userSignUp ({required String username, required String email, required String password}) async{
    try{
      await FirebaseInstances.fireAuth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(err){
      throw '${err.message}';
    }
  }
  
}


@riverpod
AuthRepository  authRepo(Ref ref) {
  return AuthRepository();
}