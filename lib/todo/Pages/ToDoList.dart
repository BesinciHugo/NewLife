import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'alarmPage.dart';

class ToDoList extends StatelessWidget {
    final String taskName;
    final bool taskCompleted;
    Function(bool?) ? onChanged;
    Function(BuildContext)? deleteFunction;

    ToDoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {



    return Padding(padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(
        motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color.fromRGBO(51, 44, 57, 1),
              borderRadius: BorderRadius.circular(10),
            )
          ],
    ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [

            Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Color.fromRGBO(201, 44, 109, 1)),

            Expanded(child: Text(taskName, style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none)),),

            IconButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => alarmPage()));},
                icon: Icon(Icons.add_alarm))

          ],
        ),
        decoration:BoxDecoration(
          color: Color.fromRGBO(96, 158, 162, 1),
          borderRadius: BorderRadius.circular(12)
        ),
      ),
    )
    );
  }
}

