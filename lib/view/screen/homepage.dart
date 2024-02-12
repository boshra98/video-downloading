import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_downloading/controller/homepage_controller.dart';

import '../../core/constant/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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
    Get.put(HomePageControllerImp());

    return GetBuilder<HomePageControllerImp>(
        builder: ((controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.fourthColor,
                centerTitle: true,
                title: const Text('home page'),
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
                      helpText: "Search Text...",
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
