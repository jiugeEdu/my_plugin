import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:share/share.dart';

class SystemShare extends StatefulWidget {
  final String title;

  SystemShare({
    Key key,
    this.title
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State < SystemShare > {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: < Widget > [
          GestureDetector(
            child: Text('分享文字'),
            onTap: () {
              shareText();
            },
          ),
          GestureDetector(
            child: Text('分享'),
            onTap: () {
              shareLink();
            },
          ),
        ],
      ),
    );
  }

  void shareLink() async {
    String title = '测试系统分享';
    String link = 'https://www.baidu.com/';
    await Share.share("$title:\n$link");
  }

  void shareText() async {
    await Share.share('这里是我分享的文字 哈哈');
  }
}