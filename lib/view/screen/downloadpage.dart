import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_downloading/controller/homepage_controller.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import '../../core/constant/color.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyDownloadPage(),
    );
  }
}

class MyDownloadPage extends StatefulWidget {
  const MyDownloadPage({Key? key}) : super(key: key);

  @override
  MyDownloadPageState createState() => MyDownloadPageState();
}

class MyDownloadPageState extends State<MyDownloadPage> {
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
      title: Text("My title"),
      content: Text("This is my message."),
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
    Get.put(HomePageControllerImp());

    return GetBuilder<HomePageControllerImp>(
        builder: ((controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.fourthColor,
                centerTitle: true,
                title: const Text('download page'),
              ),
              body: Container(
                color: AppColor.thirdColor,
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
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                color: AppColor.fourthColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  child: GNav(
                      backgroundColor: AppColor.fourthColor,
                      color: AppColor.primaryColor,
                      activeColor: Colors.white,
                      tabBackgroundColor: Colors.grey,
                      padding: EdgeInsets.all(16),
                      gap: 8,
                      tabs: [
                        GButton(
                          icon: Icons.home,
                          text: 'Home',
                        ),
                        GButton(icon: Icons.search, text: 'search'),
                        GButton(icon: Icons.download, text: 'download'),
                      ]),
                ),
              ),
            )));
  }
}
