import 'package:get/get.dart';
import 'package:video_downloading/core/constant/routes.dart';
import 'package:video_downloading/core/middleware/mymiddleware.dart';
import 'package:video_downloading/view/screen/searchpage.dart';
import 'package:video_downloading/view/screen/homepage.dart';
import 'package:video_downloading/view/screen/homescreen.dart';
import 'package:video_downloading/view/screen/language.dart';
import 'package:video_downloading/view/screen/onboarding.dart';

List<GetPage<dynamic>>? routes= [
     GetPage(name:"/", page: ()=> const Language() , middlewares:[
      MyMiddleWare()
     ] ) ,

  GetPage(name:AppRoute.homePage, page: ()=> const HomeScreen()) ,
  GetPage(name:AppRoute.searchPage, page: ()=> const SearchPage()) ,

  // GetPage(name: AppRoute.browserPage, page: ()=> const BrowserPage()) ,
  GetPage(name: AppRoute.onBoarding, page: ()=> const OnBoarding()) ,


] ; 

