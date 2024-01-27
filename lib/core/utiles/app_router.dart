import 'package:book/core/utiles/service_locator.dart';
import 'package:book/features/home/data/models/book_models/book_models.dart';
import 'package:book/features/home/data/repos/home_repo_impl.dart';
import 'package:book/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:book/features/home/presentation/views/book_details_view.dart';
import 'package:book/features/home/presentation/views/home_view.dart';
import 'package:book/features/search/presentation/views/search_views.dart';
import 'package:book/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{
static const kHome='/home';
static const kBookDetailsView='/bookDetailsView';
static const kSearchView='/searchView';
 static final router=GoRouter(
    routes: [
      GoRoute(
          path: '/' ,
          builder: (context, state)=>const SplashView()
      ),
      GoRoute(
          path: kHome ,
          builder: (context, state)=>const HomView()
      ),
      GoRoute(
          path: kBookDetailsView ,
          builder: (context, state)=>BlocProvider(
              create: ( context) {
                return SimilarBooksCubit(getIt.get<HomeRepoImpl>()) ;
              },
              child:  BookDetailsView(
                bookModels: state.extra as BookModels,
              ))
      ),
      GoRoute(
          path: kSearchView ,
          builder: (context, state)=>const SearchView()
      ),
    ],
  ) ;

}