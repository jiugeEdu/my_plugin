import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import './uuid.dart';

@JsonSerializable()
class Student {
  String id;
  //学号
  int number;
  //姓名
  String name;
  
  //levelWeight 对应的 json 字段 level_weight
  @JsonKey(name: 'level_weight')
  //体重等级 1-10
  int levelWeight;

  Student(
    this.name, {
      @required this.number,
      @required this.levelWeight,
      String id,
    }): this.id = id ?? Uuid().generateV4();


  //json 转换对象
  factory Student.fromJson(Map < String, dynamic > json) {
    return Student(
      json['name'] as String,
      number: json['number'] as int,
      levelWeight: json['level_weight'] as int,
      id: json['id'] as String,
    );
  }


  //对象转换 json
  Map < String, dynamic > toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'number': this.number,
      'level_weight': this.levelWeight
    };
  }
}