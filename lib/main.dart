import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_todo_app/pages/home_page.dart';

void main() async{

  //init thw hive 
  await Hive.initFlutter();

  //open the box
  var box =await Hive.openBox("mybox");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}