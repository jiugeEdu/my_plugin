import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stu_plugin/uiutils/ui_utils.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';


class MeVideo2 extends StatefulWidget {
  final String title;
  MeVideo2({
    Key key,
    this.title
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}


class _PageState extends State < MeVideo2 > {
  // final url1 = 'http://img.ksbbs.com/asset/Mon_1703/05cacb4e02f9d9e.mp4';
  final url2 = '_image/test_video.mp4';
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  Chewie playerWidget;


  void _rowBtn1() async {
    chewieController.play();
    setState(() {});
  }

  void _rowBtn2() {
    chewieController.pause();
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    // videoPlayerController = VideoPlayerController.network(url2);
    videoPlayerController = VideoPlayerController.asset(url2);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: false,
      showControls: true,
      // 占位图
      placeholder: new Container(
        color: Colors.grey,
      ),
      // 是否在 UI 构建的时候就加载视频
      autoInitialize: true,
      // startAt: Duration(microseconds: 1000),

      //改变控制栏只有 LIVE
      // isLive: true,

      // 拖动条样式颜色
      materialProgressColors: new ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
    );

    playerWidget = Chewie(
      controller: chewieController,
    );
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final fSpace1 = 6.0;

    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: < Widget > [
            playerWidget,
            UIUtills.getDisplayText(''),
            SizedBox(height: 30, ),
            UIUtills.getTextBtn('播放', _rowBtn1),
            SizedBox(height: fSpace1, ),
            UIUtills.getTextBtn('暂停', _rowBtn2),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}