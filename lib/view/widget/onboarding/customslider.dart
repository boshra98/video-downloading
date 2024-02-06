import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';


class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val){
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
          children: [
            Text(onBoardingList[i].title!,
                style:  Theme.of(context).textTheme.headline1),
            const  SizedBox(height: 50),
            Image.asset(onBoardingList[i].image!,fit:BoxFit.fill,),
            const  SizedBox(height:80),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[i].body!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,

                )

            )
          ],
        ));
  }
}
