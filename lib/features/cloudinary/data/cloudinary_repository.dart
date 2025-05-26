

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:magh/features/cloudinary/domain/cloudinary_response.dart';


class CloudinaryRepository {
 static final Dio dio = Dio();
static const baseApi = 'https://cloudy-api.onrender.com/api';

  static Future<CloudinaryResponse> uploadImageOrFile(File file)  async{
     try{
       final formData = FormData.fromMap({
         'file': await MultipartFile.fromFile(file.path),
       });
       final response = await dio.post(
           '$baseApi/files',
         data: formData
       );
       return CloudinaryResponse.fromJson(response.data);
     } catch (err){
       print(err);

       throw '$err';
     }
  }

 static Future<CloudinaryResponse> updateImageOrFile(File file, String publicId)  async{
   try{
     final formData = FormData.fromMap({
       'file': await MultipartFile.fromFile(file.path),
     });
     final response = await dio.patch(
         '$baseApi/files/$publicId',
         data: formData
     );
     return CloudinaryResponse.fromJson(response.data);
   } catch (err){

     throw '$err';
   }
 }

 static Future<void> removeImageOrFile(String publicId)  async{
   try{
      await dio.delete('$baseApi/files/$publicId');
   } catch (err){
     throw '$err';
   }
 }


  static Future<void> removeUser(String uid)  async{
    try{
      await dio.delete('$baseApi/users/$uid');
    } catch (err){
      throw '$err';
    }
  }




}