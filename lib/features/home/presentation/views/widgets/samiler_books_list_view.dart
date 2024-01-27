

import 'package:book/core/utiles/widget/custom_error_widget.dart';
import 'package:book/core/utiles/widget/custome_loading_indicator.dart';
import 'package:book/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:book/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:book/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*.15,
      child: BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
        builder: (BuildContext context, SimilarBooksState state) {
        if(state is SimilarBooksSuccess){
          return ListView.builder(
            itemCount: state.books.length,
              scrollDirection: Axis.horizontal  ,
              itemBuilder: (context , index)=> Padding(
                padding:  const EdgeInsets.symmetric(
                    horizontal: 8.0),
                child: CustomBookImage(
                  imageUrl:
                    state.books[index].volumeInfo.imageLinks?.thumbnail??
                        'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',

                ),
              )) ;
        }else if (state is SimilarBooksFailure){

          return CustomErrorWidget(errMessage: state.errMessage) ;
        }else{

          return const CustomLoadingIndicator() ;
        }


        },

      ),
    );
  }
}