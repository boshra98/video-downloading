import 'package:flutter/material.dart';
import 'package:video_downloading/core/constant/color.dart';
import 'package:video_downloading/view/widget/language/custombuttomlang.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding:const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Text("1".tr , style: Theme.of(context).textTheme.headline1),
              const SizedBox(height: 20) ,
              CustomButtonLang(textbutton: "Ar" ,onPressed: (){
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onBoarding) ;
              }) ,
              CustomButtonLang(textbutton: "En" ,onPressed: (){
                controller.changeLang("en");
                Get.toNamed(AppRoute.onBoarding);


              }) ,


            ],
          )),
    );
  }
}



