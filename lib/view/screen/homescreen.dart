import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:video_downloading/controller/homescreen_controller.dart';
import 'package:video_downloading/core/constant/imageasset.dart';
import 'package:video_downloading/view/screen/language.dart';
import 'package:video_downloading/view/screen/onboarding.dart';

import '../../bannerads.dart';
import '../../core/constant/color.dart';
import '../../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp()) ;
    return  GetBuilder<HomeScreenControllerImp>(builder: (controller) =>Scaffold(


      appBar: AppBar(
// backgroundColor: AppColor.fourthColor,
      ),
      drawer:  Drawer(
          child: Container(
          padding: const EdgeInsets.all(15),

           // padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
              children:  [
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height:80 ,

                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          ImageAsset.logo ,
                          fit: BoxFit.cover ,
                        ),
                      )
                    ),
                    const Expanded(child:ListTile(
                      title: Text("infinity Search and download")
                    ))
                  ],
                ) ,
            ListTile(
              title: const Text("theme"),
              leading: const Icon(Icons.wb_sunny_outlined),
              onTap:(){
                if(Get.isDarkMode){
                   Get.changeTheme(Themes.customLightTheme);
                 } else{
                   Get.changeTheme(Themes.customDarkTheme);
                 }
              },
            ),
            ListTile(
              title: const Text("language"),
              leading: const Icon(Icons.language),
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Language()));
              },
            ),
            ListTile(
              title: const Text("About"),
              leading: const Icon(Icons.help_outline_outlined),
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OnBoarding()));


              },
            ),
            ListTile(
              title: const Text("contact us"),
              leading: const Icon(Icons.phone_android_outlined),
              onTap:(){},
            ),
          ])

        )
      ),

      bottomNavigationBar: Container(
      //  color: AppColor.fourthColor,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              //backgroundColor: AppColor.fourthColor,
              color: AppColor.primaryColor,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey,
              padding: const EdgeInsets.all(16),
              gap: 8,
              tabs: [
                GButton(
                  onPressed: () {
                    controller.changePage(0);
                  } ,
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                    onPressed: () {
                      controller.changePage(1);
                    } ,
                    icon: Icons.search,
                    text: 'search'
                ),
                GButton(
                    onPressed: () {
                      controller.changePage(2);

                    } ,
                    icon: Icons.download,
                    text: 'download'),
              ]),
        ),
      ),
      body: controller.listPage.elementAt(controller.currentpage),
    )
    );

  }
}

