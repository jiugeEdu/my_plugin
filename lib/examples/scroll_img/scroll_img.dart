import 'package:flutter/material.dart';
import 'pagination.dart';

class ScrollImg extends StatefulWidget {
  final String title;

  // 0.构造函数：接收参数
  ScrollImg({Key key, this.title}) : super(key: key);

  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State<ScrollImg> {
  // 1.初始化：只执行一次
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  //2.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  /**
   * 3.多次执行：每次 setState(() {}) 后都会执行
   */
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Demo'),
      ),
      body: Center(
        child: Pagination(),
      ),
    );
  }

  //4.
  // @override
  // void didUpdateWidget(NewsDetailPage oldWidget) {
  //   print('组件状态改变：didUpdateWidget');
  //   super.didUpdateWidget(oldWidget);
  // }

  //5.移除时
  @override
  void deactivate() {
    print('移除时：deactivate');
    super.deactivate();
  }

  //6.移除：只一次
  @override
  void dispose() {
    print('移除时：dispose');
    super.dispose();
  }
}
