import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_downloading/view/screen/searchpage.dart';

import '../view/screen/homepage.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int currentpage) ;

}

class HomeScreenControllerImp extends HomeScreenController{
  int currentpage=0 ;
  List<Widget> listPage =[
   const HomePage(),

    SearchPage(),

    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center( child: Text("setting"))
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center( child: Text("profile"))
      ],
    ) ,


      ];


  @override
  changePage(int i) {
    currentpage=i;
    update();

  }


}