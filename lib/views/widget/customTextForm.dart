import 'package:flutter/material.dart';

import '../constnts.dart';

class customTextForm extends StatelessWidget {
  const customTextForm({super.key, required this.Hint,  this.maxLines=1});

final String Hint;
final int maxLines;

  @override
  Widget build(BuildContext context) {
    return   TextField(
            maxLines:maxLines ,
              cursorColor: KprimaryColor,
              decoration: InputDecoration(
                hintText: Hint,
              
                border: buildBorder(),
                enabledBorder: buildBorder(),
                focusedBorder: buildBorder(KprimaryColor),
              ));
  }
   OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.grey.shade300));
  }
}