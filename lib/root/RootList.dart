import 'package:flutter/material.dart';

import '../knowledge/Knowledge.dart';
import '../start_page/StartPage.dart';
import '../examples/ExampleList.dart';
import 'PluginList.dart';

class RootList extends StatelessWidget {
  RootList({Key key}) : super(key: key);

  void _pressBtn(int idx, BuildContext context, var pageTitle) {
    var pages = [
      new PluginList(title: pageTitle),
      new Knowledge(title: pageTitle),
      new StartPage(title: pageTitle),
      new ExampleList(title: pageTitle),
    ];

    if (pages[idx] != null) {
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return pages[idx];
      }));
    } else {
      //Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = "root";
    final List<String> items = [
      '插件',
      '小知识点',
      '启动图',
      'examples',
    ];

    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        //使用ListView.builder来构造列表项

        //list view
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
      ),
    );
  }
}
