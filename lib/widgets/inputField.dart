import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget {
  final TextEditingController textController;
  InputField({this.textController});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: widget.textController,
      padding: const EdgeInsets.all(10.0),
      textCapitalization: TextCapitalization.words,
      placeholder: 'Enter Title',
      style: GoogleFonts.quicksand(fontSize: 17, fontWeight: FontWeight.w500),
      clearButtonMode: OverlayVisibilityMode.editing,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(.6),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 6,
            offset: Offset(1, 3),
          )
        ],
      ),
    );
  }
}
