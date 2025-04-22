import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_todo_app/data/database.dart';
import 'package:my_todo_app/pages/util/dialog_box.dart';
import 'package:my_todo_app/pages/util/todo_tile.dart';

class HomePage extends StatefulWidget {
 
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //reference to the hive box
  final myBox=Hive.box("mybox");
  TodoDatabase db =TodoDatabase();


@override
  void initState() {
    //if this is the first time opening the app, then create default data
    if(myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      //the database is already created, so load the data
      db.loadData();
    }
    super.initState();
  }

final TextEditingController controller = TextEditingController();

 
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      db.updateDataBase();
    });
  }
  //Save New Task
  void saveNewTask(){
    setState(() {
      db.todoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  //Create a New Task
void createNewTask() {
  showDialog(context: context, builder: (context) {
    return DialogBox(
      controller: controller, onSave:saveNewTask, onCancel: Navigator.of(context).pop,
    );
  },);
}

  //Delete Task
  void deletTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
      db.updateDataBase();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('My Todo App'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.yellow[200],
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFunction:  (value) => deletTask(index) ,
          );
        },
      ),
    );
  }
}
