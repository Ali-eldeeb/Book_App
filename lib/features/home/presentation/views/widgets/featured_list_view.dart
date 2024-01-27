import 'package:book/core/utiles/app_router.dart';
import 'package:book/core/utiles/widget/custom_error_widget.dart';
import 'package:book/core/utiles/widget/custome_loading_indicator.dart';
import 'package:book/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:book/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBoxView extends StatelessWidget {
  const FeaturedBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder: (BuildContext context, FeaturedBooksState state) {
    if(state is FeaturedBooksSuccess){
      return SizedBox(
        height: MediaQuery.of(context).size.height*.3,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.books.length,
            scrollDirection: Axis.horizontal  ,
            itemBuilder: (context , index)=>Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0),
              child: GestureDetector(
                onTap: (){
                  GoRouter.of(context).push(
                    AppRouter.kBookDetailsView ,
                    extra: state.books[index]
                  ) ;
                },
                child: CustomBookImage(
                  imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                ),
              ),
            )),
      ) ;
    }else if (state is FeaturedBooksFailure){
      
      return CustomErrorWidget(errMessage: state.errMessage) ;
    }else {
      return const CustomLoadingIndicator() ;
    }

      },

    );
  }
}
