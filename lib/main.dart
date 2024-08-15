import 'package:book/core/utiles/api_service.dart';
import 'package:book/core/utiles/app_router.dart';
import 'package:book/core/utiles/service_locator.dart';
import 'package:book/features/home/data/repos/home_repo_impl.dart';
import 'package:book/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book/features/home/presentation/manager/newset_books_cubit/cubit/newset_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/constants.dart';



void main() {
  setUpServiceLocator() ;
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context)=>FeaturedBooksCubit(
       getIt.get<HomeRepoImpl>()
        )..fetchFeaturedBooks()
        ) ,
        BlocProvider(
        create: (context)=>NewestBooksCubit(
            getIt.get<HomeRepoImpl>() ,
        ) ..fetchNewestBooks(),
        ) ,
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor ,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme
          ) ,
        ),
        routerConfig: AppRouter.router,
      
      
      ),
    );
  }
}


