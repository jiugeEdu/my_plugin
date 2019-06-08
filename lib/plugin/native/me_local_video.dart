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
  VideoPlayerController _controller;
  ChewieController chewieController;
  Chewie playerWidget;
  VideoPlayerValue _vpv;

  final _localVideo = '_image/test_video.mp4';
  bool _initialized = false;


  void _rowBtn1() async {
    chewieController.play();
  }

  void _rowBtn2() {
    chewieController.pause();
  }


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(this._localVideo);
    _vpv = _controller.value;
    
    print('local video');
    _controller.addListener(() {
      if (_controller.value.hasError) {
        print(_controller.value.errorDescription);
      }

      if (!mounted) {
        return;
      }
      if (_initialized != _controller.value.initialized) {
        _initialized = _controller.value.initialized;
        setState(() {});
      }
    });

    _controller.initialize();

    chewieController = ChewieController(
      videoPlayerController: _controller,
      // aspectRatio: 1,
      autoPlay: false,
      looping: false,
    );

    playerWidget = Chewie(
      controller: chewieController,
    );
  }


  @override
  Widget build(BuildContext context) {
    final fSpace1 = 6.0;
    Widget videoWidget = _controller.value.initialized ?
      AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      ) :
      Container(
        color: Colors.red,
        width: 200,
        height: 40,
      );

    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: < Widget > [
            // videoWidget,
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
    _controller.dispose();
    super.dispose();
  }
}