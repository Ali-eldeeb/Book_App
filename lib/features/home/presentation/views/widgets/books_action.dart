import 'package:book/core/utiles/widget/custom_button.dart';
import 'package:book/features/home/data/models/book_models/book_models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModels});
final BookModels bookModels ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 8.0),
      child: Row(
        children:[
          Expanded(
              child: CustomButton(
                onPressed: (){
                  print('dsds') ;
                } ,
                text: '19.99',
                backGroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
              )) ,
          Expanded(
              child: CustomButton(
                onPressed: () async {
                    Uri uri=Uri.parse(bookModels.volumeInfo.previewLink!) ;
                    if (await canLaunchUrl(uri)) {
                  await launchUrl(uri) ;
                      }

                },
                fontSize: 16.0,
                text: 'Free Preview',
                backGroundColor: Color(0xffEF8262),
                textColor:Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              )) ,

        ],
      ),
    );
  }
}