import 'package:bloc/bloc.dart';
import 'package:book/features/home/data/repos/home_repo.dart';
import 'package:book/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState>{
  SimilarBooksCubit(this.homeRepo):super(SimilarBooksInitial()) ;

  final HomeRepo homeRepo ;
  Future<void>fetchSimilarNewestBooks({
    required String category
})async{

    emit(SimilarBooksLoading()) ;
    var result =await  homeRepo.fetchSimilarBooks(category: category) ;
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errMessage)) ;
    }, (books) {
      emit(SimilarBooksSuccess(books)) ;

    }) ;
  }


}