import 'package:flutter/material.dart';

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
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
