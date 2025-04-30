
import 'package:dio/dio.dart';

class ApiException  {

final DioException exception;
ApiException(this.exception);
  String  get errorMessage {
    switch(exception.type) {
      case DioExceptionType.cancel:
        return 'Request to API server was cancelled';

      case DioExceptionType.connectionTimeout:
        return 'Connection timeout with API server';

      case DioExceptionType.receiveTimeout:

        return 'Receive timeout in connection with API server';

      case DioExceptionType.badResponse:
        return '${exception.response}';

      case DioExceptionType.unknown:
        return 'Unexpected error occurred';

      case DioExceptionType.sendTimeout:
        return 'Send timeout in connection with API server';

      case DioExceptionType.badCertificate:
       return 'Error occurred while communication with API server';

      case DioExceptionType.connectionError:
        return 'please check your internet connection';
      }
  }


}