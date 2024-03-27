import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
Future<void> openDownloadFolder() async {
  Directory? directory;
  if (Platform.isAndroid) {
    directory = await getExternalStorageDirectory();
  } else if (Platform.isIOS) {
    directory = await getApplicationDocumentsDirectory();
  }

  if (directory != null) {
    //String path =' /storage/emulated/0/Download/' ;
        //directory.path;
    //
    // OpenFile.open(path);
    OpenFile.open("/storage/emulated/0/DCIM");
  } else {
    // Handle directory not found error
  }
}
void main() {
  runApp(DownloadPage());
}

class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(' Downloader'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {

              openDownloadFolder();
             //penDownloadFolder( _launchFacebookVideoUrl('https://www.facebook.com/facebook/videos/10153231379946729/?app=fbl');
            },
            child: Text('Download Video'),
          ),
        ),
      ),
    );
  }



}














