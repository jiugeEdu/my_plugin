/**
 * path_provider: ^0.5.0+1
 * sqflite: ^1.1.0
 * json_annotation: ^2.0.0
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './sqlite_mgr.dart';

class PSqlite extends StatefulWidget {
  final String title;

  PSqlite({
    Key key,
    this.title
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State < PSqlite > {
  String _result = '';

  void _updateResult() {
    setState(() {});
  }

  void _btn1() {
    SqliteMgr.instance.insertAllTest();
  }

  void _btn2() async {
    int aa = await SqliteMgr.instance.insertOneTest();
    _result = aa.toString();
    _updateResult();
  }

  void _btn3() async {
    _result = await SqliteMgr.instance.deleteOneStu();
    _updateResult();
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List < Widget > titleContent = [];
    return getWebview(titleContent);
  }

  Widget getWebview(titleContent) {
    Widget w = Scaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        actions: < Widget > [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        children: < Widget > [
          _textBtn('创建数据库', _btn1),
          SizedBox(height: 5, ),
          _textBtn('插入数据', _btn2),
          SizedBox(height: 5, ),
          _textBtn('双向删除', _btn3),
          SizedBox(height: 10, ),
          Text(_result,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );

    return w;
  }

  Widget _textBtn(String text, Function backFunc) {
    InkWell inkWell = InkWell(
      child: new Text(text,
        style: new TextStyle(color: Colors.black, fontSize: 16.0),
      ),
      onTap: backFunc,
    );

    return Center(
      child: inkWell,
    );
  }
}