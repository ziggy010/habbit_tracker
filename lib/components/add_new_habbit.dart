import 'package:flutter/material.dart';
import 'package:habbit_tracker/components/reusable_button.dart';

class AddNewHabit extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  final controller;
  final String hintText;

  AddNewHabit({
    required this.onSave,
    required this.onCancel,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade800,
      content: Container(
        height: 150,
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: controller,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey.shade200,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade200,
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
