import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

var myBox = Hive.box("Hive_Database");

class HabbitDatabase {
  List habbitList = [];

  //if the app is opened for the first time initializing default data
  void createInitalizationData() {
    habbitList = [
      ['Do exercise', false],
      ['Code app', false],
    ];
  }

  //if the app is not opened for the first time then we shoul;d load data.
  void loadData() {
    habbitList = myBox.get('Current_habit_list');
  }

  //function to update the database
  void updateDatabase() {
    myBox.put('Current_habit_list', habbitList);
  }
}
