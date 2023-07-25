import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  GestureTapCallback ? onTap;

  CustomButton({
    required this.onTap
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue
        ),
        child: Center(
          child: Text("Submit",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          )
          ),
      ),
    );
  }
}