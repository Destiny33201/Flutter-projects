import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  //reference the box

  List toDoList = [];

  final _myBox = Hive.box('mybox');
  
  void createInitialData(){

    toDoList = [
      ["Take a Shower", false],
      ["Make Breakfast", false],
    ];
  }
  //load the data from the database
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  //update the data in the database
  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }
}