// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_todo_app/pages/util/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
       content: SizedBox(height: 120,
       child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //get user input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Add a new task",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
          //buttons==>save and cancel
          Row(children: [
            //save button
            Button(text: "Save", onPressed:onSave),
            const SizedBox(width: 70,),
            //cancel button
            Button(text: "Cancel", onPressed: onCancel),
          ],),
        ],
       ),
       ),
    );
  }}