import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

import 'uuid.dart';

@JsonSerializable()
class Course {
  //课程id
  final String id;
  //学生id
  @JsonKey(name: 'student_id')
  final String studentId;
  //年级(初一、初二、) 1~10
  final int gradle;
  //是否完成(0未完成、1完成)
  @JsonKey(name: 'completed')
  final int isCompleted;


  Course(this.gradle, {
    @required this.studentId,
    this.isCompleted = 0,
    String id
  }): this.id = id ?? Uuid().generateV4();


  //对象转换 json
  factory Course.fromJson(Map < String, dynamic > json) {
    return Course(
      json['gradle'] as int,
      studentId: json['student_id'] as String,
      isCompleted: json['completed'] as int,
      id: json['id'] as String
    );
  }


  //json 转换对象
  Map < String, dynamic > toJson() {
    return {
      'id': this.id,
      'student_id': this.studentId,
      'gradle': this.gradle,
      'completed': this.isCompleted
    };
  }
}