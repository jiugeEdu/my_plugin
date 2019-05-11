import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'
as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import './student_model.dart';
import './course_model.dart';

const kDatabaseName = 'Todo.db';
const kTableName1 = 'student';
const kTableName2 = 'course';

class DBProvider {
  static Database _database;

  DBProvider._();
  static final DBProvider db = DBProvider._();

  Future < Database > get database async {
    if (_database != null) return _database;

    _database = await _initDB();
    return _database;
  }

  get _dbPath async {
    String documentsDirectory = await _localPath;
    return p.join(documentsDirectory, kDatabaseName);
  }

  Future < bool > dbExists() async {
    return File(await _dbPath).exists();
  }

  /**
   * 不能为 NULL 默认 0: NOT NULL DEFAULT 0
   * 主键：PRIMARY KEY, 一个表只能有一个并且唯一
   * 自增长：INTEGER PRIMARY KEY AUTOINCREMENT,
   * */
  _initDB() async {
    String path = await _dbPath;
    print('数据库路径:' + path);
    return await openDatabase(path, version: 1, onOpen: (db) {
      print("打开数据库");
    }, onCreate: (Database db, int version) async {
      print("创建表");
      await db.execute("CREATE TABLE student ("
        "auto_id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "id TEXT NOT NULL UNIQUE,"
        "name TEXT,"
        "number INTEGER NOT NULL UNIQUE,"
        "level_weight INTEGER"
        ")");
      await db.execute("CREATE TABLE course ("
        "id TEXT PRIMARY KEY,"
        "gradle INTEGER,"
        "student_id TEXT NOT NULL UNIQUE,"
        "completed INTEGER NOT NULL DEFAULT 0"
        ")");
    });
  }


  /** 插入
   * toJson:
   * json key：sqlite的字段名
   * json val：插入 sqlite 字段名对应的值
   */
  insertAllStudent(List < Student > tasks) async {
    final db = await database;
    tasks.forEach((it) async {
      var res = await db.insert(kTableName1, it.toJson());
      print("Task ${it.id} = $res");
    });
  }

  Future < int > insertStudent(Student task) async {
    final db = await database;
    return db.insert(kTableName1, task.toJson());
  }

  //
  Future < int > insertCourse(Course todo) async {
    final db = await database;
    return db.insert(kTableName2, todo.toJson());
  }


  /** 删除
   * 单条件删除、多条件删除、两个表都删除成功才算删除
   */
  Future < int > removeStudent(Student task) async {
    final db = await database;
    return db.delete(kTableName1, where: 'id = ?', whereArgs: [task.id]);
  }

  Future < int > removeWhereStudent(Student task) async {
    final db = await database;
    return db.delete(kTableName1, where: 'name = ? and level_weight = ?', whereArgs: [task.name, task.levelWeight]);
  }

  Future < void > removeStudentTwo(Student task) async {
    final db = await database;
    return db.transaction < void > ((txn) async {
      await txn.delete(kTableName2, where: 'student_id = ?', whereArgs: [task.id]);
      await txn.delete(kTableName1, where: 'id = ?', whereArgs: [task.id]);
    });
  }


  /**改
   * 
   */
  Future < int > updateStudent(Student task) async {
    final db = await database;
    return db
      .update(kTableName1, task.toJson(), where: 'id = ?', whereArgs: [task.id]);
  }


  /**查
   * 
   */
  Future < List < Student >> getAllStudent() async {
    final db = await database;
    var result = await db.query(kTableName1);
    return result.map((it) => Student.fromJson(it)).toList();
  }

  Future < List< Student> > getOneStudent(Student task) async {
    final db = await database;
    var result = await db.query(kTableName1, where: 'id = ?', whereArgs: [task.id]);
    return result.map((it) => Student.fromJson(it)).toList();
  }

  Future < List< Student> > getOneStudentByNum(Student task) async {
    final db = await database;
    var result = await db.query(kTableName1, where: 'number = ?', whereArgs: [task.number]);
    return result.map((it) => Student.fromJson(it)).toList();
  }

  


  Future < String > get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  closeDB() {
    if (_database != null) {
      _database.close();
    }
  }
}