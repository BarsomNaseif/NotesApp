import 'package:flutter/material.dart';
import 'package:notes_app/views/constnts.dart';
import 'package:notes_app/views/widget/addNoteBottomSheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => const AddNoteBottomSheet());
        },
        child: Icon(Icons.add,color: Colors.black,),
        backgroundColor: KprimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      );
  }
}