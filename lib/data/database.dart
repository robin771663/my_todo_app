import 'package:hive/hive.dart';

class TodoDatabase{
//create a list of tasks
List todoList = [];

//referane our box
  final myBox=Hive.box("mybox");

//create the default data
void createInitialData() {
  todoList = [
    ["Make a video", false],
    ["Make a video", false],
    ["Make a video", false],
  ];

}
//load the data 
void loadData() {
  todoList = myBox.get("TODOLIST");
}
//update the database
void updateDataBase() {
  myBox.put("TODOLIST", todoList);

}}