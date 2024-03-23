import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(DownloadPage());
}

class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Facebook Video Downloader'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {

              _launchFacebookVideoUrl('https://www.facebook.com/facebook/videos/10153231379946729/?app=fbl');
            },
            child: Text('Download Video'),
          ),
        ),
      ),
    );
  }

  void _launchFacebookVideoUrl(String videoUrl) async {
    // ignore: deprecated_member_use
    if (await canLaunch(videoUrl)) {
      // ignore: deprecated_member_use
      await launch(videoUrl, forceSafariVC: false);
    } else {
      throw 'Could not launch $videoUrl';
    }
  }
  //videoUrl, forceSafariVC: false)
  //forceWebView: true, enableJavaScript: true, enableDomStorage: true,videoUrl, forceSafariVC: false


}














