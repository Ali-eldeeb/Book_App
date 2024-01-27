import 'package:book/core/utiles/style.dart';
import 'package:book/features/home/data/models/book_models/book_models.dart';
import 'package:book/features/home/presentation/views/widgets/book_rating.dart';
import 'package:book/features/home/presentation/views/widgets/books_action.dart';
import 'package:book/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class  BookDetailsSection extends StatelessWidget {
  const  BookDetailsSection({super.key, required this.bookModels});
final BookModels bookModels ;

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width ;
    return Column(
      children: [

        Padding(
          padding:  EdgeInsets.symmetric(horizontal:width *.2),
          child: CustomBookImage(
            imageUrl:
              bookModels.volumeInfo.imageLinks?.thumbnail ??
             'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',
          ),


        ) ,
        const SizedBox(
          height: 43.0,
        ),
        Text(
          bookModels.volumeInfo.title ??'' ,
          style: Style.textStyle30.copyWith(
              fontWeight: FontWeight.bold ,

          ),
          maxLines: 1,
        ) ,
        const SizedBox(
          height: 6.0,
        ),
        Opacity(
          opacity: .7,
          child: Text(
           bookModels.volumeInfo.authors![0] ,
            style: Style.textStyle18.copyWith(
              fontStyle: FontStyle.italic ,
              fontWeight: FontWeight.w500,
            ),

          ),
        ) ,
        const SizedBox(
          height: 18.0,
        ) ,
           BookRating(
          rating: bookModels.volumeInfo.pageCount??0,
          count: bookModels.volumeInfo.pageCount??0,

          mainAxisAlignment: MainAxisAlignment.center,
        ) ,
        const SizedBox(
          height: 37.0,
        ) ,
          BooksAction(
          bookModels: bookModels,
        ) ,

      ],
    );
  }
}
