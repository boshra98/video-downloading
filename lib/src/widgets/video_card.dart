import 'package:flutter/material.dart';
import 'package:video_downloading/src/widgets/video_player.dart';

import '../database/reel_data.dart';


class VideoCard extends StatelessWidget {
  final ReelData reelData;
  const VideoCard({
    Key? key,
    required this.reelData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoPlayer(reelData.storagePath ?? ""),
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(reelData.imageLink ?? ""),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
