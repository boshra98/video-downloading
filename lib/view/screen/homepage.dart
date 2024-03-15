import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_downloading/controller/homepage_controller.dart';
import 'package:video_downloading/controller/homescreen_controller.dart';

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

class HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();
  FlutterInsta flutterInsta =FlutterInsta();
  bool downloading = false;
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("My title"),
      content: const Text("This is my message."),
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
    var myvideourl = await flutterInsta.downloadReels(myurl);

    await FlutterDownloader.enqueue(
      url: '$myvideourl',
      savedDir: '/sdcard/Download',
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification:
      true, // click on notification to open downloaded file (for Android)
    ).whenComplete(() {
      setState(() {
        downloading = false; // set to false to stop Progress indicator
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
                      closeSearchOnSuffixTap: false,
                      animationDurationInMilli: 2000,
                      rtl: true,
                      onSubmitted: (String) {},
                      //  onSubmitted: (String ) {  },
                    ),

                    ElevatedButton(
                        child: const Text('download'),
                        onPressed: () {
                          String myurl = textController.text;
                          if (myurl.contains("youtube")) {
                            showAlertDialog(context);
                            //print(myurl);
                            // ignore: unused_element
                          } else if (myurl.contains("instagram")) {
                            download(myurl);
                          }
                        }),
                    MyBannerAdWidget(),
                  ],

                ),
              ),



                );


  }
}
