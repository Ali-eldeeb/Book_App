import 'package:book/core/constants/constants.dart';
import 'package:book/core/utiles/app_router.dart';
import 'package:book/core/utiles/style.dart';
import 'package:book/features/home/data/models/book_models/book_models.dart';
import 'package:book/features/home/presentation/views/widgets/book_rating.dart';
import 'package:book/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModels});

final BookModels bookModels ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(
            AppRouter.kBookDetailsView ,
            extra: bookModels);

      },
      child: SizedBox(
        height: 120.0,
        child: Row(
          children: [

            CustomBookImage(
                imageUrl:bookModels.volumeInfo.imageLinks?.thumbnail??''
            ) ,
            const SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child: Text(
                    bookModels.volumeInfo.title! ,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyle20.copyWith(
                          fontFamily: kGtSectraFine
                      ),
                    ),
                  ) ,
                  const SizedBox(
                    height: 3.0,
                  ) ,

                    Expanded(
                      child: Text(
                      bookModels.volumeInfo.authors![0],
                      style: Style.textStyle14,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                                        ),
                    ) ,
                  const SizedBox(
                    height: 3.0,
                  ) ,

                  Row(
                    children: [
                      Text(
                        'Free' ,
                        style: Style.textStyle20.copyWith(
                            fontWeight: FontWeight.bold
                        ),

                      ) ,
                      Spacer(),
                      BookRating(
                        count: bookModels.volumeInfo.pageCount??0,
                        rating: bookModels.volumeInfo.pageCount??0,
                      )

                    ],
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
