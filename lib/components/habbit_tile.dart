import 'package:flutter/material.dart';

class HabbitTile extends StatelessWidget {
  bool habbitStatus;
  String habbitText;
  Function(bool?)? onChanged;

  HabbitTile({
    required this.habbitStatus,
    required this.habbitText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24,
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
    );
  }
}
