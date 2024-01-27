import 'package:dio/dio.dart';

abstract class Failure{
  final String errMessage ;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure{
  ServerFailure(super.errMessage);


  factory ServerFailure.fromDioError(DioException dioException) {

    switch(dioException.type){

      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection time out with Api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send time out with Api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive time out with Api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate time out with Api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!,
            dioException.response!.data
        ) ;
      case DioExceptionType.cancel:
        return ServerFailure('Request with Api was cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('connection error out with Api server');
      case DioExceptionType.unknown:
        if(dioException.message!.contains('SocketException')){
          return ServerFailure('No Internet Connection');
        }
        return  ServerFailure('Unexpected Error , please try again later ');


    }
  }
  factory ServerFailure.fromResponse(int statesCode,dynamic response){
    if(statesCode==400||statesCode==401||statesCode==403) {
      return ServerFailure(response['error']['message']) ;
    }else if(statesCode==404) {
      return ServerFailure('your request not found , Please try again!') ;
    }else if(statesCode==500) {
      return ServerFailure('Internal server error , Please try again!') ;
    }else {
      return ServerFailure('Opps There was an error');
    }


  }
}