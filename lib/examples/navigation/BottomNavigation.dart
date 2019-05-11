import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final callback;

  BottomNavigation(this.callback);

  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Bottom Nav'),
      ),
      body: Center(
        child: Text('test'),
        // child: CircularProgressIndicator(),
      ),
      bottomNavigationBar: _getBottom(),
    );
  }

  Widget _getBottom() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.language), title: Text("一页")),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_library), title: Text('二页')),
        BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('三页')),
      ],
      currentIndex: _index,
      onTap: (index) {
        setState(() {
          print("index:" + index.toString());
          _index = index;
          widget.callback(index);
        });
      },
    );
  }
}
