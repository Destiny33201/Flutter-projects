import 'package:flutter/material.dart';
import 'package:flutter_application_2/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        color: Theme.of(context).primaryColor,
        
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder( ),
                hintText: "Add a new task",),
            ),

            // buttons

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
              //save button

              MyButton(text: "save", onPressed: onSave),


              //cancel button
              MyButton(text: "cancel", onPressed: onCancel ),

              
            ],)
          ],
        ),
      ),
    );
  }
}