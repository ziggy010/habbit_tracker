import 'package:flutter/material.dart';
import 'package:habbit_tracker/data/habbit_database.dart';
import 'package:hive/hive.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../components/add_new_habbit.dart';
import '../components/habbit_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _myBox = Hive.box("Hive_database");

  HabbitDatabase db = HabbitDatabase();

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (_myBox.get('Current_habit_list') == null) {
      db.createInitalizationData();
    } else {
      db.loadData();
    }

    print(_myBox.get('Current_habit_list'));

    super.initState();
  }

  // function to change the checkbox status

  void checkBoxTapped(bool initialValue, int index) {
    setState(() {
      db.habbitList[index][1] = initialValue;
    });
    db.updateDatabase();
  }

  //function to save the habbit
  void saveNewHabbit() {
    setState(() {
      db.habbitList.add(
        [_controller.text, false],
      );
    });
    db.updateDatabase();
    print(_myBox.get('Current_habit_list'));
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
      db.habbitList.removeAt(index);
    });
    db.updateDatabase();
  }

  //function to edit habbit
  editHabit(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AddNewHabit(
          hintText: db.habbitList[index][0],
          onSave: () {
            setState(() {
              db.habbitList[index][0] = _controller.text;
            });
            db.updateDatabase();
            Navigator.of(context).pop();
            _controller.clear();
          },
          onCancel: cancelDialogBox,
          controller: _controller,
        );
      },
    );
  }

  //to load data
  Future<void> onRefreshLoad() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: LiquidPullToRefresh(
        backgroundColor: Colors.deepPurple.shade300,
        height: 250,
        animSpeedFactor: 2,
        color: Colors.deepPurple,
        onRefresh: onRefreshLoad,
        child: ListView.builder(
          itemCount: db.habbitList.length,
          itemBuilder: (BuildContext context, int index) {
            return HabbitTile(
              habbitStatus: db.habbitList[index][1],
              habbitText: db.habbitList[index][0],
              onChanged: (value) {
                checkBoxTapped(value!, index);
              },
              onDelete: (context) => deleteHabit(index),
              onEdit: (context) => editHabit(index),
            );
          },
        ),
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
