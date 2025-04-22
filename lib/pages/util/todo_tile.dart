import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)?  deleteFunction;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged, required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Slidable(
        endActionPane: ActionPane(motion: ScrollMotion(), children:[
          SlidableAction(
            onPressed: deleteFunction,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(12.0),
          ),
        ] ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12.0),
          ),
        
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
                checkColor: Colors.yellow,
              ),
              //task name
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 18.0,
                  decoration: taskCompleted ? TextDecoration.lineThrough : null, decorationThickness: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
