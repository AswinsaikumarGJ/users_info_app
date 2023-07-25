import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  double? w;
  String? labeltext;
  TextInputType? keyboardtype;
  TextEditingController? controller;
  CustomTextFormField({
    required this.w,
    required this.labeltext,
    required this.controller,
    this.keyboardtype,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: widget.h,
      width: widget.w,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardtype,
        decoration: InputDecoration(
            labelText: widget.labeltext,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
