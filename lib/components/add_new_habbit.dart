import 'package:flutter/material.dart';
import 'package:habbit_tracker/components/reusable_button.dart';

class AddNewHabit extends StatelessWidget {
  const AddNewHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 160,
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
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
                    height: 50,
                    width: 100,
                    buttonColor: Colors.red,
                    buttonText: 'Cancel',
                  ),
                  ReusableButton(
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
