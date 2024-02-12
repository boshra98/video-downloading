import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class HomePageController extends GetxController {
  changePage(int currentpage);
}

class HomePageControllerImp extends HomePageController {
   int currentpage = 0;

  List<Widget> listPage = [
    
    
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile"))],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Favorite"))],
    )
  ];

  List  titlebottomappbar = [
    "home" , 
    "Profile" , 
  ] ; 

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}