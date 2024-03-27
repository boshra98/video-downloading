import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_downloading/view/screen/downloadpage.dart';
import 'package:video_downloading/view/screen/searchpage.dart';

import '../src/features/home/view/home.dart';
import '../view/screen/homepage.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int currentpage) ;

}

class HomeScreenControllerImp extends HomeScreenController{
  int currentpage=0 ;
  List<Widget> listPage =[
   const HomePage(),

    SearchPage(),
    DownloadPage(),
    //NewHome()





      ];


  @override
  changePage(int i) {
    currentpage=i;
    update();

  }


}