import 'package:flutter/material.dart';

class LoadingTest extends StatefulWidget {
  final title;

  LoadingTest({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<LoadingTest> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          new GestureDetector(
            child: Container(
              child: Text(
                "清除",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              padding: EdgeInsets.only(
                top: 10,
                left: 5,
              ),
            ),
            onTap: () {
              setState(() {
                _index = 0;
              });
            },
          ),
          new GestureDetector(
            child: Container(
              child: Text(
                "展示1",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              padding: EdgeInsets.only(
                top: 10,
                left: 65,
              ),
            ),
            onTap: () {
              setState(() {
                _index = 1;
              });
            },
          ),
          Center(
            child: _getLoading(),
          )
        ],
        // child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _getLoading() {
    if (_index == 1) {
      return CircularProgressIndicator();
    }
  }
}
