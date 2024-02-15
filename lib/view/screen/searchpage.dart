import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_downloading/controller/homepage_controller.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import '../../core/constant/color.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MySearchPage(),
    );
  }
}

class MySearchPage extends StatefulWidget {
  const MySearchPage({Key? key}) : super(key: key);

  @override
  MySearchPageState createState() => MySearchPageState();
}

class MySearchPageState extends State<MySearchPage> {
  TextEditingController textController = TextEditingController();
  void _search(String query) async {
    final url = 'https://www.google.com/search?q=$query';

    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url,
          forceWebView: true, enableJavaScript: true, enableDomStorage: true);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {


    return  Scaffold(

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
                      helpText: "search  ...",
                      autoFocus: true,
                      closeSearchOnSuffixTap: true,
                      animationDurationInMilli: 2000,
                      rtl: true,
                      onSubmitted: (String) {},
                      //  onSubmitted: (String ) {  },
                    ),
                    ElevatedButton(
                      child: const Text('Search'),
                      onPressed: () {
                        String query = textController.text;

                        _search(query);
                      },
                    ),
                  ],
                ),
              ),

            );
  }
}
