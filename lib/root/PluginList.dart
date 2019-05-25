import 'package:flutter/material.dart';
import '../plugin/web/PWebView.dart';
import '../plugin/native/SystemShare.dart';
import '../plugin/sqlite/PSqlite.dart';
import 'package:stu_plugin/plugin/native/me_feedback.dart';
import 'package:stu_plugin/plugin/native/me_device_info.dart';

class PluginList extends StatefulWidget {
  final String title;

  PluginList({Key key, this.title}) : super(key: key);

  @override
  _PageState createState() => new _PageState();
}

void _pressBtn(int idx, BuildContext context, var pageTitle) {
  var pages = [
    new PWebView(title: pageTitle),
    new SystemShare(title: pageTitle),
    new PSqlite(title: pageTitle),
    new MeFeedback(title: pageTitle),
    new MeDeviceInfo(title: pageTitle),
  ];

  if (pages[idx] != null) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return pages[idx];
    }));
  }
}

class _PageState extends State<PluginList> {
  final List<String> items = [
    'WebView',
    '分享',
    'Sqlite',
    '用户反馈',
    '设备信息',
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
