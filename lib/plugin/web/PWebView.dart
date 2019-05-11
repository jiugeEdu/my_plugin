import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PWebView extends StatefulWidget {
  final String title;

  PWebView({Key key, this.title}) : super(key: key);

  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State<PWebView> {
  final _flutterWebViewPlugin = new FlutterWebviewPlugin();
  bool _loading = true;
  final testURL = 'https://www.baidu.com/';

  @override
  void initState() {
    super.initState();

    // 监听WebView的加载事件
    _flutterWebViewPlugin.onStateChanged.listen((state) {
      // 加载完成
      if (state.type == WebViewState.finishLoad) {
        setState(() {
          _loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //loading
    List<Widget> titleContent = [];
    var barText = widget.title;

    titleContent.add(new Text(
      barText.toString(),
      style: new TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ));
    if (_loading) {
      titleContent.add(new CupertinoActivityIndicator());
    }
    titleContent.add(new Container(width: 50.0));

    return getWebview(titleContent);
  }

  Widget getWebview(titleContent) {
    Widget w = WebviewScaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.language),
              onPressed: () async {
                if (await canLaunch(testURL)) {
                  launch(testURL);
                }
              }),
        ],
      ),
      withLocalStorage: true,
      url: testURL,
      withJavascript: true,
    );

    return w;
  }
}
