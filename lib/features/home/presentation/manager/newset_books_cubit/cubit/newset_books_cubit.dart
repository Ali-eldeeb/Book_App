import 'package:bloc/bloc.dart';
import 'package:book/features/home/data/repos/home_repo.dart';
import 'package:book/features/home/presentation/manager/newset_books_cubit/cubit/newset_books_state.dart';


class NewestBooksCubit extends Cubit<NewestBooksState>{
  NewestBooksCubit(this.homeRepo):super(NewestBooksInitial()) ;

  final HomeRepo homeRepo ;
  Future<void>fetchNewestBooks()async{

    emit(NewestBooksLoading()) ;
    var result =await  homeRepo.fetchNewestBooks() ;
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage)) ;
    }, (books) {
      emit(NewestBooksSuccess(books)) ;

    }) ;
  }


}