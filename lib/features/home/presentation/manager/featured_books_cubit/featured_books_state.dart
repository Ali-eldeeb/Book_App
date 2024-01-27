import 'package:book/features/home/data/models/book_models/book_models.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}
class FeaturedBooksLoading extends FeaturedBooksState {}
class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage ;

  FeaturedBooksFailure(this.errMessage);
}
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModels> books  ;

  FeaturedBooksSuccess(this.books);


}