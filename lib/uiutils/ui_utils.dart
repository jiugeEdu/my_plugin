import 'package:flutter/material.dart';

class UIUtills {
  static final UIUtills _singleton = new UIUtills._internal();
  factory UIUtills() {
    return _singleton;
  }
  UIUtills._internal();



  static Widget getDisplayText(String str) {
    Text text = Text(str,
      style: TextStyle(
        fontSize: 20,
      ),
    );

    return text;
  }


  static Widget getTextBtn(String btnText, Function funcBack) {
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
}