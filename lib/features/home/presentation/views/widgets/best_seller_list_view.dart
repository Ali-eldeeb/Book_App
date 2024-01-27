import 'package:book/core/utiles/widget/custom_error_widget.dart';
import 'package:book/core/utiles/widget/custome_loading_indicator.dart';
import 'package:book/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book/features/home/presentation/manager/newset_books_cubit/cubit/newset_books_cubit.dart';
import 'package:book/features/home/presentation/manager/newset_books_cubit/cubit/newset_books_state.dart';
import 'package:book/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (BuildContext context, state) {
        if(state is NewestBooksSuccess ){
          return ListView.separated(

              physics: const NeverScrollableScrollPhysics() ,
              padding: EdgeInsets.zero,
              itemBuilder: (context,item)=> BestSellerListViewItem(
                bookModels: state.books[item],
              ),
              separatorBuilder:(context,item) =>const SizedBox(height: 20,),
              itemCount: state.books.length

          );
        }else if(state is NewestBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage) ;

        }else{

          return const CustomLoadingIndicator() ;
        }

      },

    ) ;
  }
}