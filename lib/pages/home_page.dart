import 'package:flutter/material.dart';
import 'package:habbit_tracker/model/habbit_list_model.dart';

import '../components/habbit_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //list of habbits
    List<HabbitListModel> habbitList = [
      HabbitListModel(habbitText: 'Code app', habbitStatus: false),
      HabbitListModel(habbitText: 'love her more', habbitStatus: true),
    ];

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return habbitTile();
        },
      ),
    );
  }
}
