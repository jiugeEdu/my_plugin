import 'package:flutter/material.dart';

import 'SkipPage.dart';

class StartPage extends StatefulWidget {
  final String title;

  StartPage({Key key, this.title}) : super(key: key);

  @override
  _PageState createState() => new _PageState();
}

void _pressBtn(int idx, BuildContext context, var pageTitle) {
  var pages = [
    new SkipPage(title: pageTitle),
    // new AnimationControllerPage(title: pageTitle),
  ];

  if (pages[idx] != null) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return pages[idx];
    }));
  }
}

class _PageState extends State<StartPage> {
  final List<String> items = [
    '跳过倒计时启动图',
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
        //列表长度
        itemCount: items.length,
        //列表项构造器
        itemBuilder: (context, index) {
          return new ListTile(
            leading: new IconButton(
              icon: Icon(
                Icons.settings_input_svideo,
                size: 28.0,
              ),
              tooltip: '按下操作',
              onPressed: () {
                _pressBtn(index, context, items[index]);
              },
            ),
            title: new Text('${items[index]}'),
          );
        },
      ),
    );
  }
}
