import 'package:book/core/error/failures.dart';
import 'package:book/core/utiles/api_service.dart';
import 'package:book/features/home/data/models/book_models/book_models.dart';
import 'package:book/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo{

  final ApiService apiService ;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModels>>> fetchNewestBooks() async {
    
   try {
     var data= await apiService.get(
         endPoint:
         'volumes?Filtering=free-ebooks&q=subject:computer science&sorting=newest');
     List<BookModels>books=[] ;
     for (var item in data['items']){
       try{
         books.add(BookModels.fromJson(item)) ;
       }catch(e){
         print(e.toString()) ;

       }
     }
     return right(books)  ;

   } catch (e ) {
     if(e is DioException){
       return left(ServerFailure.fromDioError(e)) ;
     }
     return left(ServerFailure(e.toString())) ;


   }
  }

  @override
  Future<Either<Failure, List<BookModels>>> fetchFeaturedBooks() async {
    try {
      var data= await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<BookModels>books=[] ;
      for (var item in data['items']){
       try{
         books.add(BookModels.fromJson(item)) ;
       }catch(e){
         print(e.toString()) ;

       }
      }
      return right(books)  ;

    } catch (e ) {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e)) ;
      }
      return left(ServerFailure(e.toString())) ;


    }

  }

  @override
  Future<Either<Failure, List<BookModels>>> fetchSimilarBooks({
    required String category
  })async {
    try {
      var data= await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=subject:Programming&Sorting=relevance');
      List<BookModels>books=[] ;
      for (var item in data['items']){
        try{
          books.add(BookModels.fromJson(item)) ;
        }catch(e){
          print(e.toString()) ;

        }
      }
      return right(books)  ;

    } catch (e ) {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e)) ;
      }
      return left(ServerFailure(e.toString())) ;


    }
  }
}