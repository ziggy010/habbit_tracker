import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabbitTile extends StatelessWidget {
  bool habbitStatus;
  String habbitText;
  Function(bool?)? onChanged;
  Function(BuildContext)? onEdit;
  Function(BuildContext)? onDelete;

  HabbitTile({
    required this.habbitStatus,
    required this.habbitText,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            // to edit habbitt
            SlidableAction(
              onPressed: onEdit,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),

            //to delete habbit
            SlidableAction(
              onPressed: onDelete,
              backgroundColor: Colors.red.shade500,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade500,
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Checkbox(
                  value: habbitStatus,
                  onChanged: onChanged,
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.green.withOpacity(.32);
                    }
                    return Colors.green;
                  }),
                ),
                Text(
                  habbitText,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'poppins',
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
