/**
 * 只有 VideoPlayerController
 * 
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stu_plugin/uiutils/ui_utils.dart';
import 'package:video_player/video_player.dart';


class MeVideo extends StatefulWidget {
  final String title;
  MeVideo({
    Key key,
    this.title
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State < MeVideo > {
  VideoPlayerController _controller;
  // final video_url1 = 'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4';
  final video_url2 = 'http://img.ksbbs.com/asset/Mon_1703/05cacb4e02f9d9e.mp4';
  final _localVideo = '_image/test_video.mp4';
  String _playPosition = '';
  String _valStr = '';

  void _rowBtn1() async {
    _controller.play();
  }

  void _rowBtn2() async {
    _controller.pause();
  }

  void _rowBtn3() async {
    _controller.seekTo(Duration(seconds: 2));
  }

  void _rowBtn4() async {
    _controller.setVolume(4.0);
  }

  void _rowBtn5() async {
    _valStr = _controller.value.toString();
    setState(() {});
  }

  void _listenerFunc() {
    if (_controller.value.hasError) {
      print(_controller.value.errorDescription);
    }
    //播放中
    if (_controller.value.isPlaying) {}

    _playPosition = _controller.value.position.toString();
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(video_url2);
    //本地视频
    // _controller = VideoPlayerController.asset(_localVideo);
    //添加监听
    _controller.addListener(_listenerFunc);
    //初始化玩更新界面
    _controller.initialize().then((_) {
      setState(() {});
    });
    //设置是否循环播放
    _controller.setLooping(false);
    _valStr = _controller.value.toString();
  }


  Widget _getVideo() {
    if (!_controller.value.initialized) {
      return Container(
        color: Colors.red,
        width: 200,
        height: 40,
      );
    }

    //video controller 缩放比
    Widget video = AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );

    return video;
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
            _getVideo(),
            UIUtills.getDisplayText(_playPosition),
            UIUtills.getDisplayText(_valStr),
            SizedBox(height: 30, ),
            UIUtills.getTextBtn('播放', _rowBtn1),
            UIUtills.getTextBtn('暂停', _rowBtn2),
            UIUtills.getTextBtn('跳到2秒出', _rowBtn3),
            UIUtills.getTextBtn('设置音量4', _rowBtn4),
            UIUtills.getTextBtn('更新Val', _rowBtn5),
            SizedBox(height: fSpace1, ),
            VideoProgressIndicator(_controller, allowScrubbing: true, ),
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