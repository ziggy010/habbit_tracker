import 'package:flutter/material.dart';
import 'package:habbit_tracker/model/habbit_tile_model.dart';

import '../components/add_new_habbit.dart';
import '../components/habbit_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();

  List<HabbitTileModel> habbitList = [
    HabbitTileModel(habbitText: 'Do Exercise', habbitStatus: false),
    HabbitTileModel(habbitText: 'Code App', habbitStatus: true),
  ];

  // function to change the checkbox status

  void checkBoxTapped(bool initialValue, int index) {
    setState(() {
      habbitList[index].habbitStatus = initialValue;
    });
  }

  //function to save the habbit
  void saveNewHabbit() {
    setState(() {
      habbitList.add(
        HabbitTileModel(
          habbitText: _controller.text,
          habbitStatus: false,
        ),
      );
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  //function to cancel the dialog box
  void cancelDialogBox() {
    Navigator.of(context).pop();
    _controller.clear();
  }

  //function to delete habit
  void deleteHabit(int index) {
    setState(() {
      habbitList.removeAt(index);
    });
  }

  //function to edit habbit
  editHabit(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AddNewHabit(
          hintText: habbitList[index].habbitText,
          onSave: () {
            setState(() {
              habbitList[index].habbitText = _controller.text;
            });
            Navigator.of(context).pop();
            _controller.clear();
          },
          onCancel: cancelDialogBox,
          controller: _controller,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: ListView.builder(
        itemCount: habbitList.length,
        itemBuilder: (BuildContext context, int index) {
          return HabbitTile(
            habbitStatus: habbitList[index].habbitStatus,
            habbitText: habbitList[index].habbitText,
            onChanged: (value) {
              checkBoxTapped(value!, index);
            },
            onDelete: (context) => deleteHabit(index),
            onEdit: (context) => editHabit(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple.shade600,
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.green,
          ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddNewHabit(
                hintText: 'Enter habbit name..',
                controller: _controller,
                onSave: saveNewHabbit,
                onCancel: cancelDialogBox,
              );
            },
          );
        },
      ),
    );
  }
}
