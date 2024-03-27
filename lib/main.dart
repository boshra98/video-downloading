

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:video_downloading/core/localization/changelocal.dart';
import 'package:video_downloading/core/services/services.dart';
import 'package:get/get.dart';
import 'package:video_downloading/src/database/reel_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/constant/color.dart';
import 'core/localization/translatio.dart';
import 'router.dart';
AppOpenAd? _AppOpenAd;

Future<void> _loadAd() async {


  final String adUnitId = 'ca-app-pub-8943280289420872/3592040238';

  /*Platform.isAndroid
  // Use this ad unit on Android...
      ? 'ca-app-pub-8943280289420872/3592040238'
  // ... or this one on iOS.
      : 'ca-app-pub-3940256099942544/2934735716';*/
  print("heloo");
  AppOpenAd.load(
      adUnitId: 'ca-app-pub-8943280289420872/3592040238',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            print("lll");
            _AppOpenAd = ad;
            _AppOpenAd!.show();
          },
          onAdFailedToLoad: (LoadAdError error) {}),
      orientation: AppOpenAd.orientationPortrait);
}
Future<void>  main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initialservices();
  await MobileAds.instance.initialize();
  _loadAd();
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
     // home: NewHome(),

    );
     // routes: routes,
    
  }
  
}

 class Themes{
   static ThemeData customDarkTheme = ThemeData.dark().copyWith(
     visualDensity: VisualDensity.adaptivePlatformDensity,

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
     visualDensity: VisualDensity.adaptivePlatformDensity,

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

