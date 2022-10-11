import 'package:flutter/material.dart';
import 'package:habbit_tracker/components/reusable_button.dart';

class AddNewHabit extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  final controller;

  AddNewHabit({
    required this.onSave,
    required this.onCancel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 160,
        child: Column(
          children: [
            TextField(
              controller: controller,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableButton(
                    onTap: onCancel,
                    height: 50,
                    width: 100,
                    buttonColor: Colors.red,
                    buttonText: 'Cancel',
                  ),
                  ReusableButton(
                    onTap: onSave,
                    height: 50,
                    width: 100,
                    buttonColor: Colors.green,
                    buttonText: 'Save',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
