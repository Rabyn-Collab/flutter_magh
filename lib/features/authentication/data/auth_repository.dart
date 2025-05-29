import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magh/core/api.dart';
import 'package:magh/core/exception/api_exception.dart';
import 'package:magh/features/shared/client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'auth_repository.g.dart';

class AuthRepository{
  final Dio dio;

  AuthRepository(this.dio);

  Future<void> userLogin (Map<String, dynamic> amp) async{
    try{
    final response =   await dio.post(login, data: amp);
      print(response.data);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

  Future<void> userRegister (Map<String, dynamic> amp) async{
    try{
      await dio.post(register, data: amp);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }




  
}


@riverpod
AuthRepository  authRepo(Ref ref) {
  return AuthRepository(ref.watch(clientProvider));
}