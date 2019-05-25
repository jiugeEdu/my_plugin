/**
 * demo: https://github.com/aliyun/alicloud-ios-demo/blob/274b4a69751314521ee8f1ed24e7022927a1971d/feedback_ios_demo/YWFeedbackDemo/YWLoginController.m#L60-L65
 * 
 * pod:
  source 'https://github.com/CocoaPods/Specs.git'
  source 'https://github.com/aliyun/aliyun-specs.git'
  
  pod 'AlicloudFeedback', '~> 3.2.0'
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


class MeFeedback extends StatefulWidget {
  final String title;

  MeFeedback({
    Key key,
    this.title
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State < MeFeedback > {
  final fFLUTTER_NATIVE_PLUGIN_CHANNEL_NAME = 'com.lijnshanmx/FlutterNativePlugin';

  MethodChannel flutterNativePlugin;
  String _version = '当前版本';


  void _rowBtn1() async {
    flutterNativePlugin.invokeMethod('openFeedbackActivity');
  }


  void _initVersion() {
    flutterNativePlugin =MethodChannel(fFLUTTER_NATIVE_PLUGIN_CHANNEL_NAME);
    flutterNativePlugin.invokeMethod('getversion').then((v) {
      setState(() {
        _version = v;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    final fSpace1 = 6.0;
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: < Widget > [
          _getDisplayText(_version),
          SizedBox(height: 30,),
          _getTextBtn('用户反馈', _rowBtn1),
          SizedBox(height: fSpace1,),
        ],
      ),
    );
  }


  Widget _getTextBtn(String btnText, Function funcBack) {
    Text text = Text(btnText,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );

    return GestureDetector(
      child: text,
      onTap: () {
        funcBack();
      },
    );
  }

  Widget _getDisplayText(String str) {
    return Text(str,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    _initVersion();
  }
}