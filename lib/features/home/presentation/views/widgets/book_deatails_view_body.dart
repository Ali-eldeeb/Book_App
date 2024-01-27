
import 'package:book/features/home/data/models/book_models/book_models.dart';
import 'package:book/features/home/presentation/views/widgets/books_details_seaction.dart';

import 'package:book/features/home/presentation/views/widgets/custome_book_details_app_bar.dart';

import 'package:book/features/home/presentation/views/widgets/samiller__books_seaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModels});
final BookModels bookModels ;
  @override
  Widget build(BuildContext context) {

    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                CustomBookDetailsAppBar() ,
                BookDetailsSection(
                  bookModels: bookModels,
                ) ,
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                  ),
                ),
                SimilarBooksSection() ,
               SizedBox(
                  height: 40.0,
                )
              ],
            ),
          ) ,
        )
      ],
    ) ;

  }
}


