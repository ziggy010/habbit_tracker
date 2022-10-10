import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  double height;
  double width;
  Color buttonColor;
  String buttonText;
  final VoidCallback onTap;

  ReusableButton({
    required this.height,
    required this.width,
    required this.buttonColor,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'poppins',
            fontSize: 16,
          ),
        )),
      ),
    );
  }
}
