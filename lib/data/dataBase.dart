import 'package:hive/hive.dart';

class ToDoDataBase {

  List toDoList = [];

  final _myBox = Hive.box("myBox");

  void createInitialData(){
    toDoList = [
      ["Add some task on me!!", false],
      ["If you want delete task just slide this!!", false]
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST",toDoList);
  }
}