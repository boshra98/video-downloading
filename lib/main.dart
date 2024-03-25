import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:video_downloading/core/localization/changelocal.dart';
import 'package:video_downloading/core/services/services.dart';
import 'package:get/get.dart';
import 'package:video_downloading/src/database/reel_data.dart';
import 'package:video_downloading/test.dart';
import 'package:video_downloading/view/screen/searchpage.dart';
import 'package:video_downloading/view/screen/homepage.dart';
import 'controller/homepage_controller.dart';

import 'core/constant/color.dart';
import 'core/localization/translatio.dart';
import 'router.dart';

void main() async {

  //WidgetsFlutterBinding.ensureInitialized();
  //await initialservices();
  await Hive.initFlutter();
  Hive.registerAdapter(ReelDataAdapter());
  await Hive.openBox<ReelData>('reel');
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

      theme: Themes.customDarkTheme,







     // home:const Language(),
      getPages: routes,
      //home: DownloadPage(),

    );
     // routes: routes,
    
  }
  
}

 class Themes{
   static ThemeData customDarkTheme = ThemeData.dark().copyWith(
     textTheme: const TextTheme(
       headline1:  TextStyle(
         fontWeight: FontWeight.bold, fontSize: 20,color:AppColor.primaryColor,fontFamily: "playfairDisplay",
       ) ,
       bodyText1: TextStyle(
         height:2,color:AppColor.grey,fontWeight: FontWeight.bold,fontSize: 17 , fontFamily: "playfairDisplay",
       ),
       bodyText2: TextStyle(
         height:2,color:AppColor.grey,fontSize: 14 ,fontFamily: "playfairDisplay",
       ),
     ),

    // appBarTheme: AppBarTheme(color: AppColor.fourthColor),
     //scaffoldBackgroundColor: AppColor.thirdColor,
    // bottomAppBarTheme:  BottomAppBarTheme(color: AppColor.fourthColor),
     //primarySwatch: Colors.pink,
       //bottomNavigationBar :  AppColor.fourthColor,
      // GNav
   );
   static ThemeData customLightTheme = ThemeData.light().copyWith(
     textTheme: const TextTheme(
       headline1:  TextStyle(
         fontWeight: FontWeight.bold, fontSize: 20,color:AppColor.black,fontFamily: "playfairDisplay",
       ) ,
       bodyText1: TextStyle(
         height:2,color:AppColor.grey,fontWeight: FontWeight.bold,fontSize: 17 , fontFamily: "playfairDisplay",
       ),
       bodyText2: TextStyle(
         height:2,color:AppColor.grey,fontSize: 14 ,fontFamily: "playfairDisplay",
       ),
     ),

     appBarTheme: AppBarTheme(color:Colors.white),
     //scaffoldBackgroundColor: ScaffoldBackgroundColorTheme(),
     bottomAppBarTheme:  BottomAppBarTheme(color:Colors.white),
       //bottomNavigationBar:

   );

 }

