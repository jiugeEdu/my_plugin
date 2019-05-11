import './sqlite_db.dart';
import './student_model.dart';
import './course_model.dart';


class SqliteMgr {
  factory SqliteMgr() => _getInstance();
  static SqliteMgr get instance => _getInstance();
  static SqliteMgr _instance;
  SqliteMgr._internal() {}
  static SqliteMgr _getInstance() {
    if (_instance == null) {
      _instance = new SqliteMgr._internal();
    }
    return _instance;
  }


  void insertAllTest() {
    Student task1 = Student('name1', number: 20092541, levelWeight: 1);
    Student task2 = Student('name2', number: 20092542, levelWeight: 1);
    Student task3 = Student('name3', number: 20092543, levelWeight: 2);
    Student task4 = Student('name4', number: 20092544, levelWeight: 4);
    List < Student > tasks = [task1, task2, task3, task4];

    Course course1 = Course(2, studentId: task1.id, isCompleted: 0);
    Course course2 = Course(3, studentId: task2.id, isCompleted: 1);
    Course course3 = Course(4, studentId: task3.id, isCompleted: 0);
    Course course4 = Course(5, studentId: task4.id, isCompleted: 0);

    DBProvider.db.insertAllStudent(tasks);

    DBProvider.db.insertCourse(course1);
    DBProvider.db.insertCourse(course2);
    DBProvider.db.insertCourse(course3);
    DBProvider.db.insertCourse(course4);
  }


  Future < int > insertOneTest() async {
    Student task1 = Student('name5', number: 20092545, levelWeight: 5);
    Course course1 = Course(115, studentId: task1.id, isCompleted: 110);

    int result1 = 0;
    int result2 = 0;
    try {
      result1 = await DBProvider.db.insertStudent(task1);
      result2 = await DBProvider.db.insertCourse(course1);
    } catch (e) {
    }
    return result1 + result2;
  }


  Future < String > deleteOneStu() async {
    Student stu = Student('name5', number: 20092545, levelWeight: 5);
    List<Student> stuList = await DBProvider.db.getOneStudentByNum(stu);
    if(stuList.length <= 0) {
      return '查询失败';
    }

    Student oneStu = stuList[0];
    print(oneStu.id);
    await DBProvider.db.removeStudentTwo(oneStu);

    List<Student> stuList2 = await DBProvider.db.getOneStudentByNum(stu);
    if(stuList2.length <= 0) {
      return '删除成功';
    }
    return '删除失败';
  }


}