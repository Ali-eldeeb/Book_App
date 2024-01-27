import 'package:book/features/home/data/models/book_models/book_models.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}
class NewestBooksLoading extends NewestBooksState {}
class NewestBooksFailure extends NewestBooksState {
  final String errMessage ;

  NewestBooksFailure(this.errMessage);
}
class NewestBooksSuccess extends NewestBooksState {
  final List<BookModels> books  ;

  NewestBooksSuccess(this.books);


}