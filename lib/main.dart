import 'package:flutter/material.dart';
import 'package:video_downloading/core/localization/changelocal.dart';
import 'package:video_downloading/core/services/services.dart';
import 'package:video_downloading/view/screen/language.dart';
import 'package:video_downloading/view/screen/onboarding.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/constant/color.dart';
import 'core/localization/translatio.dart';
import 'router.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale:controller.language,
      theme: ThemeData(
        fontFamily: "playfairDisplay",
        textTheme: const TextTheme(
          headline1:  TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20,color:AppColor.black) ,
          bodyText1: TextStyle(
              height:2,color:AppColor.grey,fontWeight: FontWeight.bold,fontSize: 17),
          bodyText2: TextStyle(
              height:2,color:AppColor.grey,fontSize: 14),
        ),
      ),
     // home:const Language(),
      getPages: routes,
     // routes: routes,
    );
  }
}

