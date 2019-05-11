import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:share/share.dart';

class SystemShare extends StatefulWidget {
  final String title;

  SystemShare({Key key, this.title}) : super(key: key);

  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State<SystemShare> {
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
      body: Center(
        child: new GestureDetector(
          child: Icon(
            Icons.share,
            color: Colors.black,
          ),
          onTap: () {
            shareNotice('测试系统分享', 'https://www.baidu.com/');
          },
        ),
      ),
    );
  }

  Future shareNotice(_title, _link) async {
    await Share.share("$_title:\n$_link");
  }
}
