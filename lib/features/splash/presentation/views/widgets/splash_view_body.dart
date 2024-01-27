
import 'package:book/core/constants/constants.dart';
import 'package:book/core/utiles/app_router.dart';
import 'package:book/core/utiles/assets.dart';
import 'package:book/features/home/presentation/views/home_view.dart';
import 'package:book/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}
class _SplashViewBodyState extends State<SplashViewBody>with
    SingleTickerProviderStateMixin {
  late AnimationController animationController ;
  late Animation<Offset> slidingAnimation ;
  @override
  void initState() {
    super.initState();
   initSlidingAnimation();

   navigateToHome() ;
   Future.delayed(
    const Duration(seconds: 2) ,(){
      GoRouter.of(context).push(AppRouter.kHome);
      // Get.to(()=>const HomView() ,
      //     transition: Transition.fade,
      //     duration:kTransitionDuration ) ;
   }

   ) ;

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Image.asset(AssetsData.logo ,) ,
        const SizedBox(
          height: 4,
        ) ,
        SlidingText(slidingAnimation: slidingAnimation,)


      ],
    ) ;
  }

  void initSlidingAnimation(){
    super.initState();
    animationController=AnimationController(
        vsync: this ,
        duration:const Duration(minutes: 1) ) ;

    slidingAnimation=Tween<Offset>(
        begin:const Offset(0,2)  ,
        end:Offset.zero
    ).animate(animationController) ;
    animationController.forward();
    slidingAnimation.addListener(() {

    }) ;
  }
  void navigateToHome(){
    Future.delayed(
        const Duration(seconds: 2) ,(){
      // Get.to(()=>const HomView() ,
      //     transition: Transition.fade,
      //     duration:kTransitionDuration ) ;
      GoRouter.of(context).push(AppRouter.kHome) ;
    }

    ) ;
  }

}
