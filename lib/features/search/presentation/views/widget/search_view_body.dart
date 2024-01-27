import 'package:book/core/utiles/style.dart';
import 'package:book/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:book/features/search/presentation/views/widget/custom_search_text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal:30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
      SizedBox(
            height: 16.0,
          ) ,
          Text(
              'Search result' ,
            style: Style.textStyle18,
          ) ,
       SizedBox(
            height: 16.0,
          ) ,
          Expanded(child: SearchResultListView())
        ],

      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(


        padding: EdgeInsets.zero,
        itemBuilder: (context,item)=> Text('data'),
        separatorBuilder:(context,item) =>SizedBox(height: 20,),
        itemCount: 20

    ) ;
  }
}


// BestSellerListViewItem()