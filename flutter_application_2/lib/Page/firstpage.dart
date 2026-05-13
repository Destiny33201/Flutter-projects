import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/database.dart';
import 'package:flutter_application_2/util/dialog_box.dart';
import 'package:flutter_application_2/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {

  //reference hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState(){

    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();
  


  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = ! db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void deleteTask(int index){
    setState(() {
       db.toDoList.removeAt(index);
    });
    db.updateDataBase();

  }

  // save new task

void saveNewTask(){
  setState(() {
     db.toDoList.add([_controller.text, false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  db.updateDataBase(); 
}
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=> Navigator.of(context).pop,);
      },
      );
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("This is a App Bar"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask 
      ,
      child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount:  db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName:  db.toDoList[index][0], 
            taskCompleted:  db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            ); 
        },
      )
      
    );
  }
}