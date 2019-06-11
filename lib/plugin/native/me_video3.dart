/**
 * 本地视频
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stu_plugin/uiutils/ui_utils.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class MeLocalVideo extends StatefulWidget {
  final String title;
  MeLocalVideo({
    Key key,
    this.title
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}



class _PageState extends State < MeLocalVideo > {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Butterfly Video'),
      ),
      
      body: Column(
        children: <Widget>[
          VideoContainer(),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

// 视频播放
class VideoContainer extends StatefulWidget {
  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State < VideoContainer > {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.asset('_image/test_video.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: false,
      //false有bug:结束->再播放 出现Bug
      looping: true,
      //一开始就显示
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }


  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}