import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todoList = [];

  final _mybox = Hive.box('mybox');

  void createIntialData() {
    todoList = [
      ["Create task by clicking add bottun on bottom", false],
      ["Swipe left to delete", false],
    ];
  }

  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  void updateDatabase() {
    _mybox.put("TODOLIST", todoList);
  }
}
