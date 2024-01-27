import 'package:book/core/utiles/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key
    , required this.backGroundColor,
    required this.textColor,
     this.borderRadius,
    required this.text,
    this.fontSize,
    this.onPressed ,

  });

  final Color backGroundColor ;
  final Color textColor ;
  final BorderRadius? borderRadius ;
  final String text ;
  final double? fontSize ;
  final void  Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed ,
          style: TextButton.styleFrom(
            backgroundColor: backGroundColor,
              shape: RoundedRectangleBorder(

                  borderRadius:borderRadius ??BorderRadius.circular(
                    12.0
                  )
            )
          ),
          child: Text(
            text ,
            style: Style.textStyle18.copyWith(
              color: textColor ,
              fontWeight: FontWeight.bold ,
              fontSize: fontSize

            ),
          )

      ),
    );
  }
}
