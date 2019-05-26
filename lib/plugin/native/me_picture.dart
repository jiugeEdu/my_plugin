import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stu_plugin/melibs/lib_me_picture.dart';
import 'package:stu_plugin/uiutils/ui_utils.dart';
// import 'package:image_picker/image_picker.dart';


class MePicture extends StatefulWidget {
  final String title;
  MePicture({
    Key key,
    this.title
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State < MePicture > {
  String _imgPath = '图片路径1';

  void _pictureBack(String imgPath) {
    _imgPath = imgPath == null ? '取消上传' : imgPath;
    setState(() {});
  }

  void _rowBtn1() async {
    SelectNativeImg.displayMenuItem(context, _pictureBack);
  }


  @override
  Widget build(BuildContext context) {
    final fSpace1 = 6.0;
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: < Widget > [
            UIUtills.getDisplayText(_imgPath),
            SizedBox(height: 30, ),
            UIUtills.getTextBtn('点击上传图片', _rowBtn1),
            SizedBox(height: fSpace1, ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}


class SelectNativeImg {
  static void displayMenuItem(BuildContext pContext, Function funcBack) {
    showModalBottomSheet < void > (context: pContext, builder: (BuildContext context) {
      return bottomSheetBuilder(context, (String imgPath) {
        funcBack(imgPath);
      });
    });
  }

  static Widget bottomSheetBuilder(BuildContext context, Function funcBack) {
    return new Container(
      height: 182.0,
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
          child: new Column(
            children: < Widget > [
              _renderBottomMenuItem("相机拍照", ImageSource.camera, context, funcBack),
              new Divider(height: 2.0, ),
              _renderBottomMenuItem("图库选择照片", ImageSource.gallery, context, funcBack)
            ],
          ),
      )
    );
  }

  static _renderBottomMenuItem(title, ImageSource source, BuildContext context, Function funcBack) {
    var item = new Container(
      height: 60.0,
      child: new Center(
        child: new Text(title)
      ),
    );
    return new InkWell(
      child: item,
      onTap: () {
        Navigator.of(context).pop();
        ImagePicker.pickImage(source: source, funcBack: (imgPath) {
          funcBack(imgPath);
        });
      },
    );
  }
}