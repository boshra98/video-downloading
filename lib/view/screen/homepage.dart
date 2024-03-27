// ignore_for_file: prefer_const_constructors

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_downloading/controller/homepage_controller.dart';
import 'package:video_downloading/controller/homescreen_controller.dart';

import '../../ads.dart';
import '../../src/features/downloaded_reels/cubit/download_cubit.dart';
import '/../../src/features/home/cubit/home_cubit.dart';
import '../../bannerads.dart';
import '../../core/constant/color.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  FlutterInsta flutterInstagram = FlutterInsta();
  TextEditingController usernameController = TextEditingController();
  TextEditingController reelController = TextEditingController();
  TabController? tabController;

  String? username, followers = " ", following, bio, website, profileimage;
  bool pressed = false;
  bool downloading = false;
   //DownloadCubit() {
  //   // TODO: implement DownloadCubit
   //  throw UnimplementedError();
  // }
 // final homeCubit = new HomeCubit();
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, initialIndex: 1, length: 2);
  }
  TextEditingController textController = TextEditingController();

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("4".tr),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title:  Text("3".tr),
      content:  Text("5".tr),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void download(String myurl) async {

    await Permission.manageExternalStorage.request();
    await Permission.storage.request();
    var myVideoUrl = await flutterInstagram.downloadReels(reelController.text);
    final Dio dio = Dio();

    await dio
        .download(myVideoUrl, '/storage/emulated/0/Download/boshra.mp4')
        .then((value) {
      setState(() {
        downloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return  Scaffold(

              body: Container(
               // color: AppColor.thirdColor,
                //
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    AnimSearchBar(
                      width: 400,
                      textController: textController,
                      onSuffixTap: () {
                        setState(() {
                          textController.clear();
                        });
                      },
                      color: AppColor.primaryColor,
                      helpText: "download ...",
                      autoFocus: true,
                      closeSearchOnSuffixTap: true,
                      animationDurationInMilli: 2000,
                      rtl: true,
                      onSubmitted: (String) {},
                      //  onSubmitted: (String ) {  },
                    ),

                    ElevatedButton(
                        child:  Text('12'.tr),
                        onPressed: () {
                          ads ad = new ads();
                          ad.showAd();
                          String myurl = textController.text;
                          if (myurl.contains("youtube.com")) {
                            showAlertDialog(context);
                            //print(myurl);
                            // ignore: unused_element
                          } else if (myurl.contains("instagram.com")) {


                            final homecubit=new HomeCubit();
                            homecubit.downloadReal
                              (
                              myurl,
                              context,
                            );


                            //download(myurl);
                          }
                          else if (myurl.contains("facebook.com"))
                            {




                              _launchFacebookVideoUrl(myurl);

                            }



                        }),
                    !downloading
                        ? const Center(
                      child:
                      CircularProgressIndicator(), //if downloading is true show Progress Indicator
                    )
                        : Container(),
                    MyBannerAdWidget(),
                  ],

                ),
              ),



                );


  }


  void _launchFacebookVideoUrl(String videoUrl) async {
    // ignore: deprecated_member_use
    if (await canLaunch(videoUrl)) {
      // ignore: deprecated_member_use
     // await launch(videoUrl,
       //   forceWebView: true, enableJavaScript: true, enableDomStorage: true,forceSafariVC: false);
      // ignore: deprecated_member_use
      await launch(videoUrl, forceSafariVC: false);
    } else {
      throw 'Could not launch $videoUrl';
    }
  }

//  enableJavaScript: true, enableDomStorage: true,videoUrl, forceSafariVC: false
}
