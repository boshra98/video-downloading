import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_reels_downloader/flutter_reels_downloader.dart';



class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyDownloadPage(),
    );
  }
}

class MyDownloadPage extends StatefulWidget {
  const MyDownloadPage({Key? key}) : super(key: key);

  @override
  _MyDownloadPageState createState() => _MyDownloadPageState();
}

class _MyDownloadPageState extends State<MyDownloadPage> {
  ReelDownloader reelDownloader = ReelDownloader(); // create instance of FlutterInsta class
  TextEditingController reelController = TextEditingController();

  ReelDownloader reelDownLoader = ReelDownloader();

  bool pressed = false;
  bool downloading = false;


  @override
  void initState() {
    super.initState();
    initializeDownloader();
    downloadReels();
  }

  void initializeDownloader() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterDownloader.initialize(debug: false // optional: set false to disable printing logs to console
    );
  }

  void downloadReels() async {
    var s = await reelDownloader.downloadReels("");//URL
    print(s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reels Downloader Example'),
      ),
      body: reelPage(),
    );
  }


//Reel Downloader page
  Widget reelPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          controller: reelController,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              downloading = true; //set to true to show Progress indicator
            });
            download();
          },
          child: Text("Download"),
        ),
        downloading
            ? Center(
          child: CircularProgressIndicator(), //if downloading is true show Progress Indicator
        )
            : Container()
      ],
    );
  }

//Download reel video on button clickl
  void download() async {
    var myvideourl = await reelDownloader.downloadReels(reelController.text);

    await FlutterDownloader.enqueue(
      url: '$myvideourl',
      savedDir: '/sdcard/Download',
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification: true, // click on notification to open downloaded file (for Android)
    ).whenComplete(() {
      setState(() {
        downloading = false; // set to false to stop Progress indicator
      });
    });
  }
}