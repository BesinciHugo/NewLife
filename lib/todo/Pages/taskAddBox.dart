import 'package:flutter/material.dart';
import 'MyButtons.dart';

class DialogBox  extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;



  DialogBox ({super.key, required this.controller, required this.onSave, required this.onCancel,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(210, 44, 109, 1),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
          TextField(
            controller: controller ,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(96, 158, 162, 1),
              hintText: "type here!",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(96, 158, 162, 1)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(96, 158, 162, 1)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButtons(text: "Save", onPressed: onSave),

              MyButtons(text: "Cancel", onPressed: onCancel)
            ],
          )


        ],),
      ),
    );
  }
}
