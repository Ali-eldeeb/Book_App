
import 'package:book/core/utiles/style.dart';
import 'package:book/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:book/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:book/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start  ,
            children:[

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomAppBar(),
              )  ,
              FeaturedBoxView() ,
              SizedBox(
                height: 50.0,
              ) ,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Newest Books' ,
                  style:Style.textStyle18,
                ),
              ) ,
              SizedBox(
                height: 20.0,
              ),

            ],
          )
        ) ,
     SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: BestSellerListView(),
          ),
        )
      ],
    ) ;
  }
}










