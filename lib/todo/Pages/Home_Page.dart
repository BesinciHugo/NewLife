import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/dataBase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ToDoList.dart';
import 'taskAddBox.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState(){
  if (_myBox.get("TODOLIST") == null) {
    db.createInitialData();
  }else {
    db.loadData();
  }

    super.initState();
  }


  final _controller = TextEditingController();

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void createNewTask () {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller ,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        }
    );
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }


  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDataBase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 238, 237, 1) ,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(201, 44, 109, 1),
        title:Text("First Day Of My New Life", style: GoogleFonts.dancingScript(fontSize: 25),),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index){
            return ToDoList(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChange(value, index),
                deleteFunction: (context) => deleteTask(index),
            );
          }
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(201, 44, 109, 1),
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}