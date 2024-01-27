import 'package:book/features/home/data/models/book_models/book_models.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksLoading extends SimilarBooksState {}
class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage ;

  SimilarBooksFailure(this.errMessage);
}
class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModels> books  ;

  SimilarBooksSuccess(this.books);


}